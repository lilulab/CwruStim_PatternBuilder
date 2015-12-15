
% print file ending
fprintf(fid, '// File End\r\n\r\n');

% close file
fclose(fid);
disp('-------------------------------------------------------------');
disp('All Stim Pattern C Head File saved.');
str = ['    - Use EEPROM memory total size = ',num2str(Mem_size(1)/1024),'KB.'];
disp(str);
disp('Note:');
disp('    - Arduino Uno:    32 KB FLASH, and 1KB EEPROM storage.');
disp('    - Arduino Mega:   256KB FLASH, and 4KB EEPROM storage.');

% Dialog and command line printing.
title = 'Finished!';
msg = {
  ' - All Stim Pattern C Head File saved.';
  str;
  '    - Arduino Uno:    32 KB FLASH, and 1KB EEPROM storage.';
  '    - Arduino Mega:   256KB FLASH, and 4KB EEPROM storage.'};

% pop dialog box
msgbox(msg,title);
