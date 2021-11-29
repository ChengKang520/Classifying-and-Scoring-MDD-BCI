

%%*************************************************************************
% To analyze the EEG data by deep learning
% C Kang
% To clsssify the depression and control based on 0-back
% kangkangsome@gmail.com
%%*************************************************************************

clear all;
close all;
workspace_addr = '..\'
cd(workspace_addr);

Trail_numH = [58 53 54 58 55 17 56 54 59 55 54 52 58 60 56];
Trail_numD = load('.\ScoringDepression_nback\Trail_back2_numD.mat');
Trail_numD = Trail_numD.Trail_back2_numD;

% K fold cross validation
Kfold = 5;
indicesH = crossvalind('Kfold', Trail_numH, Kfold);
indicesD = crossvalind('Kfold', Trail_numD, Kfold);

    %% load data
    EEGDataH = load('./NbackData/EEGData_Hback2.mat');
    size_EEGDataH = size(EEGDataH.EEGdata_back2);
    trainLengthH = floor(size_EEGDataH(1)*0.8);
    
    EEGDataD = load('.\ScoringDepression_nback\EEGdata_back2.mat');
    size_EEGDataD = size(EEGDataD.EEGdata_back2);
    trainLengthD = floor(size_EEGDataD(1)*0.8);
    
    EEGDataD.EEGdata_back2 = reshape(EEGDataD.EEGdata_back2(:,:,1:64*18), [size_EEGDataD(1), size_EEGDataD(2), 64, 18]);
%         EEGDataD.EEGdata_back2 = permute(EEGDataD.EEGdata_back2, [2 3 4 1]);
    EEGDataH.EEGdata_back2 = reshape(EEGDataH.EEGdata_back2(:,:,1:64*18), [size_EEGDataH(1), size_EEGDataH(2), 64, 18]);
%         EEGDataH.EEGdata_back2 = permute(EEGDataH.EEGdata_back2, [2 3 4 1]);

Result_all_back2 = cell(4,Kfold);
for k = 1:Kfold
    
    %  data redistribute;
    testH = (indicesH == k);  %test index
    trainH = ~testH;  %train index
    testD = (indicesD == k); %test index
    trainD = ~testD;  %train index

    % distribute and arrange the data of depression and healthy
    trainDataH = [];
    testDataH = [];
    for iH = 1: length(testH)
        Data_temp = [];
        to_H = sum(Trail_numH(1:iH));
        from_H = to_H - Trail_numH(iH) + 1;
        
        Data_temp = EEGDataH.EEGdata_back2(from_H:to_H,:,:,:); 
        if testH(iH) == 0
            trainDataH = [trainDataH; Data_temp];
        elseif testH(iH) == 1
            testDataH = [testDataH; Data_temp];
        end
    end
     
    trainDataD = [];
    testDataD = [];
    for iD = 1: length(testD)
        Data_temp = [];
        to_D = sum(Trail_numD(1:iD));
        from_D = to_D - Trail_numD(iD) + 1;
        
        Data_temp = EEGDataD.EEGdata_back2(from_D:to_D,:,:,:); 
        if testD(iD) == 0
            trainDataD = [trainDataD; Data_temp];
        elseif testD(iD) == 1
            testDataD = [testDataD; Data_temp];
        end
    end
        
    train.Features = [trainDataH; trainDataD];
    train.Labels = categorical([ones(1,size(trainDataD,1))*2 ones(1,size(trainDataH,1))]);
    range_data = randperm(length(train.Labels));
    train.Features = train.Features(range_data,:,:,:);
    train.Features = permute(train.Features, [2 3 4 1]);
    train.Labels = train.Labels(range_data);
    
    validationLength = floor((trainLengthD+trainLengthH)*0.1);
    validation.Features = train.Features(:,:,:,1:validationLength);
    validation.Labels = train.Labels(1:validationLength);
    
    test.Features = [testDataH; testDataD];
    test.Features = permute(test.Features, [2 3 4 1]);
    test.Labels = categorical([ones(1,size(testDataD,1))*2 ones(1,size(testDataH,1))]);
     

    %% Construct Network
    numClasses = 2; % the number of classes
    netWidth = 64;
    numUnits = 3;
    lgraph = residualCIFARlgraph(netWidth,numUnits,"standard");
%     analyzeNetwork(lgraph); % show the structure of designed neural network
    
    miniBatchSize = 64;
    learnRate = 0.01;
    options = trainingOptions('adam', ...
        'InitialLearnRate',learnRate, ...
        'MaxEpochs',15, ...
        'MiniBatchSize',miniBatchSize, ...
        'Shuffle','every-epoch', ...
        'Verbose',false, ...
        'ValidationData',{validation.Features, validation.Labels'}, ...
        'LearnRateSchedule','piecewise', ...
        'LearnRateDropFactor',0.1, ...
        'LearnRateDropPeriod',10);
    
    netTransfer = trainNetwork(train.Features, train.Labels', lgraph, options);
    
    %% Predict and Plot figures
    predictedLabels = classify(netTransfer, test.Features);
    accuracy_matrix(k) = sum(predictedLabels==test.Labels')/numel(predictedLabels)
    
    %% Plot the single person's performance
    Trail_testH = Trail_numH.*testH';
    Trail_testH(find(Trail_testH==0)) = [];
%     figure;
    for i = 1:length(Trail_testH)
        to_i = sum(Trail_testH(1:i));
        from_i = to_i - Trail_testH(i) + 1;
        accuracy_H(i) = sum(predictedLabels(from_i:to_i)==test.Labels(from_i:to_i)')/numel(predictedLabels(from_i:to_i));
%         subplot(length(Trail_testH),1,i);
%         plot(predictedLabels(from_i:to_i),'r');hold on;
%         plot(test.Labels(from_i:to_i),'k');hold off;
%         grid on;
    end
    Trail_testD = Trail_numD.*testD';
    Trail_testD(find(Trail_testD==0)) = [];
%     figure;
    for j = 1:length(Trail_testD)
        to_j = sum(Trail_testD(1:j)) + to_i;
        from_j = to_j - Trail_testD(j) + 1;
        accuracy_D(j) = sum(predictedLabels(from_j:to_j)==test.Labels(from_j:to_j)')/numel(predictedLabels(from_j:to_j));
%         subplot(length(Trail_testD),1,j);
%         plot(predictedLabels(from_j:to_j),'r');hold on;
%         plot(test.Labels(from_j:to_j),'k');hold off;
%         grid on;
    end
    
    Result_all_back2(1,k) = {Trail_numH};
    Result_all_back2(2,k) = {accuracy_H};
    Result_all_back2(3,k) = {Trail_numD};
    Result_all_back2(4,k) = {accuracy_D};
end

save Result_all_back2 Result_all_back2


