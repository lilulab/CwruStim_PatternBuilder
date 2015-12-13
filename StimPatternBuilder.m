% StimPatternBuilder.m - Load Stim Pattern to HNPv2 ECB.
% Created by Lu Li (lxl361@case), SEP, 2015.
% Version 1.0
% Online Doc: https://goo.gl/s20iH4
% Repo: https://github.com/lilulab/CwruStim_beta

%% Init
clear all

% add data folder path
addpath('ExcelData\PERC');
addpath('include');

%% Load Excel File
disp(' ');disp(' ');
disp('---HNPv2 Stim Pattern Builder---');
disp(' -[READ THIS BEFORE START]:');
disp(' -Step 1: Load Excel file.');
disp(' -        // A dialog will popup for you to choose input file.');
disp(' -        // Located them under "/ExcelData/" Folder.');
disp(' ');
disp(' -Step 2: Decode the gait params from the Excel.');
disp(' -        // This step is an automatic process.');
disp(' ');
disp(' -Step 3: Export gait params to C++ head file.');
disp(' -        // You need to assign a file name to export.');
disp(' -        // For example, you can type "gait.h", then hit ENTER.');
disp(' ');
input('Press enter to continue:','s');

disp(' ');
disp(' -Running Step 1: Load Excel file.');
disp(' -        // A dialog will popup for you to choose input file.');
disp(' -        // Located them under "/ExcelData/" Folder.');
disp('---Load Excel File---');

% GUI load excel
[excel_filename, pathname] = uigetfile('*.xlsm*', 'Please select desired stim pattern parameter file');


%% Run FNS
% StimPatternBuilder_FNS

%% Run Perc excel decode program
disp(' ');
disp(' -Running Step 2: Decode the gait params from the Excel.');
disp(' -        // This step is an automatic process.');
disp('---Run Perc Excel Decode Program---');
StimPatternBuilder_Perc_Walk
StimPatternBuilder_Perc_Stand
StimPatternBuilder_Perc_Sit

%% Gait pattern to Cpp head files
disp(' ');
disp(' -Running Step 3: Export gait params to C++ head file.');
disp(' -        // You need to assign a file name to export.');
disp(' -        // For example, you can type "gait.h", then hit ENTER.');
disp('---Save Gait Data to C++ Head File---');

% create file and add header
gait2hpp_header

% Run encode program
gait2hpp_walk
gait2hpp_stand
gait2hpp_sit

% add footer and close file
gait2hpp_footer