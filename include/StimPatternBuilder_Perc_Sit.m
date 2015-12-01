display ('Sit Decoding ...');

%% read data from file

% step duration(second)
pattern.step_duration = xlsread(excel_filename, 'Sit', 'F4','basic');

% channel delays
pattern.channel_delay = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24];
pattern.channel_delay = [pattern.channel_delay, pattern.channel_delay]';

%% channel data

% Sit
% board 1
pattern.sit_data(:,:,1) =  xlsread(excel_filename, 'Sit', 'C42:E137','basic');
% board 2
pattern.sit_data(:,:,2) =  xlsread(excel_filename, 'Sit', 'K42:M137','basic');

% pattern.sit_channel_data()
for j=0:1  % board loop
    for i=0:11 % channel loop
      % Pattern at same field as Left step
        % Percent Pattern
        pattern.sit_channel_data(:,1,i+1+j*12) = pattern.sit_data(1+i*8:8+i*8,1,j+1);
        % Pulse Width (us)
        pattern.sit_channel_data(:,2,i+1+j*12) = pattern.sit_data(1+i*8:8+i*8,2,j+1);
        % IPI (ms)
        pattern.sit_channel_data(:,3,i+1+j*12) = pattern.sit_data(1+i*8,3,j+1);
    end
end

%% Reorganize data to gait structure

% walk

% step duration
str = num2str(pattern.step_duration(1));
eval(['gait.Sit.duration = ' str ';']);

% Amplitude
% Same as walk

% gait pattern PP,PW,IPI
% board loop
for j=0:1
        % channel loop
        for i=0:11
            
            str = ['board' num2str(j+1) '.CH' num2str(dec2hex(i+1))];
            % varname = genvarname(str)
            % varname = matlab.lang.makeValidName(str);
            varname = matlab.lang.makeUniqueStrings(str);
            
            % Pattern
            src = ['sit_channel_data(:,1:3,i+1+j*12);' ];
            eval(['gait.' 'Sit.' varname ' = ' 'pattern.' src]);         
            
            %display ([i j]);
        end

end

display ('Sit Decoding - Done!');
display (' ');



