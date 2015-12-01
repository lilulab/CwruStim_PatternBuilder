display ('Walk Decoding ...');

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

% Walk
% board 1
pattern.walk_data(:,:,1) =  xlsread(excel_filename, 'Walk', 'C42:H137','basic');
% board 2
pattern.walk_data(:,:,2) =  xlsread(excel_filename, 'Walk', 'K42:P137','basic');

% pattern.walk_channel_data()
for j=0:1  % board loop
    for i=0:11 % channel loop
      % Left step
        % Percent Pattern
        pattern.walk_channel_data(:,1,i+1+j*12) = pattern.walk_data(1+i*8:8+i*8,1,j+1);
        % Pulse Width (us)
        pattern.walk_channel_data(:,2,i+1+j*12) = pattern.walk_data(1+i*8:8+i*8,2,j+1);
        % IPI (ms)
        pattern.walk_channel_data(:,3,i+1+j*12) = pattern.walk_data(1+i*8,3,j+1);
                
      % Right step
        % Percent Pattern
        pattern.walk_channel_data(:,4,i+1+j*12) = pattern.walk_data(1+i*8:8+i*8,4,j+1);
        % Pulse Width (us)
        pattern.walk_channel_data(:,5,i+1+j*12) = pattern.walk_data(1+i*8:8+i*8,5,j+1);
        % IPI (ms)
        pattern.walk_channel_data(:,6,i+1+j*12) = pattern.walk_data(1+i*8,6,j+1);
        
    end
end

%% Reorganize data to gait structure

% walk

% step duration
str = num2str(pattern.step_duration(1));
eval(['gait.Walk.Lstep.duration = ' str ';']);

str = num2str(pattern.step_duration(2));
eval(['gait.Walk.Rstep.duration = ' str ';']);

% Amplitude
eval(['gait.Walk.Channel_amplitude.L = pattern.channel_amplitude(1:12);']);
eval(['gait.Walk.Channel_amplitude.R = pattern.channel_amplitude(13:24);']);

% gait pattern PP,PW,IPI
% board loop
for j=0:1
        % channel loop
        for i=0:11
            
            str = ['board' num2str(j+1) '.CH' num2str(dec2hex(i+1))];
            % varname = genvarname(str)
            % varname = matlab.lang.makeValidName(str);
            varname = matlab.lang.makeUniqueStrings(str);
            
            % L
            src = ['walk_channel_data(:,1:3,i+1+j*12);' ];
            eval(['gait.' 'Walk.' 'Lstep.' varname ' = ' 'pattern.' src]);
            
            % R
            src = ['walk_channel_data(:,4:6,i+1+j*12);' ];
            eval(['gait.' 'Walk.' 'Rstep.' varname ' = ' 'pattern.' src]);            
            
            %display ([i j]);
        end

end

display ('Walk Decoding - Done!');
display (' ');



