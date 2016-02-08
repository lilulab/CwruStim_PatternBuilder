display ('Walk Decoding ...');

%% read data from file

% step duration(second)
pattern.step_duration = xlsread(excel_filename, 'Walk', 'F4:F5','basic');

% Channel amplitude
% A value of 38 corresponds to 20mA.
pattern.channel_amplitude = xlsread(excel_filename, 'Walk', 'F6:F29','basic');

% channel delays
pattern.channel_delay = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24];

%% channel data

% Walk
% board 1
pattern.walk_data_IST16(:,:) =  xlsread(excel_filename, 'Walk', 'C46:H173','basic');
% board 2
pattern.walk_data_IRS8(:,:) =  xlsread(excel_filename, 'Walk', 'K46:P109','basic');

% pattern.walk_channel_data()
% for IST16 Board
for i=0:15 % channel loop
  % Left step
    % Percent Pattern
    pattern.walk_channel_data_IST16(:,1,i+1) = pattern.walk_data_IST16(i*8+1:i*8+8,1);
    % Pulse Width (us)
    pattern.walk_channel_data_IST16(:,2,i+1) = pattern.walk_data_IST16(i*8+1:i*8+8,2);
    % IPI (ms)
    pattern.walk_channel_data_IST16(:,3,i+1) = pattern.walk_data_IST16(1+i*8,3);
            
  % Right step
    % Percent Pattern
    pattern.walk_channel_data_IST16(:,4,i+1) = pattern.walk_data_IST16(i*8+1:i*8+8,4);
    % Pulse Width (us)
    pattern.walk_channel_data_IST16(:,5,i+1) = pattern.walk_data_IST16(i*8+1:i*8+8,5);
    % IPI (ms)
    pattern.walk_channel_data_IST16(:,6,i+1) = pattern.walk_data_IST16(1+i*8,6);
end

% for IRS8 Board
for i=0:7 % channel loop
  % Left step
    % Percent Pattern
    pattern.walk_channel_data_IRS8(:,1,i+1) = pattern.walk_data_IRS8(i*8+1:i*8+8,1);
    % Pulse Width (us)
    pattern.walk_channel_data_IRS8(:,2,i+1) = pattern.walk_data_IRS8(i*8+1:i*8+8,2);
    % IPI (ms)
    pattern.walk_channel_data_IRS8(:,3,i+1) = pattern.walk_data_IRS8(1+i*8,3);
            
  % Right step
    % Percent Pattern
    pattern.walk_channel_data_IRS8(:,4,i+1) = pattern.walk_data_IRS8(i*8+1:i*8+8,4);
    % Pulse Width (us)
    pattern.walk_channel_data_IRS8(:,5,i+1) = pattern.walk_data_IRS8(i*8+1:i*8+8,5);
    % IPI (ms)
    pattern.walk_channel_data_IRS8(:,6,i+1) = pattern.walk_data_IRS8(1+i*8,6);
end

%% Reorganize data to gait structure

% walk

% step duration
str = num2str(pattern.step_duration(1));
eval(['gait.Walk.Duration.Lstep = ' str ';']);

str = num2str(pattern.step_duration(2));
eval(['gait.Walk.Duration.Rstep = ' str ';']);

% Amplitude
eval(['gait.Walk.IST16.Amplitude = pattern.channel_amplitude(1:16);']);
eval(['gait.Walk.IRS8.Amplitude= pattern.channel_amplitude(17:24);']);

% gait pattern PP,PW,IPI

% IST16 Board
% channel loop
for i=1:16
    str = ['CH' num2str(dec2hex(i))];
    % varname = genvarname(str)
    % varname = matlab.lang.makeValidName(str);
    varname = matlab.lang.makeUniqueStrings(str);
    
    % L
    src = ['walk_channel_data_IST16(:,1:3,i);' ];
    eval(['gait.' 'Walk.' 'IST16.' 'Lstep.' varname ' = ' 'pattern.' src]);
    
    % R
    src = ['walk_channel_data_IST16(:,4:6,i);' ];
    eval(['gait.' 'Walk.' 'IST16.' 'Rstep.' varname ' = ' 'pattern.' src]);            
    %display ([i j]);
end

% IRS8 Board
% channel loop
for i=1:8
    str = ['CH' num2str(dec2hex(i))];
    % varname = genvarname(str)
    % varname = matlab.lang.makeValidName(str);
    varname = matlab.lang.makeUniqueStrings(str);
    
    % L
    src = ['walk_channel_data_IRS8(:,1:3,i);' ];
    eval(['gait.' 'Walk.' 'IRS8.' 'Lstep.' varname ' = ' 'pattern.' src]);
    
    % R
    src = ['walk_channel_data_IRS8(:,4:6,i);' ];
    eval(['gait.' 'Walk.' 'IRS8.' 'Rstep.' varname ' = ' 'pattern.' src]);            
    %display ([i j]);
end

%%

display ('Walk Decoding - Done!');
display (' ');



