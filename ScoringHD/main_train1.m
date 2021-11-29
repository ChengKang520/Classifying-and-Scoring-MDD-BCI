

%%*************************************************************************
% To analyze the EEG data by deep learning
% C Kang
% kangkangsome@gmail.com
%%*************************************************************************
% Name��                  Score��
%
% 1、chensenzhao             18
% 2、chenweiqiao             22
% 3、dengliya                19
% 4、fangjiakang             26
% 5、hanwantong              20
% 6、huangpeiting            21
% 7、liuchang                18
% 8、liuhuiming              26
% 9、lixueyin                22
% 10、lvpinli                22
% 11、liujt                  31
% 12、tanjinyu               20
% 13、wutingshu              20
% 14、wuwenqiang             20
% 15、yulimei                34
% 16、zhangyi                24
% *****************************************************************
% 17、dengxiuli              23
% 18、lizhao                 19
% 19、guanxiongqiang         22
% 20、dingfuchang            26
% *****************************************************************
clear all;
close all;
workspace_addr = 'D:\Shenzhen U\EEG data\EEG_deeplearning\Cassification2_HD_BackClassify_and_ScroingDepression\ScoringDepression_nback\'
cd(workspace_addr);

tasks = 3; % 0-back, 1-back, 2-back
Trail_numH = [60 58 59 58 58 22 57 60 56 56 58 58 58 49 59;
    57 55 60 56 56 14 49 59 58 57 56 54 58 45 59;
    58 53 54 58 55 17 56 54 59 55 54 52 58 60 56];
load('.\Trail_back0_numD.mat');
load('.\Trail_back1_numD.mat');
load('.\Trail_back2_numD.mat');
Trail_numD = [Trail_back0_numD; Trail_back1_numD; Trail_back2_numD];

% K fold cross validation
Kfold = 5;
indicesH = crossvalind('Kfold', size(Trail_numH, 2), Kfold);
indicesD = crossvalind('Kfold', size(Trail_numD, 2), Kfold);

Result_all = cell(2,tasks);
Result_all_Nback = cell(1,Kfold);
for k = 1:Kfold
    k
    for task = 1:tasks
        task
        %% load data
        if task == 1
            EEGDataH = load('..\NbackData\EEGData_Hback0.mat');
            size_EEGDataH = size(EEGDataH.EEGdata_back0);
            
            EEGDataD = load('..\ScoringDepression_nback\EEGdata_back0.mat');
            size_EEGDataD = size(EEGDataD.EEGdata_back0);
            % distribute EEG data
            EEGDataD = reshape(EEGDataD.EEGdata_back0(:,:,1:64*18), [size_EEGDataD(1), size_EEGDataD(2), 64, 18]);
%             EEGDataD = permute(EEGDataD, [2 3 4 1]);
            EEGDataH = reshape(EEGDataH.EEGdata_back0(:,:,1:64*18), [size_EEGDataH(1), size_EEGDataH(2), 64, 18]);
%             EEGDataH = permute(EEGDataH, [2 3 4 1]);
            
            EEGDataD_label = load('..\ScoringDepression_nback\EEGData_back0_label.mat');
            EEGDataD_label = EEGDataD_label.EEGData_back0_label;
            
            EEGDataH_label = ones(1, size_EEGDataH(1)) * 7;
            
        else if task == 2
                EEGDataH = load('..\NbackData\EEGData_Hback1.mat');
                size_EEGDataH = size(EEGDataH.EEGdata_back1);
                
                EEGDataD = load('..\ScoringDepression_nback\EEGdata_back1.mat');
                size_EEGDataD = size(EEGDataD.EEGdata_back1);
                % distribute EEG data
                EEGDataD = reshape(EEGDataD.EEGdata_back1(:,:,1:64*18), [size_EEGDataD(1), size_EEGDataD(2), 64, 18]);
%                 EEGDataD = permute(EEGDataD, [2 3 4 1]);
                EEGDataH = reshape(EEGDataH.EEGdata_back1(:,:,1:64*18), [size_EEGDataH(1), size_EEGDataH(2), 64, 18]);
%                 EEGDataH = permute(EEGDataH, [2 3 4 1]);
                
                EEGDataD_label = load('..\ScoringDepression_nback\EEGData_back1_label.mat');
                EEGDataD_label = EEGDataD_label.EEGData_back1_label;
                
                EEGDataH_label = ones(1, size_EEGDataH(1)) * 7;
            else if task == 3
                    EEGDataH = load('..\NbackData\EEGData_Hback2.mat');
                    size_EEGDataH = size(EEGDataH.EEGdata_back2);
                    
                    EEGDataD = load('..\ScoringDepression_nback\EEGdata_back2.mat');
                    size_EEGDataD = size(EEGDataD.EEGdata_back2);
                    % distribute EEG data
                    EEGDataD = reshape(EEGDataD.EEGdata_back2(:,:,1:64*18), [size_EEGDataD(1), size_EEGDataD(2), 64, 18]);
%                     EEGDataD = permute(EEGDataD, [2 3 4 1]);
                    EEGDataH = reshape(EEGDataH.EEGdata_back2(:,:,1:64*18), [size_EEGDataH(1), size_EEGDataH(2), 64, 18]);
%                     EEGDataH = permute(EEGDataH, [2 3 4 1]);
                    
                    EEGDataD_label = load('..\ScoringDepression_nback\EEGData_back2_label.mat');
                    EEGDataD_label = EEGDataD_label.EEGData_back2_label;
                    
                    EEGDataH_label = ones(1, size_EEGDataH(1)) * 7;
                end
            end
        end
        
        %  data redistribute;
        testH = (indicesH == k);  %test index
        trainH = ~testH;  %train index
        testD = (indicesD == k); %test index
        trainD = ~testD;  %train index
        
        % distribute and arrange the data of depression and healthy
        trainDataH = [];
        testDataH = [];
        trainDataHLabels = [];
        testDataHLabels = [];
        for iH = 1: length(testH)
            Data_temp = [];
            Data_tempLabels = [];
            to_H = sum(Trail_numH(task,1:iH));
            from_H = to_H - Trail_numH(task,iH) + 1;
            
            Data_temp = EEGDataH(from_H:to_H,:,:,:);
            Data_tempLabels = EEGDataH_label(from_H:to_H);
            
            if testH(iH) == 0
                trainDataH = [trainDataH; Data_temp];
                trainDataHLabels = [trainDataHLabels Data_tempLabels];
            elseif testH(iH) == 1
                testDataH = [testDataH; Data_temp];
                testDataHLabels = [testDataHLabels Data_tempLabels];
            end
        end
        
        trainDataD = [];
        testDataD = [];
        trainDataDLabels = [];
        testDataDLabels = [];
        for iD = 1:length(testD)
            Data_temp = [];
            Data_tempLabels = [];
            to_D = sum(Trail_numD(task,1:iD));
            from_D = to_D - Trail_numD(task,iD) + 1;
            
            Data_temp = EEGDataD(from_D:to_D,:,:,:);
            Data_tempLabels = EEGDataD_label(from_D:to_D);
            
            if testD(iD) == 0
                trainDataD = [trainDataD; Data_temp];
                trainDataDLabels = [trainDataDLabels Data_tempLabels];
            elseif testD(iD) == 1
                testDataD = [testDataD; Data_temp];
                testDataDLabels = [testDataDLabels Data_tempLabels];
            end
        end

        clear EEGDataD
        clear EEGDataH
        
        train = []; validation = []; test = [];
        train.Features = [trainDataH; trainDataD];       
        train.Labels = [trainDataHLabels trainDataDLabels];
        range_data = randperm(length(train.Labels));
        train.Features = train.Features(range_data,:,:,:);
        train.Features = permute(train.Features, [2 3 4 1]);
        train.Labels = train.Labels(range_data);
        
        validationLength = floor((size(trainDataD,1)+size(trainDataD,1))*0.1);
        validation.Features = train.Features(:,:,:,1:validationLength);
        validation.Labels = train.Labels(1:validationLength);
        
        test.Features = [testDataH; testDataD];
        test.Features = permute(test.Features, [2 3 4 1]);
        test.Labels = [testDataHLabels testDataDLabels];
        
        clear trainDataD
        clear trainDataH
        
        %% Construct Network
        numClasses = 1; % the number of classes
        netWidth = 64;
        numUnits = 6;
        lgraph = residualCIFARlgraph(netWidth,numUnits,"standard");
%         analyzeNetwork(lgraph); % show the structure of designed neural network
        
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
        
        %% Save Data
save_testFeature_name = strcat('testFeature_Nback', num2str(task-1),'Fold',num2str(k));
save([workspace_addr, save_testFeature_name], 'test');
save_netTransfer_name = strcat('netTransfer_Nback', num2str(task-1),'Fold',num2str(k));
save([workspace_addr, save_netTransfer_name], 'netTransfer');

        %% Predict and Plot figures
        predictedLabels = predict(netTransfer, test.Features);
        accuracy_matrix(k) = sum(predictedLabels==test.Labels')/numel(predictedLabels)
        
        figure;
        predictedLabels(find(predictedLabels>30)) = 30;
        predictedLabels = smooth(predictedLabels, 5);
        plot(test.Labels, 'r');hold on;
        plot(predictedLabels, 'b');hold off;
save_figure_name = strcat('Figure_Nback', num2str(task-1),'Fold',num2str(k));
saveas(gcf, [workspace_addr, save_figure_name], 'fig');
close all;

        %% Plot the single person's performance
        Trail_testH = [];
        Trail_testH = Trail_numH(task,:).*testH';
        Trail_testH(find(Trail_testH==0)) = [];
        figure;
        for i = 1:length(Trail_testH)
            to_i = sum(Trail_testH(1:i));
            from_i = to_i - Trail_testH(i) + 1;
            accuracy_H(i) = sum(predictedLabels(from_i:to_i)==test.Labels(from_i:to_i)')/numel(predictedLabels(from_i:to_i));
            subplot(length(Trail_testH),1,i);
            plot(predictedLabels(from_i:to_i),'r');hold on;
            plot(test.Labels(from_i:to_i),'k');hold off;
            grid on;
        end
        Trail_testD = [];
        Trail_testD = Trail_numD(task,:).*testD';
        Trail_testD(find(Trail_testD==0)) = [];
        figure;
        for j = 1:length(Trail_testD)
            to_j = sum(Trail_testD(1:j)) + to_i;
            from_j = to_j - Trail_testD(j) + 1;
            accuracy_D(j) = sum(predictedLabels(from_j:to_j)==test.Labels(from_j:to_j)')/numel(predictedLabels(from_j:to_j));
            subplot(length(Trail_testD),1,j);
            plot(predictedLabels(from_j:to_j),'r');hold on;
            plot(test.Labels(from_j:to_j),'k');hold off;
            grid on;
        end
        Result_all(1,task) = {accuracy_H};
        Result_all(2,task) = {accuracy_D};
    end
    
    Result_all_Nback(k) = {Result_all};
    
end

save Result_all_Nback Result_all_Nback


