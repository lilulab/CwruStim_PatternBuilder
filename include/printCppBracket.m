function [ data_len ] = printCppBracket( file_id, data_src, data_type, bracket_L, bracket_R)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    array_len = size(data_src);

    % print bracket
    fprintf(file_id, [bracket_L ' ']);

    % print C array
    if strcmp(data_type,'float')
        for i=1:array_len(1)-1
            % element 1 to n-1
            fprintf(file_id, '%.2f,\t', data_src(i));
            % data size
            data_size = 4;
        end      
    elseif strcmp(data_type,'uint8_t') || strcmp(data_type,'uint16_t')
        for i=1:array_len(1)-1
            % element 1 to n-1
            fprintf(file_id, '%d,\t', data_src(i));
            if data_src(i) < 100;
                fprintf(file_id, '\t');
            end
        end  
        
        % data size
        data_size = 1;
        if strcmp(data_type,'uint16_t')
            data_size = 2;
        end
        
    end
    
    % print the last element in the array
    fprintf(file_id, ['%d ' bracket_R], data_src(array_len(1)));
    
    % get size of the data set
    data_len = array_len(1) * data_size;

end

