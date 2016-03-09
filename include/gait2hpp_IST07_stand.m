% read gait structure and convert it to Cpp Head file

% Print data array
% Mem_size = Mem_size + printCppArray( file_id, data_src, data_type )

fprintf(fid, ['\r\n// ------ Stand ------\r\n']);

% Step duration
fprintf(fid, ['\r\n// Step Duration \r\n']);
fprintf(fid, ['const float gait_stand_duration = ' num2str(gait.Stand.Duration) '; \r\n']);

% IST16 ---------------------------------------
    num_channels = 16;
    fprintf(fid, ['\r\n\r\n// Board_IST16' '------------------\r\n']);
    
    % Step
    fprintf(fid, ['\r\n// Step ---------\r\n']);  
    
    % percent pattern
    fprintf(fid, ['\r\n// Percent Pattern\r\n']);
    fprintf(fid, ['const uint16_t gait_stand_B1' '_PP[' num2str(num_channels) '][8] = { \r\n']);
    for channel_id = 1:num_channels
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Stand.IST16.Step' '.CH' num2str(dec2hex(channel_id)) '(:,1)']); %PP
        data_src = round(data_src*100); % change float to int and times 100;
        % Mem_size = Mem_size + printCppBracket(fid, data_src, 'float', '{', '}');
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint16_t', '{', '}');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n'); 

    % Print Pulse width
    fprintf(fid, ['\r\n// Pulse Width\r\n']);
    fprintf(fid, ['const uint8_t gait_stand_B1' '_PW[' num2str(num_channels) '][8] = { \r\n']);
    for channel_id = 1:num_channels
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Stand.IST16.Step' '.CH' num2str(dec2hex(channel_id)) '(:,2)']); %PW
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');

    % Print Inter Phase Interval
    fprintf(fid, ['\r\n// Inter Phase Interval\r\n']);
    fprintf(fid, ['const uint8_t gait_stand_B1' '_IPI[' num2str(num_channels) '] = \r\n']);
    fprintf(fid, '\t\t{ ');
    for channel_id = 1:num_channels
        data_src = eval(['gait.Stand.IST16.Step' '.CH' num2str(dec2hex(channel_id)) '(1,3)']); %IPI
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '', '');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        % fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');     

% SURF4 ---------------------------------------

    num_channels = 4;
    fprintf(fid, ['\r\n\r\n// Board_SURF4' '------------------\r\n']);
    
    % Step
    fprintf(fid, ['\r\n// Step ---------\r\n']);  
    
    % percent pattern
    fprintf(fid, ['\r\n// Percent Pattern\r\n']);
    fprintf(fid, ['const uint16_t gait_stand_B2' '_PP[' num2str(num_channels) '][8] = { \r\n']);
    for channel_id = 1:num_channels
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Stand.SURF4.Step' '.CH' num2str(dec2hex(channel_id)) '(:,1)']); %PP
        data_src = round(data_src*100); % change float to int and times 100;
        % Mem_size = Mem_size + printCppBracket(fid, data_src, 'float', '{', '}');
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint16_t', '{', '}');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n'); 

    % Print Pulse width
    fprintf(fid, ['\r\n// Pulse Width\r\n']);
    fprintf(fid, ['const uint8_t gait_stand_B2' '_PW[' num2str(num_channels) '][8] = { \r\n']);
    for channel_id = 1:num_channels
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Stand.SURF4.Step' '.CH' num2str(dec2hex(channel_id)) '(:,2)']); %PW
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');

    % Print Inter Phase Interval
    fprintf(fid, ['\r\n// Inter Phase Interval\r\n']);
    fprintf(fid, ['const uint8_t gait_stand_B2' '_IPI[' num2str(num_channels) '] = \r\n']);
    fprintf(fid, '\t\t{ ');
    for channel_id = 1:num_channels
        data_src = eval(['gait.Stand.SURF4.Step' '.CH' num2str(dec2hex(channel_id)) '(1,3)']); %IPI
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '', '');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        % fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');     