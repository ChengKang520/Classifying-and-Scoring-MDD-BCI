

%%*************************************************************************
% To analyze the EEG data by deep learning
% C Kang
% kangkangsome@gmail.com
%%*************************************************************************
% Name£º                  Score£º
% 
% 1¡¢chensenzhao             18
% 2¡¢chenweiqiao             22	
% 3¡¢dengliya                19
% 4¡¢fangjiakang             26
% 5¡¢hanwantong              20
% 6¡¢huangpeiting            21
% 7¡¢liuchang                18
% 8¡¢liuhuiming              26
% 9¡¢lixueyin                22
% 10¡¢lvpinli                22
% 11¡¢liujt                  31
% 12¡¢tanjinyu               20
% 13¡¢wutingshu              20
% 14¡¢wuwenqiang             20
% 15¡¢yulimei                34
% 16¡¢zhangyi                24
% *****************************************************************
% 17¡¢dengxiuli              23
% 18¡¢lizhao                 19
% 19¡¢guanxiongqiang         22
% 20¡¢dingfuchang            26
% *****************************************************************
clear all;
close all;
workspace_addr = 'D:\Shenzhen U\EEG data\EEG_deeplearning\Cassification2_HD_BackClassify_and_ScroingDepression\ScoringDepression_nback\'
cd(workspace_addr);


% load('EEGData.mat');
% load('EEGData_label.mat');
% 
% length_data = length(EEGData_label);
% range_data = randperm(length_data);
% EEGData_label = EEGData_label(range_data);
% EEGdata = EEGdata(range_data, :, :);
% 
% EEGdata = EEGdata(:,:,1:64*18);
% size_EEGData = size(EEGdata);
% EEGdata = reshape(EEGdata, [size_EEGData(1), size_EEGData(2), 64, 18]);
% 
% save EEGData_Scoring EEGdata
% save EEGData_label EEGData_label


% 
% %% load data
% EEGDataH = load('../NbackData/EEGData_Hback0.mat');
% size_EEGDataH = size(EEGDataH.EEGdata_back0);
% trainLengthH = floor(size_EEGDataH(1)*0.8);
% 
% EEGDataD = load('../NbackData/EEGData_Dback0.mat');
% size_EEGDataD = size(EEGDataD.EEGdata_back0);
% trainLengthD = floor(size_EEGDataD(1)*0.8);
% 
% EEGDataD.EEGdata_back0 = reshape(EEGDataD.EEGdata_back0(:,:,1:64*18), [size_EEGDataD(1), size_EEGDataD(2), 64, 18]);
% EEGDataH.EEGdata_back0 = reshape(EEGDataH.EEGdata_back0(:,:,1:64*18), [size_EEGDataH(1), size_EEGDataH(2), 64, 18]);
% 
% train.Features = double([EEGDataD.EEGdata_back0(1:trainLengthD,:,:,:); EEGDataH.EEGdata_back0(1:trainLengthH,:,:,:)]);
% train.Labels = categorical([ones(1,trainLengthD)*2 ones(1,trainLengthH)]);
% range_data = randperm(length(train.Labels));
% train.Features = train.Features(range_data,:,:,:);
% train.Features = permute(train.Features, [2 3 4 1]);
% train.Labels = train.Labels(range_data);
% 
% validationLength = floor((trainLengthD+trainLengthH)*0.1);
% validation.Features = train.Features(:,:,:,1:validationLength);
% validation.Labels = train.Labels(1:validationLength);
% 
% test.Features = double([EEGDataD.EEGdata_back0(trainLengthD+1:end,:,:,:); EEGDataH.EEGdata_back0(trainLengthH+1:end,:,:,:)]);
% test.Features = permute(test.Features, [2 3 4 1]);
% test.Labels = categorical([ones(1,size_EEGDataD(1)-trainLengthD)*2 ones(1,size_EEGDataH(1)-trainLengthH)]);
% 
% save train0 train
% save validation0 validation
% save test0 test


%% load data
load('EEGData_Scoring.mat');
load('EEGData_label.mat');
size_EEGData = size(EEGdata);
EEGdata = permute(EEGdata, [2 3 4 1]);
%------
% EEGData_all = EEGData_all(:,:,1:3,:);
%------

trainFeatures = double(EEGdata(:,:,:,1:783));
trainLabels = EEGData_label(1:783);
validationFeatures = trainFeatures(:,:,:,1:78);
validationLabels = trainLabels(1:78);
testFeatures = double(EEGdata(:,:,:,783:end));
testLabels = EEGData_label(783:end);
clear EEGData
clear EEGData_label



% [XTrain,~,YTrain] = digitTrain4DArrayData;
% [XValidation,~,YValidation] = digitTest4DArrayData;
% trainFeatures = XTrain;
% trainLabels = YTrain;
% validationFeatures = XValidation;
% validationLabels = YValidation;

%% Construct Network
numClasses = 1; % the number of classes
netWidth = 64;
numUnits = 6;
lgraph = residualCIFARlgraph(netWidth,numUnits,"standard");
analyzeNetwork(lgraph); % show the structure of designed neural network

miniBatchSize = 32;
learnRate = 0.01;
options = trainingOptions('adam', ...
    'InitialLearnRate',learnRate, ...
    'MaxEpochs',15, ...
    'MiniBatchSize',miniBatchSize, ...
    'Shuffle','every-epoch', ...
    'Plots','training-progress', ...
    'Verbose',false, ...
    'ValidationData',{validationFeatures, validationLabels'}, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropFactor',0.1, ...
    'LearnRateDropPeriod',10);

netTransfer = trainNetwork(trainFeatures, trainLabels', lgraph, options);

%% Plot figures

YPredicted = predict(netTransfer,testFeatures);
figure;
plot(YPredicted, 'r');hold on;
plot(testLabels, 'b');hold off;

predictionError = testLabels' - YPredicted;
thr = 10;
numCorrect = sum(abs(predictionError) < thr);
numValidationImages = numel(testLabels');

accuracy = numCorrect/numValidationImages
squares = predictionError.^2;
rmse = sqrt(mean(squares))

residualMatrix = reshape(predictionError(1:190),19,10);
figure
boxplot(residualMatrix,...
    'Labels',{'0','1','2','3','4','5','6','7','8','9'})
xlabel('Digit Class')
ylabel('Degrees Error')
title('Residuals')

idx = randperm(numValidationImages,49);
for i = 1:numel(idx)
    image = testFeatures(:,:,:,idx(i));
    predictedAngle = testLabels(idx(i));  
    imagesRotated(:,:,:,i) = imrotate(image,predictedAngle,'bicubic','crop');
end
figure
subplot(1,2,1)
montage(testFeatures(:,:,:,idx))
title('Original')

subplot(1,2,2)
montage(imagesRotated)
title('Corrected')


