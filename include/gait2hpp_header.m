% create/open head file
% filename = input('Create file(*.h): ', 's');

title = 'Create C++ Header file(*.h):';
msg = ' Create file: (For example type "gait.h").';
answer = inputdlg(msg,title);
filename = char(answer);

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