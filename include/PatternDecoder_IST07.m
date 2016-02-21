%% read data from file
display ('Pattern Decoding ...');
% Channel amplitude
% A value of 38 corresponds to 20mA.
pattern.channel_amplitude = xlsread(excel_filename, 'Walk', 'F6:F29','basic');

% channel delays
pattern.channel_delay = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24];

%% channel data

% Walk ------------------------------------------------------------------------
% step duration(second)
pattern.step_duration.walk = xlsread(excel_filename, 'Walk', 'F4:F5','basic');

% board 1
pattern.walk_data_IST16(:,:) =  xlsread(excel_filename, 'Walk', 'C46:H173','basic');
% board 2
pattern.walk_data_SURF4(:,:) =  xlsread(excel_filename, 'Walk', 'K46:P77','basic');

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

% for SURF4 Board
for i=0:3 % channel loop
  % Left step
    % Percent Pattern
    pattern.walk_channel_data_SURF4(:,1,i+1) = pattern.walk_data_SURF4(i*8+1:i*8+8,1);
    % Pulse Width (us)
    pattern.walk_channel_data_SURF4(:,2,i+1) = pattern.walk_data_SURF4(i*8+1:i*8+8,2);
    % IPI (ms)
    pattern.walk_channel_data_SURF4(:,3,i+1) = pattern.walk_data_SURF4(1+i*8,3);
            
  % Right step
    % Percent Pattern
    pattern.walk_channel_data_SURF4(:,4,i+1) = pattern.walk_data_SURF4(i*8+1:i*8+8,4);
    % Pulse Width (us)
    pattern.walk_channel_data_SURF4(:,5,i+1) = pattern.walk_data_SURF4(i*8+1:i*8+8,5);
    % IPI (ms)
    pattern.walk_channel_data_SURF4(:,6,i+1) = pattern.walk_data_SURF4(1+i*8,6);
end

%% Reorganize data to gait structure

% walk

% step duration
str = num2str(pattern.step_duration.walk(1));
eval(['gait.Walk.Duration.Lstep = ' str ';']);

str = num2str(pattern.step_duration.walk(2));
eval(['gait.Walk.Duration.Rstep = ' str ';']);

% Amplitude
eval(['gait.Walk.IST16.Amplitude = pattern.channel_amplitude(1:16);']);
eval(['gait.Walk.SURF4.Amplitude= pattern.channel_amplitude(17:20);']);

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

% SURF4 Board
% channel loop
for i=1:4
    str = ['CH' num2str(dec2hex(i))];
    % varname = genvarname(str)
    % varname = matlab.lang.makeValidName(str);
    varname = matlab.lang.makeUniqueStrings(str);
    
    % L
    src = ['walk_channel_data_SURF4(:,1:3,i);' ];
    eval(['gait.' 'Walk.' 'SURF4.' 'Lstep.' varname ' = ' 'pattern.' src]);
    
    % R
    src = ['walk_channel_data_SURF4(:,4:6,i);' ];
    eval(['gait.' 'Walk.' 'SURF4.' 'Rstep.' varname ' = ' 'pattern.' src]);            
    %display ([i j]);
end

display ('Walk Decoding - Done!');
display (' ');


%% Stand ------------------------------------------------------------------------
% step duration(second)
pattern.step_duration.stand = xlsread(excel_filename, 'Stand', 'F4','basic');
% board 1
pattern.stand_data_IST16(:,:) =  xlsread(excel_filename, 'Stand', 'C46:E173','basic');
% board 2
pattern.stand_data_SURF4(:,:) =  xlsread(excel_filename, 'Stand', 'K46:M77','basic');

% pattern.walk_channel_data()
% for IST16 Board
for i=0:15 % channel loop
    % Percent Pattern
    pattern.stand_channel_data_IST16(:,1,i+1) = pattern.stand_data_IST16(i*8+1:i*8+8,1);
    % Pulse Width (us)
    pattern.stand_channel_data_IST16(:,2,i+1) = pattern.stand_data_IST16(i*8+1:i*8+8,2);
    % IPI (ms)
    pattern.stand_channel_data_IST16(:,3,i+1) = pattern.stand_data_IST16(1+i*8,3);
end

% for SURF4 Board
for i=0:3 % channel loop
    % Percent Pattern
    pattern.stand_channel_data_SURF4(:,1,i+1) = pattern.stand_data_SURF4(i*8+1:i*8+8,1);
    % Pulse Width (us)
    pattern.stand_channel_data_SURF4(:,2,i+1) = pattern.stand_data_SURF4(i*8+1:i*8+8,2);
    % IPI (ms)
    pattern.stand_channel_data_SURF4(:,3,i+1) = pattern.stand_data_SURF4(1+i*8,3);
end

%% Reorganize data to gait structure

% Stand

% step duration
str = num2str(pattern.step_duration.stand);
eval(['gait.Stand.Duration = ' str ';']);

% Amplitude
eval(['gait.Stand.IST16.Amplitude = pattern.channel_amplitude(1:16);']);
eval(['gait.Stand.SURF4.Amplitude= pattern.channel_amplitude(17:20);']);

% gait pattern PP,PW,IPI

% IST16 Board
% channel loop
for i=1:16
    str = ['CH' num2str(dec2hex(i))];
    % varname = genvarname(str)
    % varname = matlab.lang.makeValidName(str);
    varname = matlab.lang.makeUniqueStrings(str);
    
    src = ['stand_channel_data_IST16(:,1:3,i);' ];
    eval(['gait.' 'Stand.' 'IST16.' 'Step.' varname ' = ' 'pattern.' src]);          
    %display ([i j]);
end

% SURF4 Board
% channel loop
for i=1:4
    str = ['CH' num2str(dec2hex(i))];
    % varname = genvarname(str)
    % varname = matlab.lang.makeValidName(str);
    varname = matlab.lang.makeUniqueStrings(str);
    
    % L
    src = ['stand_channel_data_SURF4(:,1:3,i);' ];
    eval(['gait.' 'Stand.' 'SURF4.' 'Step.' varname ' = ' 'pattern.' src]);
    %display ([i j]);
end

display ('Stand Decoding - Done!');
display (' ');


%% Sit ------------------------------------------------------------------------
% step duration(second)
pattern.step_duration.sit = xlsread(excel_filename, 'Sit', 'F4','basic');
% board 1
pattern.sit_data_IST16(:,:) =  xlsread(excel_filename, 'Sit', 'C46:E173','basic');
% board 2
pattern.sit_data_SURF4(:,:) =  xlsread(excel_filename, 'Sit', 'K46:M77','basic');

% pattern.walk_channel_data()
% for IST16 Board
for i=0:15 % channel loop
    % Percent Pattern
    pattern.sit_channel_data_IST16(:,1,i+1) = pattern.sit_data_IST16(i*8+1:i*8+8,1);
    % Pulse Width (us)
    pattern.sit_channel_data_IST16(:,2,i+1) = pattern.sit_data_IST16(i*8+1:i*8+8,2);
    % IPI (ms)
    pattern.sit_channel_data_IST16(:,3,i+1) = pattern.sit_data_IST16(1+i*8,3);
end

% for SURF4 Board
for i=0:3 % channel loop
    % Percent Pattern
    pattern.sit_channel_data_SURF4(:,1,i+1) = pattern.sit_data_SURF4(i*8+1:i*8+8,1);
    % Pulse Width (us)
    pattern.sit_channel_data_SURF4(:,2,i+1) = pattern.sit_data_SURF4(i*8+1:i*8+8,2);
    % IPI (ms)
    pattern.sit_channel_data_SURF4(:,3,i+1) = pattern.sit_data_SURF4(1+i*8,3);
end

%% Reorganize data to gait structure

% Sit

% step duration
str = num2str(pattern.step_duration.sit);
eval(['gait.Sit.Duration = ' str ';']);

% Amplitude
eval(['gait.Sit.IST16.Amplitude = pattern.channel_amplitude(1:16);']);
eval(['gait.Sit.SURF4.Amplitude= pattern.channel_amplitude(17:20);']);

% gait pattern PP,PW,IPI

% IST16 Board
% channel loop
for i=1:16
    str = ['CH' num2str(dec2hex(i))];
    % varname = genvarname(str)
    % varname = matlab.lang.makeValidName(str);
    varname = matlab.lang.makeUniqueStrings(str);
    
    src = ['sit_channel_data_IST16(:,1:3,i);' ];
    eval(['gait.' 'Sit.' 'IST16.' 'Step.' varname ' = ' 'pattern.' src]);          
    %display ([i j]);
end

% SURF4 Board
% channel loop
for i=1:4
    str = ['CH' num2str(dec2hex(i))];
    % varname = genvarname(str)
    % varname = matlab.lang.makeValidName(str);
    varname = matlab.lang.makeUniqueStrings(str);
    
    % L
    src = ['sit_channel_data_SURF4(:,1:3,i);' ];
    eval(['gait.' 'Sit.' 'SURF4.' 'Step.' varname ' = ' 'pattern.' src]);
    %display ([i j]);
end

display ('Sit Decoding - Done!');
display (' ');