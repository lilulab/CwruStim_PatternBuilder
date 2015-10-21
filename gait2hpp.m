% read gait structure and convert it to Cpp Head file
%% Generate head files
% open head file
filename = input('Create file(*.h): ', 's');
clear fid
delete (filename);
fid = fopen(filename, 'a');

% print a comment title, followed by a blank line
fprintf(fid, '// StimPattern.h - Head file for storage Stim Patterns.\r\n');
fprintf(fid, '// Created by Lu Li (lxl361@case), SEP, 2015.\r\n');
fprintf(fid, '// Version 1.0\r\n');
fprintf(fid, '// Repo: https://github.com/lilulab/CwruStim_beta\r\n\r\n');

% print include
fprintf(fid, '#include <stdint.h>\r\n\r\n');
fprintf(fid, '#include <avr/pgmspace.h>\r\n\r\n');


% clear memory size counter.
Mem_size = 0;

% Print data array
% Mem_size = Mem_size + printCppArray( file_id, data_src, data_type )

% Walk L
for board_id = 1:2
    for channel_id = 1:12
        Mem_size = Mem_size + printCppArray( fid, ['gait_walk_L_B' num2str(board_id) '_CH' num2str(dec2hex(channel_id)) '_PP'] , eval(['gait.Walk.Lstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,1)']), 'float' );
        Mem_size = Mem_size + printCppArray( fid, ['gait_walk_L_B' num2str(board_id) '_CH' num2str(dec2hex(channel_id)) '_PW'] , eval(['gait.Walk.Lstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,2)']), 'uint8_t' );
        Mem_size = Mem_size + printCppArray( fid, ['gait_walk_L_B' num2str(board_id) '_CH' num2str(dec2hex(channel_id)) '_IPI'] , eval(['gait.Walk.Lstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(1,3)']), 'uint8_t' );
        fprintf(fid, '\r\n');        
    end
end

% Walk R
for board_id = 1:2
    for channel_id = 1:12
        Mem_size = Mem_size + printCppArray( fid, ['gait_walk_R_B' num2str(board_id) '_CH' num2str(dec2hex(channel_id)) '_PP'] , eval(['gait.Walk.Rstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,1)']), 'float' );
        Mem_size = Mem_size + printCppArray( fid, ['gait_walk_R_B' num2str(board_id) '_CH' num2str(dec2hex(channel_id)) '_PW'] , eval(['gait.Walk.Rstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(:,2)']), 'uint8_t' );
        Mem_size = Mem_size + printCppArray( fid, ['gait_walk_R_B' num2str(board_id) '_CH' num2str(dec2hex(channel_id)) '_IPI'] , eval(['gait.Walk.Rstep.board' num2str(board_id) '.CH' num2str(dec2hex(channel_id)) '(1,3)']), 'uint8_t' );
        fprintf(fid, '\r\n');        
    end
end


% print file ending
fprintf(fid, '// File End\r\n\r\n');

% close file
fclose(fid);
disp('-------------------------------------------------------------');
disp('Stim Pattern C Head File saved.');
str = ['    - Use EEPROM memory total size = ',num2str(Mem_size(1)/1024),'KB.'];
disp(str);
disp('Note:');
disp('    - Arduino Uno:    32 KB FLASH, and 1KB EEPROM storage.');
disp('    - Arduino Mega:   256KB FLASH, and 4KB EEPROM storage.');
