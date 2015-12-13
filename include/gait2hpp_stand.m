% read gait structure and convert it to Cpp Head file
%% Generate head files

% Print data array
% Mem_size = Mem_size + printCppArray( file_id, data_src, data_type )

fprintf(fid, ['\r\n// ------ Stand ------\r\n']);


% Step duration
fprintf(fid, ['\r\n// Step Duration \r\n']);
fprintf(fid, ['const float gait_stand_duration = ' num2str(gait.Stand.duration) '; \r\n']);


% Stand
for board_id = 1:2

    fprintf(fid, ['\r\n\r\n// Board ' num2str(board_id) '------------------\r\n']);
    
% Left Step
    
    % percent pattern
    fprintf(fid, ['\r\n// Percent Pattern\r\n']);
    fprintf(fid, ['const uint16_t gait_stand_B' num2str(board_id) '_PP[12][8] = { \r\n']);
    for channel_id = 1:12
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Stand.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,1)']); %PP
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
    fprintf(fid, ['const uint8_t gait_stand_B' num2str(board_id) '_PW[12][8] = { \r\n']);
    for channel_id = 1:12
        fprintf(fid, '\t\t');
        data_src = eval(['gait.Stand.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,2)']); %PW
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '{', '}');
        if (channel_id<12) 
            fprintf(fid, ',');
        end
        fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');

    % Print Inter Phase Interval
    fprintf(fid, ['\r\n// Inter Phase Interval\r\n']);
    fprintf(fid, ['const uint8_t gait_stand_B' num2str(board_id) '_IPI[12] = \r\n']);
    fprintf(fid, '\t\t{ ');
    for channel_id = 1:12
        data_src = eval(['gait.Stand.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(1,3)']); %IPI
        Mem_size = Mem_size + printCppBracket(fid, data_src, 'uint8_t', '', '');
        if (channel_id<12) 
            fprintf(fid, ',');
        end
        % fprintf(fid, '\r\n');     
    end
    fprintf(fid, '};\r\n\r\n');     

end

display ('Stand pattern saved to head file.');
str = ['    - Use EEPROM memory total size = ',num2str(Mem_size(1)/1024),'KB.'];
disp(str);
display (' ');
