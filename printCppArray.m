function [ data_len ] = printCppArray( file_id, var_name, data_src, data_type )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% get size of the data set
data_len = size(data_src);

% % const dataType variableName[] PROGMEM = {};   // use this form
% % const PROGMEM  dataType  variableName[] = {}; // or this form
% % const dataType PROGMEM variableName[] = {};   // not this one

% print array header
fprintf(file_id, 'const ');
fprintf(file_id, data_type);
fprintf(file_id, ' ');
fprintf(file_id, var_name);
fprintf(file_id, ['[' num2str(data_len(1)) '] PROGMEM = {']);



% print C array
if strcmp(data_type,'float')
    for i=1:data_len(1)-1
        % element 1 to n-1
        fprintf(file_id, '%.2f, ', data_src(i));
    end      
elseif strcmp(data_type,'uint8_t')
    for i=1:data_len(1)-1
        % element 1 to n-1
        fprintf(file_id, '%d, ', data_src(i));
    end  
end


% print the last element in the array
fprintf(file_id, '%d};\r\n', data_src(data_len(1)));

end

