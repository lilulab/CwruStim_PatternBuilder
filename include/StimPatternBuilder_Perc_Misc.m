%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

display ( ['Misc' MiscID ' Decoding ...']);

%% read data from file

% step duration(second)

str = ['Misc' num2str(MiscID)];
varname = matlab.lang.makeUniqueStrings(str);

src = ['xlsread(excel_filename, str, ''F4'',''basic'');'];
eval(['pattern.' varname '.duration = ' src]); 
%pattern.misc_duration = xlsread(excel_filename, ['Misc' num2str(MiscID)], 'F4','basic');

% channel delays
%pattern.channel_delay = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24];
src = ['[2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24];'];
eval(['pattern.' varname '.channel_delay = ' src]); 
%pattern.channel_delay = [pattern.channel_delay, pattern.channel_delay]';

%% channel data

clear temp;

% Stand
% board 1
temp.misc_data(:,:,1) =  xlsread(excel_filename, ['Misc' num2str(MiscID)], 'C42:E137','basic');
% board 2
temp.misc_data(:,:,2) =  xlsread(excel_filename, ['Misc' num2str(MiscID)], 'K42:M137','basic');

% temp.misc_channel_data()
for j=0:1  % board loop
    for i=0:11 % channel loop
      % Pattern at same field as Left step
        % Percent Pattern
        temp.misc_channel_data(:,1,i+1+j*12) = temp.misc_data(1+i*8:8+i*8,1,j+1);
        % Pulse Width (us)
        temp.misc_channel_data(:,2,i+1+j*12) = temp.misc_data(1+i*8:8+i*8,2,j+1);
        % IPI (ms)
        temp.misc_channel_data(:,3,i+1+j*12) = temp.misc_data(1+i*8,3,j+1);
    end
end

eval(['pattern.' varname '.pattern_data = temp.misc_data;']); 
eval(['pattern.' varname '.channel_data = temp.misc_channel_data;']); 

%% Reorganize data to gait structure

% step duration
str = ['pattern.' varname '.duration'];
eval(['gait.' varname '.duration = ' str ';']);

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
            varname2 = matlab.lang.makeUniqueStrings(str);

            % Pattern
            src = ['temp.misc_channel_data(:,1:3,i+1+j*12);'];
            eval(['gait.' varname '.' varname2 ' = ' src]);         

            %display ([i j]);
        end

end

display (['Misc' num2str(MiscID) ' Decoding - Done!']);
display (' ');



