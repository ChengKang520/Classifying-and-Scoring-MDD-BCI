

clear all;
close all;
clc;

EEGdata = [];
EEGData_label = [];
EEGdata_back0 = [];
EEGData_back0_label = [];
Trail_back0_numD = [];
EEGdata_back1 = [];
EEGData_back1_label = [];
Trail_back1_numD = [];
EEGdata_back2 = [];
EEGData_back2_label = [];
Trail_back2_numD = [];
%% --------------------------------------------------------------------------
score = 18;
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadbv('D:\Shenzhen U\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\chensenzhao(D)\', 'chensenzhao_0.vhdr', [1 79650], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\1\', 'chensenzhao_1.vhdr', [1 78300], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\1\', 'chensenzhao_2.vhdr', [1 76950], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 22;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\chenweiqiao(D)\', 'chenweiqiao_0.vhdr', [1 78300], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\2\', 'chenweiqiao_1.vhdr', [1 76950], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\2\', 'chenweiqiao_2.vhdr', [1 68850], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 19;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\dengliya(D)\', 'dengliya(D)_0.vhdr', [1 68750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\3\', 'dengliya(D)_1.vhdr', [1 58750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 4,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\3\', 'dengliya(D)_2.vhdr', [1 57500], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 5,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 26;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\dingfuchang(D)\', 'dingfuchang_Nback_0.vhdr', [1 66250], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\dingfuchang(D)\', 'dingfuchang_Nback_1.vhdr', [1 52500], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\dingfuchang(D)\', 'dingfuchang_Nback_2.vhdr', [1 52500], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 26;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\fangjiakang(D)\', 'fangjiakang_CSD(zhangmaolin0-back).vhdr', [1 71250], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\4\', 'fangjiakang_CSD(zhangmaolin1-back).vhdr', [1 70000], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 6,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\4\', 'fangjiakang_CSD(zhangmaolin2-back).vhdr', [1 68750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 7,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 22;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\guanxiongqiang(D)\', 'guanxiongqiang_Nback_0.vhdr', [1 73750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\guanxiongqiang(D)\', 'guanxiongqiang_Nback_1.vhdr', [1 67500], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\guanxiongqiang(D)\', 'guanxiongqiang_Nback_2.vhdr', [1 56250], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 20;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\hanwantong(D)\', 'hanwantong_Nback_0.vhdr', [1 67500], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\hanwantong(D)\', 'hanwantong_Nback_1.vhdr', [1 68750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\hanwantong(D)\', 'hanwantong_Nback_2.vhdr', [1 52500], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 21;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\huangpeiting(D)\', 'huangpeiting_0.vhdr', [1 51300], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\6\', 'huangpeiting_1.vhdr', [1 62100], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 10,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\6\', 'huangpeiting_2.vhdr', [1 68850], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 11,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 18;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\liuchang(D)\', 'liuchang_Nback_0.vhdr', [1 55000], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\7\', 'liuchang_Nback_1.vhdr', [1 61250], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 12,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\7\', 'liuchang_Nback_2.vhdr', [1 56250], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 13,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 26;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\liuhuiming(D)\', 'liuhuiming_0.vhdr', [1 55350], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\8\', 'liuhuiming_1.vhdr', [1 54000], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 14,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\8\', 'liuhuiming_2.vhdr', [1 75600], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 15,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 22;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\lixueyin(D)\', 'lixueyin_0.vhdr', [1 79650], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\9\', 'lixueyin_1.vhdr', [1 78300], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 16,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\9\', 'lixueyin_2.vhdr', [1 63450], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 17,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 22;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\lvpinli(D)\', 'lvpinli_Nback_0.vhdr', [1 72500], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\10\', 'lvpinli_Nback_1.vhdr', [1 61250], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 18,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\10\', 'lvpinli_Nback_2.vhdr', [1 52500], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 19,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 31;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\niujuntao(D)\', 'liujt_0.vhdr', [1 75000], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\11\', 'liujt_1.vhdr', [1 66250], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 20,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\11\', 'liujt_2.vhdr', [1 63750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 21,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 20;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\tanjinyu(D)\', 'tanjinyu_Nback_0.vhdr', [1 63750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\12\', 'tanjinyu_Nback_1.vhdr', [1 63750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 22,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\12\', 'tanjinyu_Nback_2.vhdr', [1 56250], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 23,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 24;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\wangbaoan(D)\', 'wangbaoan_0.vhdr', [1 68850], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\wangbaoan(D)\', 'wangbaoan_1.vhdr', [1 66150], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\wangbaoan(D)\', 'wangbaoan_2.vhdr', [1 60750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 20;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\wutingshu(D)\', 'wutingshu_Nback_0.vhdr', [1 62500], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\13\', 'wutingshu_Nback_1.vhdr', [1 63750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 24,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\13\', 'wutingshu_Nback_2.vhdr', [1 58750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 25,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 20;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\wuwenqiang(D)\', 'wuwenqiang_Nback_0.vhdr', [1 58750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\14\', 'wuwenqiang_Nback_1.vhdr', [1 65000], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 26,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\14\', 'wuwenqiang_Nback_2.vhdr', [1 60000], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 27,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 34;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\yulimei(D)\', 'yulimei_0.vhdr', [1 52650], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\15\', 'yulimei_1.vhdr', [1 55350], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 28,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\15\', 'yulimei_2.vhdr', [1 66150], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 29,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

%% --------------------------------------------------------------------------
score = 24;
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\n-back Raw Data\DepressionNback(Data)\zhangyi(D)\', 'zhangyi(D)_0.vhdr', [1 62100], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back0 = [EEGdata_back0; EEG.data(:,:,1:1250)];
EEGData_back0_label = [EEGData_back0_label EEG_label];
Trail_back0_numD = [Trail_back0_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\16\', 'zhangyi(D)_1.vhdr', [1 56700], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 30,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back1 = [EEGdata_back1; EEG.data(:,:,1:1250)];
EEGData_back1_label = [EEGData_back1_label EEG_label];
Trail_back1_numD = [Trail_back1_numD EEG_size];
clear EEG
clear EEG_label
EEG = pop_loadbv('D:\SZU and HKU\EEG data\N-back paragdim\PSI_Project\Depression_NabckParadigm\16\', 'zhangyi(D)_2.vhdr', [1 60750], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 31,'gui','off'); 
EEG.data = permute(EEG.data, [3,1,2]);
EEG_size = size(EEG.data, 1);
EEG_label = ones(1, EEG_size) * score;
EEGdata_back2 = [EEGdata_back2; EEG.data(:,:,1:1250)];
EEGData_back2_label = [EEGData_back2_label EEG_label];
Trail_back2_numD = [Trail_back2_numD EEG_size];
clear EEG
clear EEG_label

ha = 1;
save EEGdata_back0 EEGdata_back0
save EEGData_back0_label EEGData_back0_label
save Trail_back0_numD Trail_back0_numD
save EEGdata_back1 EEGdata_back1
save EEGData_back1_label EEGData_back1_label
save Trail_back1_numD Trail_back1_numD
save EEGdata_back2 EEGdata_back2
save EEGData_back2_label EEGData_back2_label
save Trail_back2_numD Trail_back2_numD
