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

disp('---Load Excel File---');

% GUI load excel
[excel_filename, pathname] = uigetfile('*.xlsm*', 'Please select desired stim pattern parameter file');


%% Run FNS
% StimPatternBuilder_FNS

%% Run Perc excel decode program
disp('---Run Perc Excel Decode Program---');
StimPatternBuilder_Perc_Walk
StimPatternBuilder_Perc_Stand
StimPatternBuilder_Perc_Sit

%% Gait pattern to Cpp head files
disp('---Save Gait Data to C++ Head File---');

% create file and add header
gait2hpp_header

% Run encode program
gait2hpp_walk
gait2hpp_stand
gait2hpp_sit

% add footer and close file
gait2hpp_footer