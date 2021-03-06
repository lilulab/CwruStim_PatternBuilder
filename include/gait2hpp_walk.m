% read gait structure and convert it to Cpp Head file

% Print data array
% Mem_size = Mem_size + printCppArray( file_id, data_src, data_type )

fprintf(fid, ['\r\n// ------ Walk ------\r\n']);

% Channel Amplitude
fprintf(fid, ['\r\n// Channel Amplitude \r\n']);
fprintf(fid, ['const uint8_t gait_B1_AMP[12] = ']);
data_src = gait.Walk.Channel_amplitude.L;
Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
fprintf(fid, ';\r\n');

fprintf(fid, ['const uint8_t gait_B2_AMP[12] = ']);
data_src = gait.Walk.Channel_amplitude.R;
Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
fprintf(fid, ';\r\n');


% Step duration
fprintf(fid, ['\r\n// Step Duration \r\n']);
fprintf(fid, ['const float gait_walk_L_duration = ' num2str(gait.Walk.Lstep.duration) '; \r\n']);
fprintf(fid, ['const float gait_walk_R_duration = ' num2str(gait.Walk.Rstep.duration) '; \r\n']);


% Walk L
for board_id = 1:2

    fprintf(fid, ['\r\n\r\n// Board ' num2str(board_id) '------------------\r\n']);
    
% Left Step
    fprintf(fid, ['\r\n// Left Step ---------\r\n']);  
    
    % percent pattern
    fprintf(fid, ['\r\n// Percent Pattern\r\n']);
    fprintf(fid, ['const uint16_t gait_walk_L_B' num2str(board_id) '_PP[12][8] = { \r\n']);
    for channel_id = 1:12
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Walk.Lstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,1)']); %PP
        data_src = round(data_src*100); % change float to int and times 100;
        % Mem_size = Mem_size + printCppBracket(fid, data_src, 'float', '{', '}');
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint16_t', '{', '}');
        if (channel_id<12) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n'); 

    % Print Pulse width
    fprintf(fid, ['\r\n// Pulse Width\r\n']);
    fprintf(fid, ['const uint8_t gait_walk_L_B' num2str(board_id) '_PW[12][8] = { \r\n']);
    for channel_id = 1:12
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Walk.Lstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,2)']); %PW
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
        if (channel_id<12) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');

    % Print Inter Phase Interval
    fprintf(fid, ['\r\n// Inter Phase Interval\r\n']);
    fprintf(fid, ['const uint8_t gait_walk_L_B' num2str(board_id) '_IPI[12] = \r\n']);
    fprintf(fid, '\t\t{ ');
    for channel_id = 1:12
        data_src = eval(['gait.Walk.Lstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(1,3)']); %IPI
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '', '');
        if (channel_id<12) 
            fprintf(fid, ',');
        end
        % fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');     

% Right Step

    fprintf(fid, ['\r\n// Right Step ---------\r\n']);
    % percent pattern
    fprintf(fid, ['\r\n// Percent Pattern\r\n']);
    fprintf(fid, ['const uint16_t gait_walk_R_B' num2str(board_id) '_PP[12][8] = { \r\n']);
    for channel_id = 1:12
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Walk.Rstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,1)']); %PP
        data_src = round(data_src*100); % change float to int and times 100;
        % Mem_size = Mem_size + printCppBracket(fid, data_src, 'float', '{', '}');
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint16_t', '{', '}');
        if (channel_id<12) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n'); 

    % Print Pulse width
    fprintf(fid, ['\r\n// Pulse Width\r\n']);
    fprintf(fid, ['const uint8_t gait_walk_R_B' num2str(board_id) '_PW[12][8] = { \r\n']);
    for channel_id = 1:12
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Walk.Rstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,2)']); %PW
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
        if (channel_id<12) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');

    % Print Inter Phase Interval
    fprintf(fid, ['\r\n// Inter Phase Interval\r\n']);
    fprintf(fid, ['const uint8_t gait_walk_R_B' num2str(board_id) '_IPI[12] = \r\n']);
    fprintf(fid, '\t\t{ ');
    for channel_id = 1:12
        data_src = eval(['gait.Walk.Rstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(1,3)']); %IPI
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '', '');
        if (channel_id<12) 
            fprintf(fid, ',');
        end
        % fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');  

end

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