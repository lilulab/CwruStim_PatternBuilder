% StimPatternBuilder.m - Load Stim Pattern to HNPv2 ECB.
% Created by Lu Li (lxl361@case), SEP, 2015.
% Version 1.0
% Online Doc: https://goo.gl/s20iH4
% Repo: https://github.com/lilulab/CwruStim_beta

%% Init
clear all

% add data folder path
addpath('ExcelData/VCK5');
addpath('include');

%% Load Excel File

% Dialog and command line printing.
title = '---HNPv2 Stim Pattern Builder---';
msg = {
  ' -[READ THIS BEFORE START]:';
  ' -Step 1: Load Excel file.';
  ' -        // A dialog will popup for you to choose input file.';
  ' -        // Located them under "/ExcelData/" Folder.';
  ' ';
  ' -Step 2: Decode the gait params from the Excel.';
  ' -        // This step is an automatic process.';
  ' ';
  ' -Step 3: Export gait params to C++ head file.';
  ' -        // You need to assign a file name to export.';
  ' -        // For example, you can type "gait.h", then hit ENTER.';
  ' '};

% command line
disp(' ');disp(' ');
disp(title);
disp(msg);

%input('Press enter to continue:','s');

% pop dialog box
waitfor(msgbox(msg,title));
%uiwait(msgbox(msg,title));
%answer = inputdlg('Dialog text','Dialog title');

disp(' ');
disp(' -Running Step 1: Load Excel file.');
disp(' -        // A dialog will popup for you to choose input file.');
disp(' -        // Located them under "/ExcelData/" Folder.');
disp('---Load Excel File---');

% GUI load excel
[excel_filename, pathname] = uigetfile('ExcelData/VCK5/*.xlsm*', 'Please select desired stim pattern parameter file');

%% Run Perc excel decode program
disp(' ');
disp(' -Running Step 2: Decode the gait params from the Excel.');
disp(' -        // This step is an automatic process.');
disp('---Run Perc Excel Decode Program---');

% Dialog and command line printing.
title = '---Step 2 Start---';
msg = {
  ' -Step 2 Processing... Please wait...';
  ' -        // Decode the gait params from the Excel.';
  ' -        // This step is an automatic process.';
  ' -        // Normally take around 30 seconds to run.';
  ' '};

% pop dialog box
msgbox(msg,title);

StimPatternBuilder_Perc_Walk
StimPatternBuilder_Perc_Stand
StimPatternBuilder_Perc_Sit

MiscID = 1;     StimPatternBuilder_Perc_Misc;
MiscID = 2;     StimPatternBuilder_Perc_Misc;
MiscID = 3;     StimPatternBuilder_Perc_Misc;

% Dialog and command line printing.
title = '---Step 2 Done---';
msg = {
  ' -Step 2 Done:';
  ' -        // Decode the gait params from the Excel.';
  ' -        // This step is an automatic process.';
  ' '};

% pop dialog box
waitfor(msgbox(msg,title));
%uiwait(msgbox(msg,title));

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

MiscID = 1;     gait2hpp_misc;
MiscID = 2;     gait2hpp_misc;
MiscID = 3;     gait2hpp_misc;

% add footer and close file
gait2hpp_footer