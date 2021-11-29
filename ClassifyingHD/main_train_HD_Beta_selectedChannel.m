

%%*************************************************************************
% To analyze the EEG data by deep learning
% C Kang
% To clsssify the depression and control based on 0-back
% kangkangsome@gmail.com
%%*************************************************************************

clear all;
% close all;
% workspace_addr = 'D:\Shenzhen U\EEG data\EEG_deeplearning\Cassification2_HD_BackClassify_and_ScroingDepression\classifyHD_nback\'
% cd(workspace_addr);
Fs= 500;
tasks = 3; % 0-back, 1-back, 2-back
Trail_numH = [60 58 59 58 58 22 57 60 56 56 58 58 58 49 59;
    57 55 60 56 56 14 49 59 58 57 56 54 58 45 59;
    58 53 54 58 55 17 56 54 59 55 54 52 58 60 56];

% means that: Fz F1 F3 FCz FC1 FC3 FC5 FT7 FT9 T7 CP3 CP2 CP4 CP6 TP8 TP10
selectedChannel = [3 32 17 28 54 24 40 20 64 13 42 23 43 27 57 31];

load('..\ScoringDepression_nback\Trail_back0_numD.mat');
load('..\ScoringDepression_nback\Trail_back1_numD.mat');
load('..\ScoringDepression_nback\Trail_back2_numD.mat');
Trail_numD = [Trail_back0_numD; Trail_back1_numD; Trail_back2_numD];

% K fold cross validation
Kfold = 5;
indicesH = crossvalind('Kfold', size(Trail_numH, 2), Kfold);
indicesD = crossvalind('Kfold', size(Trail_numD, 2), Kfold);

Result_all = cell(2,tasks);
Result_all_Nback = cell(1,Kfold);
Fc1 = 14;
Fc2 = 30;
Order = 2;
for k = 1:Kfold
    k
    for task = 1:tasks
         task
        %% load data
        if task == 1
            EEGDataH = load('..\NbackData\EEGData_Hback0.mat');
            EEGDataH.EEGdata_back0 = EEGDataH.EEGdata_back0(:,selectedChannel,:);
            size_EEGDataH = size(EEGDataH.EEGdata_back0);
            EEGDataH = permute(EEGDataH.EEGdata_back0, [3 1 2]);
            figure;plot(squeeze(EEGDataH(:,1,1)), 'k');hold on;
            EEGDataH = filter(mybandpassfilterIIR_EEG_500(Fs, Fc1, Fc2, Order),EEGDataH);
            plot(squeeze(EEGDataH(:,1,1)), 'r', 'linewidth', 2);hold off;
            legend('Raw EEG', 'Beta Frequency Bands');
            xlabel('Latency(s)', 'FontSize',17);
            ylabel('Altitude(uV)', 'FontSize',17);
            title('Beta bands', 'FontSize', 11);
            set(gca,'XTick',0:200:(size(EEGDataH, 1)));
            set(gca,'XTicklabel',0:(1/(Fs)*200):(1/(Fs)*size(EEGDataH, 1)), 'FontSize',15);
            set(gca,'YTick',-100:50:100);
            set(gca,'YTicklabel',-100:50:100, 'FontSize',15);
            ylim([-100 100]);
            xlim([0 1250]);
            set(gcf,'Position',[100 100 500 500])

            EEGDataH = permute(EEGDataH, [2 3 1]);
            
            EEGDataD = load('..\ScoringDepression_nback\EEGdata_back0.mat');
            EEGDataD.EEGdata_back0 = EEGDataD.EEGdata_back0(:,selectedChannel,:);
            size_EEGDataD = size(EEGDataD.EEGdata_back0);
            EEGDataD = permute(EEGDataD.EEGdata_back0, [3 1 2]);
            EEGDataD = filter(mybandpassfilterIIR_EEG_500(Fs, Fc1, Fc2, Order),EEGDataD);
            EEGDataD = permute(EEGDataD, [2 3 1]);
            
            % distribute EEG data
            EEGDataH = reshape(EEGDataH(:,:,1:64*18), [size_EEGDataH(1), size_EEGDataH(2), 64, 18]);
            EEGDataD = reshape(EEGDataD(:,:,1:64*18), [size_EEGDataD(1), size_EEGDataD(2), 64, 18]);
            
%             EEGDataD_label = load('..\ScoringDepression_nback\EEGData_back0_label.mat');
%             EEGDataD_label = EEGDataD_label.EEGData_back0_label;
%             
%             EEGDataH_label = ones(1, size_EEGDataH(1)) * 7;
            
        else if task == 2
                EEGDataH = load('..\NbackData\EEGData_Hback1.mat');
                EEGDataH.EEGdata_back1 = EEGDataH.EEGdata_back1(:,selectedChannel,:);
                size_EEGDataH = size(EEGDataH.EEGdata_back1);
                EEGDataH = permute(EEGDataH.EEGdata_back1, [3 1 2]);
                EEGDataH = filter(mybandpassfilterIIR_EEG_500(Fs, Fc1, Fc2, Order),EEGDataH);
                EEGDataH = permute(EEGDataH, [2 3 1]);
                
                EEGDataD = load('..\ScoringDepression_nback\EEGdata_back1.mat');
                EEGDataD.EEGdata_back1 = EEGDataD.EEGdata_back1(:,selectedChannel,:);
                size_EEGDataD = size(EEGDataD.EEGdata_back1);
                EEGDataD = permute(EEGDataD.EEGdata_back1, [3 1 2]);
                EEGDataD = filter(mybandpassfilterIIR_EEG_500(Fs, Fc1, Fc2, Order),EEGDataD);
                EEGDataD = permute(EEGDataD, [2 3 1]);
                
                % distribute EEG data
                EEGDataH = reshape(EEGDataH(:,:,1:64*18), [size_EEGDataH(1), size_EEGDataH(2), 64, 18]);
                EEGDataD = reshape(EEGDataD(:,:,1:64*18), [size_EEGDataD(1), size_EEGDataD(2), 64, 18]);
                
%                 EEGDataD_label = load('..\ScoringDepression_nback\EEGData_back1_label.mat');
%                 EEGDataD_label = EEGDataD_label.EEGData_back1_label;
%                 
%                 EEGDataH_label = ones(1, size_EEGDataH(1)) * 7;
            else if task == 3
                    EEGDataH = load('..\NbackData\EEGData_Hback2.mat');
                    EEGDataH.EEGdata_back2 = EEGDataH.EEGdata_back2(:,selectedChannel,:);
                    size_EEGDataH = size(EEGDataH.EEGdata_back2);
                    EEGDataH = permute(EEGDataH.EEGdata_back2, [3 1 2]);
                    EEGDataH = filter(mybandpassfilterIIR_EEG_500(Fs, Fc1, Fc2, Order),EEGDataH);
                    EEGDataH = permute(EEGDataH, [2 3 1]);
                    
                    EEGDataD = load('..\ScoringDepression_nback\EEGdata_back2.mat');
                    EEGDataD.EEGdata_back2 = EEGDataD.EEGdata_back2(:,selectedChannel,:);
                    size_EEGDataD = size(EEGDataD.EEGdata_back2);
                    EEGDataD = permute(EEGDataD.EEGdata_back2, [3 1 2]);
                    EEGDataD = filter(mybandpassfilterIIR_EEG_500(Fs, Fc1, Fc2, Order),EEGDataD);
                    EEGDataD = permute(EEGDataD, [2 3 1]);
                    
                    % distribute EEG data
                    EEGDataH = reshape(EEGDataH(:,:,1:64*18), [size_EEGDataH(1), size_EEGDataH(2), 64, 18]);
                    EEGDataD = reshape(EEGDataD(:,:,1:64*18), [size_EEGDataD(1), size_EEGDataD(2), 64, 18]);
                    
%                     EEGDataD_label = load('..\ScoringDepression_nback\EEGData_back2_label.mat');
%                     EEGDataD_label = EEGDataD_label.EEGData_back2_label;
%                     
%                     EEGDataH_label = ones(1, size_EEGDataH(1)) * 7;
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
        for iH = 1: length(testH)
            Data_temp = [];
            to_H = sum(Trail_numH(task,1:iH));
            from_H = to_H - Trail_numH(task,iH) + 1;
            
            Data_temp = EEGDataH(from_H:to_H,:,:,:);
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
            to_D = sum(Trail_numD(task, 1:iD));
            from_D = to_D - Trail_numD(task,iD) + 1;
            
            Data_temp = EEGDataD(from_D:to_D,:,:,:);
            if testD(iD) == 0
                trainDataD = [trainDataD; Data_temp];
            elseif testD(iD) == 1
                testDataD = [testDataD; Data_temp];
            end
        end
        clear EEGDataD
        clear EEGDataH
        
        train = []; validation = []; test = []; 
        train.Features = [trainDataH; trainDataD];
        train.Labels = categorical([ones(1,size(trainDataD,1))*2 ones(1,size(trainDataH,1))]);
        range_data = randperm(length(train.Labels));
        train.Features = train.Features(range_data,:,:,:);
        train.Features = permute(train.Features, [2 3 4 1]);
        train.Labels = train.Labels(range_data);
        
        validationLength = floor((size(trainDataH,1)+size(trainDataD,1))*0.1);
        validation.Features = train.Features(:,:,:,1:validationLength);
        validation.Labels = train.Labels(1:validationLength);
        
        test.Features = [testDataH; testDataD];
        test.Features = permute(test.Features, [2 3 4 1]);
        test.Labels = categorical([ones(1,size(testDataD,1))*2 ones(1,size(testDataH,1))]);
        clear trainDataH
        clear trainDataD
        clear testDataH
        clear testDataD
        
        %% Construct Network
        numClasses = 2; % the number of classes
        netWidth = 64;
        numUnits = 6;
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

save SelectedChannel_Beta_Result_all_Nback Result_all_Nback


