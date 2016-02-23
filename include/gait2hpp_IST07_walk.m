% read gait structure and convert it to Cpp Head file

% Print data array
% Mem_size = Mem_size + printCppArray( file_id, data_src, data_type )

fprintf(fid, ['\r\n// ------ Walk ------\r\n']);

% Step duration
fprintf(fid, ['\r\n// Step Duration \r\n']);
fprintf(fid, ['const float gait_walk_R_duration = ' num2str(gait.Walk.Duration.Rstep) '; \r\n']);
fprintf(fid, ['const float gait_walk_L_duration = ' num2str(gait.Walk.Duration.Lstep) '; \r\n']);

% Channel Amplitude
fprintf(fid, ['\r\n// Channel Amplitude \r\n']);
fprintf(fid, ['const uint8_t gait_IST16_AMP[16] = ']);
data_src = gait.Walk.IST16.Amplitude;
Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
fprintf(fid, ';\r\n');

fprintf(fid, ['const uint8_t gait_SURF4_AMP[4] = ']);
data_src = gait.Walk.SURF4.Amplitude;
Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
fprintf(fid, ';\r\n');

% IST16 ---------------------------------------
    num_channels = 16;
    fprintf(fid, ['\r\n\r\n// Board_IST16' '------------------\r\n']);
    
    % Left Step
    fprintf(fid, ['\r\n// Left Step ---------\r\n']);  
    
    % percent pattern
    fprintf(fid, ['\r\n// Percent Pattern\r\n']);
    fprintf(fid, ['const uint16_t gait_walk_IST16_L' '_PP[' num2str(num_channels) '][8] = { \r\n']);
    for channel_id = 1:num_channels
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Walk.IST16.Lstep' '.CH' num2str(dec2hex(channel_id)) '(:,1)']); %PP
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
    fprintf(fid, ['const uint8_t gait_walk_IST16_L' '_PW[' num2str(num_channels) '][8] = { \r\n']);
    for channel_id = 1:num_channels
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Walk.IST16.Lstep' '.CH' num2str(dec2hex(channel_id)) '(:,2)']); %PW
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');

    % Print Inter Phase Interval
    fprintf(fid, ['\r\n// Inter Phase Interval\r\n']);
    fprintf(fid, ['const uint8_t gait_walk_IST16_L' '_IPI[' num2str(num_channels) '] = \r\n']);
    fprintf(fid, '\t\t{ ');
    for channel_id = 1:num_channels
        data_src = eval(['gait.Walk.IST16.Lstep' '.CH' num2str(dec2hex(channel_id)) '(1,3)']); %IPI
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '', '');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        % fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');     

% Right Step

    fprintf(fid, ['\r\n// Right Step ---------\r\n']);
    % percent pattern
    fprintf(fid, ['\r\n// Percent Pattern\r\n']);
    fprintf(fid, ['const uint16_t gait_walk_IST16_R' '_PP[' num2str(num_channels) '][8] = { \r\n']);
    for channel_id = 1:num_channels
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Walk.IST16.Rstep' '.CH' num2str(dec2hex(channel_id)) '(:,1)']); %PP
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
    fprintf(fid, ['const uint8_t gait_walk_IST16_R' '_PW[' num2str(num_channels) '][8] = { \r\n']);
    for channel_id = 1:num_channels
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Walk.IST16.Rstep' '.CH' num2str(dec2hex(channel_id)) '(:,2)']); %PW
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');

    % Print Inter Phase Interval
    fprintf(fid, ['\r\n// Inter Phase Interval\r\n']);
    fprintf(fid, ['const uint8_t gait_walk_IST16_R' '_IPI[' num2str(num_channels) '] = \r\n']);
    fprintf(fid, '\t\t{ ');
    for channel_id = 1:num_channels
        data_src = eval(['gait.Walk.IST16.Rstep' '.CH' num2str(dec2hex(channel_id)) '(1,3)']); %IPI
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
    
    % Left Step
    fprintf(fid, ['\r\n// Left Step ---------\r\n']);  
    
    % percent pattern
    fprintf(fid, ['\r\n// Percent Pattern\r\n']);
    fprintf(fid, ['const uint16_t gait_walk_SURF4_L' '_PP[' num2str(num_channels) '][8] = { \r\n']);
    for channel_id = 1:num_channels
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Walk.SURF4.Lstep' '.CH' num2str(dec2hex(channel_id)) '(:,1)']); %PP
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
    fprintf(fid, ['const uint8_t gait_walk_SURF4_L' '_PW[' num2str(num_channels) '][8] = { \r\n']);
    for channel_id = 1:num_channels
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Walk.SURF4.Lstep' '.CH' num2str(dec2hex(channel_id)) '(:,2)']); %PW
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');

    % Print Inter Phase Interval
    fprintf(fid, ['\r\n// Inter Phase Interval\r\n']);
    fprintf(fid, ['const uint8_t gait_walk_SURF4_L' '_IPI[' num2str(num_channels) '] = \r\n']);
    fprintf(fid, '\t\t{ ');
    for channel_id = 1:num_channels
        data_src = eval(['gait.Walk.SURF4.Lstep' '.CH' num2str(dec2hex(channel_id)) '(1,3)']); %IPI
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '', '');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        % fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');     

% Right Step

    fprintf(fid, ['\r\n// Right Step ---------\r\n']);
    % percent pattern
    fprintf(fid, ['\r\n// Percent Pattern\r\n']);
    fprintf(fid, ['const uint16_t gait_walk_SURF4_R' '_PP[' num2str(num_channels) '][8] = { \r\n']);
    for channel_id = 1:num_channels
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Walk.SURF4.Rstep' '.CH' num2str(dec2hex(channel_id)) '(:,1)']); %PP
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
    fprintf(fid, ['const uint8_t gait_walk_SURF4_R' '_PW[' num2str(num_channels) '][8] = { \r\n']);
    for channel_id = 1:num_channels
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Walk.SURF4.Rstep' '.CH' num2str(dec2hex(channel_id)) '(:,2)']); %PW
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');

    % Print Inter Phase Interval
    fprintf(fid, ['\r\n// Inter Phase Interval\r\n']);
    fprintf(fid, ['const uint8_t gait_walk_SURF4_R' '_IPI[' num2str(num_channels) '] = \r\n']);
    fprintf(fid, '\t\t{ ');
    for channel_id = 1:num_channels
        data_src = eval(['gait.Walk.SURF4.Rstep' '.CH' num2str(dec2hex(channel_id)) '(1,3)']); %IPI
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '', '');
        if (channel_id<num_channels) 
            fprintf(fid, ',');
        end
        % fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');  



% % Walk L
% for board_id = 1:2
%     for channel_id = 1:12
%         Mem_size = Mem_size + printCppArray( fid, ['gait_walk_L_B' num2str(board_id) '_CH' num2str(dec2hex(channel_id)) '_PP'] , eval(['gait.Walk.Lstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,1)']), 'float' );
%         Mem_size = Mem_size + printCppArray( fid, ['gait_walk_L_B' num2str(board_id) '_CH' num2str(dec2hex(channel_id)) '_PW'] , eval(['gait.Walk.Lstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,2)']), 'uint8_t' );
%         Mem_size = Mem_size + printCppArray( fid, ['gait_walk_L_B' num2str(board_id) '_CH' num2str(dec2hex(channel_id)) '_IPI'] , eval(['gait.Walk.Lstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(1,3)']), 'uint8_t' );
%         fprintf(fid, '\r\n');        
%     end
% end

% Walk R
% for board_id = 1:2
%     for channel_id = 1:12
%         Mem_size = Mem_size + printCppArray( fid, ['gait_walk_R_B' num2str(board_id) '_CH' num2str(dec2hex(channel_id)) '_PP'] , eval(['gait.Walk.Rstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,1)']), 'float' );
%         Mem_size = Mem_size + printCppArray( fid, ['gait_walk_R_B' num2str(board_id) '_CH' num2str(dec2hex(channel_id)) '_PW'] , eval(['gait.Walk.Rstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,2)']), 'uint8_t' );
%         Mem_size = Mem_size + printCppArray( fid, ['gait_walk_R_B' num2str(board_id) '_CH' num2str(dec2hex(channel_id)) '_IPI'] , eval(['gait.Walk.Rstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(1,3)']), 'uint8_t' );
%         fprintf(fid, '\r\n');        
%     end
% end

display ('Walk pattern saved to head file.');
str = ['    - Use EEPROM memory total size = ',num2str(Mem_size(1)/1024),'KB.'];
disp(str);
display (' ');