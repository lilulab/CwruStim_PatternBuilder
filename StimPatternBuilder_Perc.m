%% Load Excel File

clear all

% add data folder path
addpath('ExcelData\PERC');

% GUI load excel
[excel_filename, pathname] = uigetfile('*.xlsm*', 'Please select desired stim pattern parameter file');


%% read data from file

% step duration(second)
pattern.step_duration = xlsread(excel_filename, 'Walk', 'F4:F5','basic');

% Channel amplitude
% A value of 38 corresponds to 20mA.
pattern.channel_amplitude = xlsread(excel_filename, 'Walk', 'F6:F29','basic');

% channel delays
pattern.channel_delay = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24];
pattern.channel_delay = [pattern.channel_delay, pattern.channel_delay]';

%% channel data

% board 1
pattern.board_data(:,:,1) =  xlsread(excel_filename, 'Walk', 'C42:H137','basic');
% board 2
pattern.board_data(:,:,2) =  xlsread(excel_filename, 'Walk', 'K42:P137','basic');

% pattern.channel_data()
for j=0:1  % board loop
    for i=0:11 % channel loop
      % Left step
        % Percent Pattern
        pattern.channel_data(:,1,i+1+j*12) = pattern.board_data(1+i*8:8+i*8,1,j+1);
        % Pulse Width (us)
        pattern.channel_data(:,2,i+1+j*12) = pattern.board_data(1+i*8:8+i*8,2,j+1);
        % IPI (ms)
        pattern.channel_data(:,3,i+1+j*12) = pattern.board_data(1+i*8,3,j+1);
                
      % Right step
        % Percent Pattern
        pattern.channel_data(:,4,i+1+j*12) = pattern.board_data(1+i*8:8+i*8,4,j+1);
        % Pulse Width (us)
        pattern.channel_data(:,5,i+1+j*12) = pattern.board_data(1+i*8:8+i*8,5,j+1);
        % IPI (ms)
        pattern.channel_data(:,6,i+1+j*12) = pattern.board_data(1+i*8,6,j+1);
        
    end
end

%% Gait pattern to Cpp head files

% board loop
for j=0:1
        % channel loop
        for i=0:11
            
            str = ['board' num2str(j+1) '.CH' num2str(dec2hex(i+1))];
            % varname = genvarname(str)
            % varname = matlab.lang.makeValidName(str);
            varname = matlab.lang.makeUniqueStrings(str);
            
            % L
            src = ['channel_data(:,1:3,i+1+j*12);' ];
            eval(['gait_H.' 'Walk.' 'Lstep.' varname ' = ' 'pattern.' src]);
            
            % R
            src = ['channel_data(:,4:6,i+1+j*12);' ];
            eval(['gait_H.' 'Walk.' 'Rstep.' varname ' = ' 'pattern.' src]);            
            
            display ([i j]);
        end

end


