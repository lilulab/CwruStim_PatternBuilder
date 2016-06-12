[excel_filename, pathname] = uigetfile('*.xlsm*', 'Please select desired stim pattern parameter file');

[num, valid_check_walk] = xlsread(excel_filename, 'Walk', 'F36');
[num, valid_check_stand] = xlsread(excel_filename, 'Stand', 'F35');
[num, valid_check_sit] = xlsread(excel_filename, 'Sit', 'F35');
[num, valid_check_misc1] = xlsread(excel_filename, 'Misc1', 'F35');
[num, valid_check_misc2] = xlsread(excel_filename, 'Misc2', 'F35');
[num, valid_check_misc3] = xlsread(excel_filename, 'Misc3', 'F35');

valid_A = strcmp(valid_check_walk, 'Data Validated');
valid_B = strcmp(valid_check_stand, 'Data Validated');
valid_C = strcmp(valid_check_sit, 'Data Validated');
valid_D = strcmp(valid_check_misc1, 'Data Validated');
valid_E = strcmp(valid_check_misc2, 'Data Validated');
valid_F = strcmp(valid_check_misc3, 'Data Validated');


if ((valid_A == 1) && (valid_B == 1) && (valid_C == 1) && (valid_D == 1) && (valid_E == 1) && (valid_F == 1))
  
    walk_pattern_parameters = xlsread(excel_filename, 'Walk', 'F4:F29');
 
    lstep_duration = walk_pattern_parameters(1);
    rstep_duration = walk_pattern_parameters(2);
    bd1ch0amp = walk_pattern_parameters(3);
    bd1ch1amp = walk_pattern_parameters(4);
    bd1ch2amp = walk_pattern_parameters(5);
    bd1ch3amp = walk_pattern_parameters(6);
    bd1ch4amp = walk_pattern_parameters(7);
    bd1ch5amp = walk_pattern_parameters(8);
    bd1ch6amp = walk_pattern_parameters(9);
    bd1ch7amp = walk_pattern_parameters(10);
    bd1ch8amp = walk_pattern_parameters(11);
    bd1ch9amp = walk_pattern_parameters(12);
    bd1ch10amp = walk_pattern_parameters(13);
    bd1ch11amp = walk_pattern_parameters(14);
    bd2ch0amp = walk_pattern_parameters(15);
    bd2ch1amp = walk_pattern_parameters(16);
    bd2ch2amp = walk_pattern_parameters(17);
    bd2ch3amp = walk_pattern_parameters(18);
    bd2ch4amp = walk_pattern_parameters(19);
    bd2ch5amp = walk_pattern_parameters(20);
    bd2ch6amp = walk_pattern_parameters(21);
    bd2ch7amp = walk_pattern_parameters(22);
    bd2ch8amp = walk_pattern_parameters(23);
    bd2ch9amp = walk_pattern_parameters(24);
    bd2ch10amp = walk_pattern_parameters(25);
    bd2ch11amp = walk_pattern_parameters(26);
     
    
    [num, date_time] = xlsread(excel_filename, 'Walk', 'F1');
    [num, muscle_txt_bd1] = xlsread(excel_filename, 'Walk', 'B42:B98');
    [num, muscle_txt_bd2] = xlsread(excel_filename, 'Walk', 'J42:J98');

    muscle_ch0_bd1 = muscle_txt_bd1(1);
    muscle_ch1_bd1 = muscle_txt_bd1(9);
    muscle_ch2_bd1 = muscle_txt_bd1(17);
    muscle_ch3_bd1 = muscle_txt_bd1(25);
    muscle_ch4_bd1 = muscle_txt_bd1(33);
    muscle_ch5_bd1 = muscle_txt_bd1(41);
    muscle_ch6_bd1 = muscle_txt_bd1(49);
    muscle_ch7_bd1 = muscle_txt_bd1(57);
    
    muscle_ch0_bd2 = muscle_txt_bd2(1);
    muscle_ch1_bd2 = muscle_txt_bd2(9);
    muscle_ch2_bd2 = muscle_txt_bd2(17);
    muscle_ch3_bd2 = muscle_txt_bd2(25);
    muscle_ch4_bd2 = muscle_txt_bd2(33);
    muscle_ch5_bd2 = muscle_txt_bd2(41);
    muscle_ch6_bd2 = muscle_txt_bd2(49);
    muscle_ch7_bd2 = muscle_txt_bd2(57);

    lstep_values_bd1 = xlsread(excel_filename, 'Walk', 'C42:D105');
    lstep_values_bd2 = xlsread(excel_filename, 'Walk', 'K42:L105');
    rstep_values_bd1 = xlsread(excel_filename, 'Walk', 'F42:G105');
    rstep_values_bd2 = xlsread(excel_filename, 'Walk', 'N42:O105');

    lstep_values_bd1_x0 = 0.01 .* lstep_values_bd1(1:8, 1);
    lstep_values_bd1_y0 = uint8(lstep_values_bd1(1:8, 2));
    lstep_values_bd1_x1 = 0.01 .* lstep_values_bd1(9:16, 1);
    lstep_values_bd1_y1 = uint8(lstep_values_bd1(9:16, 2));
    lstep_values_bd1_x2 = 0.01 .* lstep_values_bd1(17:24, 1);
    lstep_values_bd1_y2 = uint8(lstep_values_bd1(17:24, 2));
    lstep_values_bd1_x3 = 0.01 .* lstep_values_bd1(25:32, 1);
    lstep_values_bd1_y3 = uint8(lstep_values_bd1(25:32, 2));
    lstep_values_bd1_x4 = 0.01 .* lstep_values_bd1(33:40, 1);
    lstep_values_bd1_y4 = uint8(lstep_values_bd1(33:40, 2));
    lstep_values_bd1_x5 = 0.01 .* lstep_values_bd1(41:48, 1);
    lstep_values_bd1_y5 = uint8(lstep_values_bd1(41:48, 2));
    lstep_values_bd1_x6 = 0.01 .* lstep_values_bd1(49:56, 1);
    lstep_values_bd1_y6 = uint8(lstep_values_bd1(49:56, 2));
    lstep_values_bd1_x7 = 0.01 .* lstep_values_bd1(57:64, 1);
    lstep_values_bd1_y7 = uint8(lstep_values_bd1(57:64, 2));
    
    lstep_values_bd2_x0 = 0.01 .* lstep_values_bd2(1:8, 1);
    lstep_values_bd2_y0 = uint8(lstep_values_bd2(1:8, 2));
    lstep_values_bd2_x1 = 0.01 .* lstep_values_bd2(9:16, 1);
    lstep_values_bd2_y1 = uint8(lstep_values_bd2(9:16, 2));
    lstep_values_bd2_x2 = 0.01 .* lstep_values_bd2(17:24, 1);
    lstep_values_bd2_y2 = uint8(lstep_values_bd2(17:24, 2));
    lstep_values_bd2_x3 = 0.01 .* lstep_values_bd2(25:32, 1);
    lstep_values_bd2_y3 = uint8(lstep_values_bd2(25:32, 2));
    lstep_values_bd2_x4 = 0.01 .* lstep_values_bd2(33:40, 1);
    lstep_values_bd2_y4 = uint8(lstep_values_bd2(33:40, 2));
    lstep_values_bd2_x5 = 0.01 .* lstep_values_bd2(41:48, 1);
    lstep_values_bd2_y5 = uint8(lstep_values_bd2(41:48, 2));
    lstep_values_bd2_x6 = 0.01 .* lstep_values_bd2(49:56, 1);
    lstep_values_bd2_y6 = uint8(lstep_values_bd2(49:56, 2));
    lstep_values_bd2_x7 = 0.01 .* lstep_values_bd2(57:64, 1);
    lstep_values_bd2_y7 = uint8(lstep_values_bd2(57:64, 2));
    
    rstep_values_bd1_x0 = 0.01 .* rstep_values_bd1(1:8, 1);
    rstep_values_bd1_y0 = uint8(rstep_values_bd1(1:8, 2));
    rstep_values_bd1_x1 = 0.01 .* rstep_values_bd1(9:16, 1);
    rstep_values_bd1_y1 = uint8(rstep_values_bd1(9:16, 2));
    rstep_values_bd1_x2 = 0.01 .* rstep_values_bd1(17:24, 1);
    rstep_values_bd1_y2 = uint8(rstep_values_bd1(17:24, 2));
    rstep_values_bd1_x3 = 0.01 .* rstep_values_bd1(25:32, 1);
    rstep_values_bd1_y3 = uint8(rstep_values_bd1(25:32, 2));
    rstep_values_bd1_x4 = 0.01 .* rstep_values_bd1(33:40, 1);
    rstep_values_bd1_y4 = uint8(rstep_values_bd1(33:40, 2));
    rstep_values_bd1_x5 = 0.01 .* rstep_values_bd1(41:48, 1);
    rstep_values_bd1_y5 = uint8(rstep_values_bd1(41:48, 2));
    rstep_values_bd1_x6 = 0.01 .* rstep_values_bd1(49:56, 1);
    rstep_values_bd1_y6 = uint8(rstep_values_bd1(49:56, 2));
    rstep_values_bd1_x7 = 0.01 .* rstep_values_bd1(57:64, 1);
    rstep_values_bd1_y7 = uint8(rstep_values_bd1(57:64, 2));
    
    rstep_values_bd2_x0 = 0.01 .* rstep_values_bd2(1:8, 1);
    rstep_values_bd2_y0 = uint8(rstep_values_bd2(1:8, 2));
    rstep_values_bd2_x1 = 0.01 .* rstep_values_bd2(9:16, 1);
    rstep_values_bd2_y1 = uint8(rstep_values_bd2(9:16, 2));
    rstep_values_bd2_x2 = 0.01 .* rstep_values_bd2(17:24, 1);
    rstep_values_bd2_y2 = uint8(rstep_values_bd2(17:24, 2));
    rstep_values_bd2_x3 = 0.01 .* rstep_values_bd2(25:32, 1);
    rstep_values_bd2_y3 = uint8(rstep_values_bd2(25:32, 2));
    rstep_values_bd2_x4 = 0.01 .* rstep_values_bd2(33:40, 1);
    rstep_values_bd2_y4 = uint8(rstep_values_bd2(33:40, 2));
    rstep_values_bd2_x5 = 0.01 .* rstep_values_bd2(41:48, 1);
    rstep_values_bd2_y5 = uint8(rstep_values_bd2(41:48, 2));
    rstep_values_bd2_x6 = 0.01 .* rstep_values_bd2(49:56, 1);
    rstep_values_bd2_y6 = uint8(rstep_values_bd2(49:56, 2));
    rstep_values_bd2_x7 = 0.01 .* rstep_values_bd2(57:64, 1);
    rstep_values_bd2_y7 = uint8(rstep_values_bd2(57:64, 2));
    
    

    lstep_values_bd1_x0_t = lstep_values_bd1_x0 .* lstep_duration;
    lstep_values_bd1_x1_t = lstep_values_bd1_x1 .* lstep_duration;
    lstep_values_bd1_x2_t = lstep_values_bd1_x2 .* lstep_duration;
    lstep_values_bd1_x3_t = lstep_values_bd1_x3 .* lstep_duration;
    lstep_values_bd1_x4_t = lstep_values_bd1_x4 .* lstep_duration;
    lstep_values_bd1_x5_t = lstep_values_bd1_x5 .* lstep_duration;
    lstep_values_bd1_x6_t = lstep_values_bd1_x6 .* lstep_duration;
    lstep_values_bd1_x7_t = lstep_values_bd1_x7 .* lstep_duration;
    
    lstep_values_bd2_x0_t = lstep_values_bd2_x0 .* lstep_duration;
    lstep_values_bd2_x1_t = lstep_values_bd2_x1 .* lstep_duration;
    lstep_values_bd2_x2_t = lstep_values_bd2_x2 .* lstep_duration;
    lstep_values_bd2_x3_t = lstep_values_bd2_x3 .* lstep_duration;
    lstep_values_bd2_x4_t = lstep_values_bd2_x4 .* lstep_duration;
    lstep_values_bd2_x5_t = lstep_values_bd2_x5 .* lstep_duration;
    lstep_values_bd2_x6_t = lstep_values_bd2_x6 .* lstep_duration;
    lstep_values_bd2_x7_t = lstep_values_bd2_x7 .* lstep_duration;
    
    rstep_values_bd1_x0_t = rstep_values_bd1_x0 .* rstep_duration;
    rstep_values_bd1_x1_t = rstep_values_bd1_x1 .* rstep_duration;
    rstep_values_bd1_x2_t = rstep_values_bd1_x2 .* rstep_duration;
    rstep_values_bd1_x3_t = rstep_values_bd1_x3 .* rstep_duration;
    rstep_values_bd1_x4_t = rstep_values_bd1_x4 .* rstep_duration;
    rstep_values_bd1_x5_t = rstep_values_bd1_x5 .* rstep_duration;
    rstep_values_bd1_x6_t = rstep_values_bd1_x6 .* rstep_duration;
    rstep_values_bd1_x7_t = rstep_values_bd1_x7 .* rstep_duration;
    
    rstep_values_bd2_x0_t = rstep_values_bd2_x0 .* rstep_duration;
    rstep_values_bd2_x1_t = rstep_values_bd2_x1 .* rstep_duration;
    rstep_values_bd2_x2_t = rstep_values_bd2_x2 .* rstep_duration;
    rstep_values_bd2_x3_t = rstep_values_bd2_x3 .* rstep_duration;
    rstep_values_bd2_x4_t = rstep_values_bd2_x4 .* rstep_duration;
    rstep_values_bd2_x5_t = rstep_values_bd2_x5 .* rstep_duration;
    rstep_values_bd2_x6_t = rstep_values_bd2_x6 .* rstep_duration;
    rstep_values_bd2_x7_t = rstep_values_bd2_x7 .* rstep_duration;

  
    stand_duration = xlsread(excel_filename, 'Stand', 'F4');
    stand_values_bd1 = xlsread(excel_filename, 'Stand', 'C42:D105');
    stand_values_bd2 = xlsread(excel_filename, 'Stand', 'K42:L105');

    sit_duration = xlsread(excel_filename, 'Sit', 'F4');
    sit_values_bd1 = xlsread(excel_filename, 'Sit', 'C42:D105');
    sit_values_bd2 = xlsread(excel_filename, 'Sit', 'K42:L105');
    
    misc1_duration = xlsread(excel_filename, 'Misc1', 'F4');
    misc1_values_bd1 = xlsread(excel_filename, 'Misc1', 'C42:D105');
    misc1_values_bd2 = xlsread(excel_filename, 'Misc1', 'K42:L105');
    
    misc2_duration = xlsread(excel_filename, 'Misc2', 'F4');
    misc2_values_bd1 = xlsread(excel_filename, 'Misc2', 'C42:D105');
    misc2_values_bd2 = xlsread(excel_filename, 'Misc2', 'K42:L105');
    
    misc3_duration = xlsread(excel_filename, 'Misc3', 'F4');
    misc3_values_bd1 = xlsread(excel_filename, 'Misc3', 'C42:D105');
    misc3_values_bd2 = xlsread(excel_filename, 'Misc3', 'K42:L105');


  
    stand_values_bd1_x0 = 0.01 .* stand_values_bd1(1:8, 1);
    stand_values_bd1_y0 = uint8(stand_values_bd1(1:8, 2));
    stand_values_bd1_x1 = 0.01 .* stand_values_bd1(9:16, 1);
    stand_values_bd1_y1 = uint8(stand_values_bd1(9:16, 2));
    stand_values_bd1_x2 = 0.01 .* stand_values_bd1(17:24, 1);
    stand_values_bd1_y2 = uint8(stand_values_bd1(17:24, 2));
    stand_values_bd1_x3 = 0.01 .* stand_values_bd1(25:32, 1);
    stand_values_bd1_y3 = uint8(stand_values_bd1(25:32, 2));
    stand_values_bd1_x4 = 0.01 .* stand_values_bd1(33:40, 1);
    stand_values_bd1_y4 = uint8(stand_values_bd1(33:40, 2));
    stand_values_bd1_x5 = 0.01 .* stand_values_bd1(41:48, 1);
    stand_values_bd1_y5 = uint8(stand_values_bd1(41:48, 2));
    stand_values_bd1_x6 = 0.01 .* stand_values_bd1(49:56, 1);
    stand_values_bd1_y6 = uint8(stand_values_bd1(49:56, 2));
    stand_values_bd1_x7 = 0.01 .* stand_values_bd1(57:64, 1);
    stand_values_bd1_y7 = uint8(stand_values_bd1(57:64, 2));
    
    stand_values_bd2_x0 = 0.01 .* stand_values_bd2(1:8, 1);
    stand_values_bd2_y0 = uint8(stand_values_bd2(1:8, 2));
    stand_values_bd2_x1 = 0.01 .* stand_values_bd2(9:16, 1);
    stand_values_bd2_y1 = uint8(stand_values_bd2(9:16, 2));
    stand_values_bd2_x2 = 0.01 .* stand_values_bd2(17:24, 1);
    stand_values_bd2_y2 = uint8(stand_values_bd2(17:24, 2));
    stand_values_bd2_x3 = 0.01 .* stand_values_bd2(25:32, 1);
    stand_values_bd2_y3 = uint8(stand_values_bd2(25:32, 2));
    stand_values_bd2_x4 = 0.01 .* stand_values_bd2(33:40, 1);
    stand_values_bd2_y4 = uint8(stand_values_bd2(33:40, 2));
    stand_values_bd2_x5 = 0.01 .* stand_values_bd2(41:48, 1);
    stand_values_bd2_y5 = uint8(stand_values_bd2(41:48, 2));
    stand_values_bd2_x6 = 0.01 .* stand_values_bd2(49:56, 1);
    stand_values_bd2_y6 = uint8(stand_values_bd2(49:56, 2));
    stand_values_bd2_x7 = 0.01 .* stand_values_bd2(57:64, 1);
    stand_values_bd2_y7 = uint8(stand_values_bd2(57:64, 2));
    
    
    sit_values_bd1_x0 = 0.01 .* sit_values_bd1(1:8, 1);
    sit_values_bd1_y0 = uint8(sit_values_bd1(1:8, 2));
    sit_values_bd1_x1 = 0.01 .* sit_values_bd1(9:16, 1);
    sit_values_bd1_y1 = uint8(sit_values_bd1(9:16, 2));
    sit_values_bd1_x2 = 0.01 .* sit_values_bd1(17:24, 1);
    sit_values_bd1_y2 = uint8(sit_values_bd1(17:24, 2));
    sit_values_bd1_x3 = 0.01 .* sit_values_bd1(25:32, 1);
    sit_values_bd1_y3 = uint8(sit_values_bd1(25:32, 2));
    sit_values_bd1_x4 = 0.01 .* sit_values_bd1(33:40, 1);
    sit_values_bd1_y4 = uint8(sit_values_bd1(33:40, 2));
    sit_values_bd1_x5 = 0.01 .* sit_values_bd1(41:48, 1);
    sit_values_bd1_y5 = uint8(sit_values_bd1(41:48, 2));
    sit_values_bd1_x6 = 0.01 .* sit_values_bd1(49:56, 1);
    sit_values_bd1_y6 = uint8(sit_values_bd1(49:56, 2));
    sit_values_bd1_x7 = 0.01 .* sit_values_bd1(57:64, 1);
    sit_values_bd1_y7 = uint8(sit_values_bd1(57:64, 2));
    
    sit_values_bd2_x0 = 0.01 .* sit_values_bd2(1:8, 1);
    sit_values_bd2_y0 = uint8(sit_values_bd2(1:8, 2));
    sit_values_bd2_x1 = 0.01 .* sit_values_bd2(9:16, 1);
    sit_values_bd2_y1 = uint8(sit_values_bd2(9:16, 2));
    sit_values_bd2_x2 = 0.01 .* sit_values_bd2(17:24, 1);
    sit_values_bd2_y2 = uint8(sit_values_bd2(17:24, 2));
    sit_values_bd2_x3 = 0.01 .* sit_values_bd2(25:32, 1);
    sit_values_bd2_y3 = uint8(sit_values_bd2(25:32, 2));
    sit_values_bd2_x4 = 0.01 .* sit_values_bd2(33:40, 1);
    sit_values_bd2_y4 = uint8(sit_values_bd2(33:40, 2));
    sit_values_bd2_x5 = 0.01 .* sit_values_bd2(41:48, 1);
    sit_values_bd2_y5 = uint8(sit_values_bd2(41:48, 2));
    sit_values_bd2_x6 = 0.01 .* sit_values_bd2(49:56, 1);
    sit_values_bd2_y6 = uint8(sit_values_bd2(49:56, 2));
    sit_values_bd2_x7 = 0.01 .* sit_values_bd2(57:64, 1);
    sit_values_bd2_y7 = uint8(sit_values_bd2(57:64, 2));
    
    
    misc1_values_bd1_x0 = 0.01 .* misc1_values_bd1(1:8, 1);
    misc1_values_bd1_y0 = uint8(misc1_values_bd1(1:8, 2));
    misc1_values_bd1_x1 = 0.01 .* misc1_values_bd1(9:16, 1);
    misc1_values_bd1_y1 = uint8(misc1_values_bd1(9:16, 2));
    misc1_values_bd1_x2 = 0.01 .* misc1_values_bd1(17:24, 1);
    misc1_values_bd1_y2 = uint8(misc1_values_bd1(17:24, 2));
    misc1_values_bd1_x3 = 0.01 .* misc1_values_bd1(25:32, 1);
    misc1_values_bd1_y3 = uint8(misc1_values_bd1(25:32, 2));
    misc1_values_bd1_x4 = 0.01 .* misc1_values_bd1(33:40, 1);
    misc1_values_bd1_y4 = uint8(misc1_values_bd1(33:40, 2));
    misc1_values_bd1_x5 = 0.01 .* misc1_values_bd1(41:48, 1);
    misc1_values_bd1_y5 = uint8(misc1_values_bd1(41:48, 2));
    misc1_values_bd1_x6 = 0.01 .* misc1_values_bd1(49:56, 1);
    misc1_values_bd1_y6 = uint8(misc1_values_bd1(49:56, 2));
    misc1_values_bd1_x7 = 0.01 .* misc1_values_bd1(57:64, 1);
    misc1_values_bd1_y7 = uint8(misc1_values_bd1(57:64, 2));
    
    misc1_values_bd2_x0 = 0.01 .* misc1_values_bd2(1:8, 1);
    misc1_values_bd2_y0 = uint8(misc1_values_bd2(1:8, 2));
    misc1_values_bd2_x1 = 0.01 .* misc1_values_bd2(9:16, 1);
    misc1_values_bd2_y1 = uint8(misc1_values_bd2(9:16, 2));
    misc1_values_bd2_x2 = 0.01 .* misc1_values_bd2(17:24, 1);
    misc1_values_bd2_y2 = uint8(misc1_values_bd2(17:24, 2));
    misc1_values_bd2_x3 = 0.01 .* misc1_values_bd2(25:32, 1);
    misc1_values_bd2_y3 = uint8(misc1_values_bd2(25:32, 2));
    misc1_values_bd2_x4 = 0.01 .* misc1_values_bd2(33:40, 1);
    misc1_values_bd2_y4 = uint8(misc1_values_bd2(33:40, 2));
    misc1_values_bd2_x5 = 0.01 .* misc1_values_bd2(41:48, 1);
    misc1_values_bd2_y5 = uint8(misc1_values_bd2(41:48, 2));
    misc1_values_bd2_x6 = 0.01 .* misc1_values_bd2(49:56, 1);
    misc1_values_bd2_y6 = uint8(misc1_values_bd2(49:56, 2));
    misc1_values_bd2_x7 = 0.01 .* misc1_values_bd2(57:64, 1);
    misc1_values_bd2_y7 = uint8(misc1_values_bd2(57:64, 2));
    
    
    misc2_values_bd1_x0 = 0.01 .* misc2_values_bd1(1:8, 1);
    misc2_values_bd1_y0 = uint8(misc2_values_bd1(1:8, 2));
    misc2_values_bd1_x1 = 0.01 .* misc2_values_bd1(9:16, 1);
    misc2_values_bd1_y1 = uint8(misc2_values_bd1(9:16, 2));
    misc2_values_bd1_x2 = 0.01 .* misc2_values_bd1(17:24, 1);
    misc2_values_bd1_y2 = uint8(misc2_values_bd1(17:24, 2));
    misc2_values_bd1_x3 = 0.01 .* misc2_values_bd1(25:32, 1);
    misc2_values_bd1_y3 = uint8(misc2_values_bd1(25:32, 2));
    misc2_values_bd1_x4 = 0.01 .* misc2_values_bd1(33:40, 1);
    misc2_values_bd1_y4 = uint8(misc2_values_bd1(33:40, 2));
    misc2_values_bd1_x5 = 0.01 .* misc2_values_bd1(41:48, 1);
    misc2_values_bd1_y5 = uint8(misc2_values_bd1(41:48, 2));
    misc2_values_bd1_x6 = 0.01 .* misc2_values_bd1(49:56, 1);
    misc2_values_bd1_y6 = uint8(misc2_values_bd1(49:56, 2));
    misc2_values_bd1_x7 = 0.01 .* misc2_values_bd1(57:64, 1);
    misc2_values_bd1_y7 = uint8(misc2_values_bd1(57:64, 2));
    
    misc2_values_bd2_x0 = 0.01 .* misc2_values_bd2(1:8, 1);
    misc2_values_bd2_y0 = uint8(misc2_values_bd2(1:8, 2));
    misc2_values_bd2_x1 = 0.01 .* misc2_values_bd2(9:16, 1);
    misc2_values_bd2_y1 = uint8(misc2_values_bd2(9:16, 2));
    misc2_values_bd2_x2 = 0.01 .* misc2_values_bd2(17:24, 1);
    misc2_values_bd2_y2 = uint8(misc2_values_bd2(17:24, 2));
    misc2_values_bd2_x3 = 0.01 .* misc2_values_bd2(25:32, 1);
    misc2_values_bd2_y3 = uint8(misc2_values_bd2(25:32, 2));
    misc2_values_bd2_x4 = 0.01 .* misc2_values_bd2(33:40, 1);
    misc2_values_bd2_y4 = uint8(misc2_values_bd2(33:40, 2));
    misc2_values_bd2_x5 = 0.01 .* misc2_values_bd2(41:48, 1);
    misc2_values_bd2_y5 = uint8(misc2_values_bd2(41:48, 2));
    misc2_values_bd2_x6 = 0.01 .* misc2_values_bd2(49:56, 1);
    misc2_values_bd2_y6 = uint8(misc2_values_bd2(49:56, 2));
    misc2_values_bd2_x7 = 0.01 .* misc2_values_bd2(57:64, 1);
    misc2_values_bd2_y7 = uint8(misc2_values_bd2(57:64, 2));
    
    
    misc3_values_bd1_x0 = 0.01 .* misc3_values_bd1(1:8, 1);
    misc3_values_bd1_y0 = uint8(misc3_values_bd1(1:8, 2));
    misc3_values_bd1_x1 = 0.01 .* misc3_values_bd1(9:16, 1);
    misc3_values_bd1_y1 = uint8(misc3_values_bd1(9:16, 2));
    misc3_values_bd1_x2 = 0.01 .* misc3_values_bd1(17:24, 1);
    misc3_values_bd1_y2 = uint8(misc3_values_bd1(17:24, 2));
    misc3_values_bd1_x3 = 0.01 .* misc3_values_bd1(25:32, 1);
    misc3_values_bd1_y3 = uint8(misc3_values_bd1(25:32, 2));
    misc3_values_bd1_x4 = 0.01 .* misc3_values_bd1(33:40, 1);
    misc3_values_bd1_y4 = uint8(misc3_values_bd1(33:40, 2));
    misc3_values_bd1_x5 = 0.01 .* misc3_values_bd1(41:48, 1);
    misc3_values_bd1_y5 = uint8(misc3_values_bd1(41:48, 2));
    misc3_values_bd1_x6 = 0.01 .* misc3_values_bd1(49:56, 1);
    misc3_values_bd1_y6 = uint8(misc3_values_bd1(49:56, 2));
    misc3_values_bd1_x7 = 0.01 .* misc3_values_bd1(57:64, 1);
    misc3_values_bd1_y7 = uint8(misc3_values_bd1(57:64, 2));
    
    misc3_values_bd2_x0 = 0.01 .* misc3_values_bd2(1:8, 1);
    misc3_values_bd2_y0 = uint8(misc3_values_bd2(1:8, 2));
    misc3_values_bd2_x1 = 0.01 .* misc3_values_bd2(9:16, 1);
    misc3_values_bd2_y1 = uint8(misc3_values_bd2(9:16, 2));
    misc3_values_bd2_x2 = 0.01 .* misc3_values_bd2(17:24, 1);
    misc3_values_bd2_y2 = uint8(misc3_values_bd2(17:24, 2));
    misc3_values_bd2_x3 = 0.01 .* misc3_values_bd2(25:32, 1);
    misc3_values_bd2_y3 = uint8(misc3_values_bd2(25:32, 2));
    misc3_values_bd2_x4 = 0.01 .* misc3_values_bd2(33:40, 1);
    misc3_values_bd2_y4 = uint8(misc3_values_bd2(33:40, 2));
    misc3_values_bd2_x5 = 0.01 .* misc3_values_bd2(41:48, 1);
    misc3_values_bd2_y5 = uint8(misc3_values_bd2(41:48, 2));
    misc3_values_bd2_x6 = 0.01 .* misc3_values_bd2(49:56, 1);
    misc3_values_bd2_y6 = uint8(misc3_values_bd2(49:56, 2));
    misc3_values_bd2_x7 = 0.01 .* misc3_values_bd2(57:64, 1);
    misc3_values_bd2_y7 = uint8(misc3_values_bd2(57:64, 2));
    
    
    stand_values_bd1_x0_t = stand_values_bd1_x0 .* stand_duration;
    stand_values_bd1_x1_t = stand_values_bd1_x1 .* stand_duration;
    stand_values_bd1_x2_t = stand_values_bd1_x2 .* stand_duration;
    stand_values_bd1_x3_t = stand_values_bd1_x3 .* stand_duration;
    stand_values_bd1_x4_t = stand_values_bd1_x4 .* stand_duration;
    stand_values_bd1_x5_t = stand_values_bd1_x5 .* stand_duration;
    stand_values_bd1_x6_t = stand_values_bd1_x6 .* stand_duration;
    stand_values_bd1_x7_t = stand_values_bd1_x7 .* stand_duration;
    
    stand_values_bd2_x0_t = stand_values_bd2_x0 .* stand_duration;
    stand_values_bd2_x1_t = stand_values_bd2_x1 .* stand_duration;
    stand_values_bd2_x2_t = stand_values_bd2_x2 .* stand_duration;
    stand_values_bd2_x3_t = stand_values_bd2_x3 .* stand_duration;
    stand_values_bd2_x4_t = stand_values_bd2_x4 .* stand_duration;
    stand_values_bd2_x5_t = stand_values_bd2_x5 .* stand_duration;
    stand_values_bd2_x6_t = stand_values_bd2_x6 .* stand_duration;
    stand_values_bd2_x7_t = stand_values_bd2_x7 .* stand_duration;
    
    sit_values_bd1_x0_t = sit_values_bd1_x0 .* sit_duration;
    sit_values_bd1_x1_t = sit_values_bd1_x1 .* sit_duration;
    sit_values_bd1_x2_t = sit_values_bd1_x2 .* sit_duration;
    sit_values_bd1_x3_t = sit_values_bd1_x3 .* sit_duration;
    sit_values_bd1_x4_t = sit_values_bd1_x4 .* sit_duration;
    sit_values_bd1_x5_t = sit_values_bd1_x5 .* sit_duration;
    sit_values_bd1_x6_t = sit_values_bd1_x6 .* sit_duration;
    sit_values_bd1_x7_t = sit_values_bd1_x7 .* sit_duration;
    
    sit_values_bd2_x0_t = sit_values_bd2_x0 .* sit_duration;
    sit_values_bd2_x1_t = sit_values_bd2_x1 .* sit_duration;
    sit_values_bd2_x2_t = sit_values_bd2_x2 .* sit_duration;
    sit_values_bd2_x3_t = sit_values_bd2_x3 .* sit_duration;
    sit_values_bd2_x4_t = sit_values_bd2_x4 .* sit_duration;
    sit_values_bd2_x5_t = sit_values_bd2_x5 .* sit_duration;
    sit_values_bd2_x6_t = sit_values_bd2_x6 .* sit_duration;
    sit_values_bd2_x7_t = sit_values_bd2_x7 .* sit_duration;
    
    misc1_values_bd1_x0_t = misc1_values_bd1_x0 .* misc1_duration;
    misc1_values_bd1_x1_t = misc1_values_bd1_x1 .* misc1_duration;
    misc1_values_bd1_x2_t = misc1_values_bd1_x2 .* misc1_duration;
    misc1_values_bd1_x3_t = misc1_values_bd1_x3 .* misc1_duration;
    misc1_values_bd1_x4_t = misc1_values_bd1_x4 .* misc1_duration;
    misc1_values_bd1_x5_t = misc1_values_bd1_x5 .* misc1_duration;
    misc1_values_bd1_x6_t = misc1_values_bd1_x6 .* misc1_duration;
    misc1_values_bd1_x7_t = misc1_values_bd1_x7 .* misc1_duration;
    
    misc1_values_bd2_x0_t = misc1_values_bd2_x0 .* misc1_duration;
    misc1_values_bd2_x1_t = misc1_values_bd2_x1 .* misc1_duration;
    misc1_values_bd2_x2_t = misc1_values_bd2_x2 .* misc1_duration;
    misc1_values_bd2_x3_t = misc1_values_bd2_x3 .* misc1_duration;
    misc1_values_bd2_x4_t = misc1_values_bd2_x4 .* misc1_duration;
    misc1_values_bd2_x5_t = misc1_values_bd2_x5 .* misc1_duration;
    misc1_values_bd2_x6_t = misc1_values_bd2_x6 .* misc1_duration;
    misc1_values_bd2_x7_t = misc1_values_bd2_x7 .* misc1_duration;
   
    
    misc2_values_bd1_x0_t = misc2_values_bd1_x0 .* misc2_duration;
    misc2_values_bd1_x1_t = misc2_values_bd1_x1 .* misc2_duration;
    misc2_values_bd1_x2_t = misc2_values_bd1_x2 .* misc2_duration;
    misc2_values_bd1_x3_t = misc2_values_bd1_x3 .* misc2_duration;
    misc2_values_bd1_x4_t = misc2_values_bd1_x4 .* misc2_duration;
    misc2_values_bd1_x5_t = misc2_values_bd1_x5 .* misc2_duration;
    misc2_values_bd1_x6_t = misc2_values_bd1_x6 .* misc2_duration;
    misc2_values_bd1_x7_t = misc2_values_bd1_x7 .* misc2_duration;
    
    misc2_values_bd2_x0_t = misc2_values_bd2_x0 .* misc2_duration;
    misc2_values_bd2_x1_t = misc2_values_bd2_x1 .* misc2_duration;
    misc2_values_bd2_x2_t = misc2_values_bd2_x2 .* misc2_duration;
    misc2_values_bd2_x3_t = misc2_values_bd2_x3 .* misc2_duration;
    misc2_values_bd2_x4_t = misc2_values_bd2_x4 .* misc2_duration;
    misc2_values_bd2_x5_t = misc2_values_bd2_x5 .* misc2_duration;
    misc2_values_bd2_x6_t = misc2_values_bd2_x6 .* misc2_duration;
    misc2_values_bd2_x7_t = misc2_values_bd2_x7 .* misc2_duration;
    
    
    misc3_values_bd1_x0_t = misc3_values_bd1_x0 .* misc3_duration;
    misc3_values_bd1_x1_t = misc3_values_bd1_x1 .* misc3_duration;
    misc3_values_bd1_x2_t = misc3_values_bd1_x2 .* misc3_duration;
    misc3_values_bd1_x3_t = misc3_values_bd1_x3 .* misc3_duration;
    misc3_values_bd1_x4_t = misc3_values_bd1_x4 .* misc3_duration;
    misc3_values_bd1_x5_t = misc3_values_bd1_x5 .* misc3_duration;
    misc3_values_bd1_x6_t = misc3_values_bd1_x6 .* misc3_duration;
    misc3_values_bd1_x7_t = misc3_values_bd1_x7 .* misc3_duration;
   
    misc3_values_bd2_x0_t = misc3_values_bd2_x0 .* misc3_duration;
    misc3_values_bd2_x1_t = misc3_values_bd2_x1 .* misc3_duration;
    misc3_values_bd2_x2_t = misc3_values_bd2_x2 .* misc3_duration;
    misc3_values_bd2_x3_t = misc3_values_bd2_x3 .* misc3_duration;
    misc3_values_bd2_x4_t = misc3_values_bd2_x4 .* misc3_duration;
    misc3_values_bd2_x5_t = misc3_values_bd2_x5 .* misc3_duration;
    misc3_values_bd2_x6_t = misc3_values_bd2_x6 .* misc3_duration;
    misc3_values_bd2_x7_t = misc3_values_bd2_x7 .* misc3_duration;
    

    lstep_IPI_bd1 = xlsread(excel_filename, 'Walk', 'E42:E98');
    lstep_IPI_bd2 = xlsread(excel_filename, 'Walk', 'M42:M98');
    
    lstep_IPI_bd1_ch0 = lstep_IPI_bd1(1);
    lstep_IPI_bd1_ch1 = lstep_IPI_bd1(9);
    lstep_IPI_bd1_ch2 = lstep_IPI_bd1(17);
    lstep_IPI_bd1_ch3 = lstep_IPI_bd1(25);
    lstep_IPI_bd1_ch4 = lstep_IPI_bd1(33);
    lstep_IPI_bd1_ch5 = lstep_IPI_bd1(41);
    lstep_IPI_bd1_ch6 = lstep_IPI_bd1(49);
    lstep_IPI_bd1_ch7 = lstep_IPI_bd1(57);
    
    lstep_IPI_bd2_ch0 = lstep_IPI_bd2(1);
    lstep_IPI_bd2_ch1 = lstep_IPI_bd2(9);
    lstep_IPI_bd2_ch2 = lstep_IPI_bd2(17);
    lstep_IPI_bd2_ch3 = lstep_IPI_bd2(25);
    lstep_IPI_bd2_ch4 = lstep_IPI_bd2(33);
    lstep_IPI_bd2_ch5 = lstep_IPI_bd2(41);
    lstep_IPI_bd2_ch6 = lstep_IPI_bd2(49);
    lstep_IPI_bd2_ch7 = lstep_IPI_bd2(57);
    
    
    lstep_IPI_all = [lstep_IPI_bd1_ch0 lstep_IPI_bd1_ch1 lstep_IPI_bd1_ch2 lstep_IPI_bd1_ch3 lstep_IPI_bd1_ch4 lstep_IPI_bd1_ch5 lstep_IPI_bd1_ch6 lstep_IPI_bd1_ch7 lstep_IPI_bd2_ch0 lstep_IPI_bd2_ch1 lstep_IPI_bd2_ch2 lstep_IPI_bd2_ch3 lstep_IPI_bd2_ch4 lstep_IPI_bd2_ch5 lstep_IPI_bd2_ch6 lstep_IPI_bd2_ch7];

    for N = 1:16;
        E = lstep_IPI_all(N); 
        if E == 60
            lstep_IPI_all_color(N) = 'b';
        elseif E == 30
            lstep_IPI_all_color(N) = 'r';
        elseif E == 50
            lstep_IPI_all_color(N) = 'g';
        else 
            lstep_IPI_all_color(N) = 'k'; 
        end
    end
    
    lstep_bd1_ch0_color = lstep_IPI_all_color(1);
    lstep_bd1_ch1_color = lstep_IPI_all_color(2);
    lstep_bd1_ch2_color = lstep_IPI_all_color(3);
    lstep_bd1_ch3_color = lstep_IPI_all_color(4);
    lstep_bd1_ch4_color = lstep_IPI_all_color(5);
    lstep_bd1_ch5_color = lstep_IPI_all_color(6);
    lstep_bd1_ch6_color = lstep_IPI_all_color(7);
    lstep_bd1_ch7_color = lstep_IPI_all_color(8);
    lstep_bd2_ch0_color = lstep_IPI_all_color(9);
    lstep_bd2_ch1_color = lstep_IPI_all_color(10);
    lstep_bd2_ch2_color = lstep_IPI_all_color(11);
    lstep_bd2_ch3_color = lstep_IPI_all_color(12);
    lstep_bd2_ch4_color = lstep_IPI_all_color(13);
    lstep_bd2_ch5_color = lstep_IPI_all_color(14);
    lstep_bd2_ch6_color = lstep_IPI_all_color(15);
    lstep_bd2_ch7_color = lstep_IPI_all_color(16);
    
    
    rstep_IPI_bd1 = xlsread(excel_filename, 'Walk', 'H42:H98');
    rstep_IPI_bd2 = xlsread(excel_filename, 'Walk', 'P42:P98');
    
    rstep_IPI_bd1_ch0 = rstep_IPI_bd1(1);
    rstep_IPI_bd1_ch1 = rstep_IPI_bd1(9);
    rstep_IPI_bd1_ch2 = rstep_IPI_bd1(17);
    rstep_IPI_bd1_ch3 = rstep_IPI_bd1(25);
    rstep_IPI_bd1_ch4 = rstep_IPI_bd1(33);
    rstep_IPI_bd1_ch5 = rstep_IPI_bd1(41);
    rstep_IPI_bd1_ch6 = rstep_IPI_bd1(49);
    rstep_IPI_bd1_ch7 = rstep_IPI_bd1(57);
    
    rstep_IPI_bd2_ch0 = rstep_IPI_bd2(1);
    rstep_IPI_bd2_ch1 = rstep_IPI_bd2(9);
    rstep_IPI_bd2_ch2 = rstep_IPI_bd2(17);
    rstep_IPI_bd2_ch3 = rstep_IPI_bd2(25);
    rstep_IPI_bd2_ch4 = rstep_IPI_bd2(33);
    rstep_IPI_bd2_ch5 = rstep_IPI_bd2(41);
    rstep_IPI_bd2_ch6 = rstep_IPI_bd2(49);
    rstep_IPI_bd2_ch7 = rstep_IPI_bd2(57);
    
    
    
    rstep_IPI_all = [rstep_IPI_bd1_ch0 rstep_IPI_bd1_ch1 rstep_IPI_bd1_ch2 rstep_IPI_bd1_ch3 rstep_IPI_bd1_ch4 rstep_IPI_bd1_ch5 rstep_IPI_bd1_ch6 rstep_IPI_bd1_ch7 rstep_IPI_bd2_ch0 rstep_IPI_bd2_ch1 rstep_IPI_bd2_ch2 rstep_IPI_bd2_ch3 rstep_IPI_bd2_ch4 rstep_IPI_bd2_ch5 rstep_IPI_bd2_ch6 rstep_IPI_bd2_ch7];

    for N = 1:16;
        E = rstep_IPI_all(N); 
        if E == 60
            rstep_IPI_all_color(N) = 'b';
        elseif E == 30
            rstep_IPI_all_color(N) = 'r';
        elseif E == 50
            rstep_IPI_all_color(N) = 'g';
        else 
            rstep_IPI_all_color(N) = 'k'; 
        end
    end
    
    rstep_bd1_ch0_color = rstep_IPI_all_color(1);
    rstep_bd1_ch1_color = rstep_IPI_all_color(2);
    rstep_bd1_ch2_color = rstep_IPI_all_color(3);
    rstep_bd1_ch3_color = rstep_IPI_all_color(4);
    rstep_bd1_ch4_color = rstep_IPI_all_color(5);
    rstep_bd1_ch5_color = rstep_IPI_all_color(6);
    rstep_bd1_ch6_color = rstep_IPI_all_color(7);
    rstep_bd1_ch7_color = rstep_IPI_all_color(8);
    rstep_bd2_ch0_color = rstep_IPI_all_color(9);
    rstep_bd2_ch1_color = rstep_IPI_all_color(10);
    rstep_bd2_ch2_color = rstep_IPI_all_color(11);
    rstep_bd2_ch3_color = rstep_IPI_all_color(12);
    rstep_bd2_ch4_color = rstep_IPI_all_color(13);
    rstep_bd2_ch5_color = rstep_IPI_all_color(14);
    rstep_bd2_ch6_color = rstep_IPI_all_color(15);
    rstep_bd2_ch7_color = rstep_IPI_all_color(16);
    
    
    
    stand_IPI_bd1 = xlsread(excel_filename, 'Stand', 'E42:E98');
    stand_IPI_bd2 = xlsread(excel_filename, 'Stand', 'M42:M98');
    
    stand_IPI_bd1_ch0 = stand_IPI_bd1(1);
    stand_IPI_bd1_ch1 = stand_IPI_bd1(9);
    stand_IPI_bd1_ch2 = stand_IPI_bd1(17);
    stand_IPI_bd1_ch3 = stand_IPI_bd1(25);
    stand_IPI_bd1_ch4 = stand_IPI_bd1(33);
    stand_IPI_bd1_ch5 = stand_IPI_bd1(41);
    stand_IPI_bd1_ch6 = stand_IPI_bd1(49);
    stand_IPI_bd1_ch7 = stand_IPI_bd1(57);
    
    stand_IPI_bd2_ch0 = stand_IPI_bd2(1);
    stand_IPI_bd2_ch1 = stand_IPI_bd2(9);
    stand_IPI_bd2_ch2 = stand_IPI_bd2(17);
    stand_IPI_bd2_ch3 = stand_IPI_bd2(25);
    stand_IPI_bd2_ch4 = stand_IPI_bd2(33);
    stand_IPI_bd2_ch5 = stand_IPI_bd2(41);
    stand_IPI_bd2_ch6 = stand_IPI_bd2(49);
    stand_IPI_bd2_ch7 = stand_IPI_bd2(57);
    
    
    stand_IPI_all = [stand_IPI_bd1_ch0 stand_IPI_bd1_ch1 stand_IPI_bd1_ch2 stand_IPI_bd1_ch3 stand_IPI_bd1_ch4 stand_IPI_bd1_ch5 stand_IPI_bd1_ch6 stand_IPI_bd1_ch7 stand_IPI_bd2_ch0 stand_IPI_bd2_ch1 stand_IPI_bd2_ch2 stand_IPI_bd2_ch3 stand_IPI_bd2_ch4 stand_IPI_bd2_ch5 stand_IPI_bd2_ch6 stand_IPI_bd2_ch7];

    for N = 1:16;
        E = stand_IPI_all(N); 
        if E == 60
            stand_IPI_all_color(N) = 'b';
        elseif E == 30
            stand_IPI_all_color(N) = 'r';
        elseif E == 50
            stand_IPI_all_color(N) = 'g';
        else 
            stand_IPI_all_color(N) = 'k'; 
        end
    end
    
    stand_bd1_ch0_color = stand_IPI_all_color(1);
    stand_bd1_ch1_color = stand_IPI_all_color(2);
    stand_bd1_ch2_color = stand_IPI_all_color(3);
    stand_bd1_ch3_color = stand_IPI_all_color(4);
    stand_bd1_ch4_color = stand_IPI_all_color(5);
    stand_bd1_ch5_color = stand_IPI_all_color(6);
    stand_bd1_ch6_color = stand_IPI_all_color(7);
    stand_bd1_ch7_color = stand_IPI_all_color(8);
    stand_bd2_ch0_color = stand_IPI_all_color(9);
    stand_bd2_ch1_color = stand_IPI_all_color(10);
    stand_bd2_ch2_color = stand_IPI_all_color(11);
    stand_bd2_ch3_color = stand_IPI_all_color(12);
    stand_bd2_ch4_color = stand_IPI_all_color(13);
    stand_bd2_ch5_color = stand_IPI_all_color(14);
    stand_bd2_ch6_color = stand_IPI_all_color(15);
    stand_bd2_ch7_color = stand_IPI_all_color(16);
    
    
    
    sit_IPI_bd1 = xlsread(excel_filename, 'Sit', 'E42:E98');
    sit_IPI_bd2 = xlsread(excel_filename, 'Sit', 'M42:M98');
    
    sit_IPI_bd1_ch0 = sit_IPI_bd1(1);
    sit_IPI_bd1_ch1 = sit_IPI_bd1(9);
    sit_IPI_bd1_ch2 = sit_IPI_bd1(17);
    sit_IPI_bd1_ch3 = sit_IPI_bd1(25);
    sit_IPI_bd1_ch4 = sit_IPI_bd1(33);
    sit_IPI_bd1_ch5 = sit_IPI_bd1(41);
    sit_IPI_bd1_ch6 = sit_IPI_bd1(49);
    sit_IPI_bd1_ch7 = sit_IPI_bd1(57);
    
    sit_IPI_bd2_ch0 = sit_IPI_bd2(1);
    sit_IPI_bd2_ch1 = sit_IPI_bd2(9);
    sit_IPI_bd2_ch2 = sit_IPI_bd2(17);
    sit_IPI_bd2_ch3 = sit_IPI_bd2(25);
    sit_IPI_bd2_ch4 = sit_IPI_bd2(33);
    sit_IPI_bd2_ch5 = sit_IPI_bd2(41);
    sit_IPI_bd2_ch6 = sit_IPI_bd2(49);
    sit_IPI_bd2_ch7 = sit_IPI_bd2(57);
    

    
    sit_IPI_all = [sit_IPI_bd1_ch0 sit_IPI_bd1_ch1 sit_IPI_bd1_ch2 sit_IPI_bd1_ch3 sit_IPI_bd1_ch4 sit_IPI_bd1_ch5 sit_IPI_bd1_ch6 sit_IPI_bd1_ch7 sit_IPI_bd2_ch0 sit_IPI_bd2_ch1 sit_IPI_bd2_ch2 sit_IPI_bd2_ch3 sit_IPI_bd2_ch4 sit_IPI_bd2_ch5 sit_IPI_bd2_ch6 sit_IPI_bd2_ch7];

    for N = 1:16;
        E = sit_IPI_all(N); 
        if E == 60
            sit_IPI_all_color(N) = 'b';
        elseif E == 30
            sit_IPI_all_color(N) = 'r';
        elseif E == 50
            sit_IPI_all_color(N) = 'g';
        else 
            sit_IPI_all_color(N) = 'k'; 
        end
    end
    
    sit_bd1_ch0_color = sit_IPI_all_color(1);
    sit_bd1_ch1_color = sit_IPI_all_color(2);
    sit_bd1_ch2_color = sit_IPI_all_color(3);
    sit_bd1_ch3_color = sit_IPI_all_color(4);
    sit_bd1_ch4_color = sit_IPI_all_color(5);
    sit_bd1_ch5_color = sit_IPI_all_color(6);
    sit_bd1_ch6_color = sit_IPI_all_color(7);
    sit_bd1_ch7_color = sit_IPI_all_color(8);
    sit_bd2_ch0_color = sit_IPI_all_color(9);
    sit_bd2_ch1_color = sit_IPI_all_color(10);
    sit_bd2_ch2_color = sit_IPI_all_color(11);
    sit_bd2_ch3_color = sit_IPI_all_color(12);
    sit_bd2_ch4_color = sit_IPI_all_color(13);
    sit_bd2_ch5_color = sit_IPI_all_color(14);
    sit_bd2_ch6_color = sit_IPI_all_color(15);
    sit_bd2_ch7_color = sit_IPI_all_color(16); 
    
    
    
    misc1_IPI_bd1 = xlsread(excel_filename, 'Misc1', 'E42:E98');
    misc1_IPI_bd2 = xlsread(excel_filename, 'Misc1', 'M42:M98');
    
    misc1_IPI_bd1_ch0 = misc1_IPI_bd1(1);
    misc1_IPI_bd1_ch1 = misc1_IPI_bd1(9);
    misc1_IPI_bd1_ch2 = misc1_IPI_bd1(17);
    misc1_IPI_bd1_ch3 = misc1_IPI_bd1(25);
    misc1_IPI_bd1_ch4 = misc1_IPI_bd1(33);
    misc1_IPI_bd1_ch5 = misc1_IPI_bd1(41);
    misc1_IPI_bd1_ch6 = misc1_IPI_bd1(49);
    misc1_IPI_bd1_ch7 = misc1_IPI_bd1(57);
    
    misc1_IPI_bd2_ch0 = misc1_IPI_bd2(1);
    misc1_IPI_bd2_ch1 = misc1_IPI_bd2(9);
    misc1_IPI_bd2_ch2 = misc1_IPI_bd2(17);
    misc1_IPI_bd2_ch3 = misc1_IPI_bd2(25);
    misc1_IPI_bd2_ch4 = misc1_IPI_bd2(33);
    misc1_IPI_bd2_ch5 = misc1_IPI_bd2(41);
    misc1_IPI_bd2_ch6 = misc1_IPI_bd2(49);
    misc1_IPI_bd2_ch7 = misc1_IPI_bd2(57);
    

    
    misc1_IPI_all = [misc1_IPI_bd1_ch0 misc1_IPI_bd1_ch1 misc1_IPI_bd1_ch2 misc1_IPI_bd1_ch3 misc1_IPI_bd1_ch4 misc1_IPI_bd1_ch5 misc1_IPI_bd1_ch6 misc1_IPI_bd1_ch7 misc1_IPI_bd2_ch0 misc1_IPI_bd2_ch1 misc1_IPI_bd2_ch2 misc1_IPI_bd2_ch3 misc1_IPI_bd2_ch4 misc1_IPI_bd2_ch5 misc1_IPI_bd2_ch6 misc1_IPI_bd2_ch7];

    for N = 1:16;
        E = misc1_IPI_all(N); 
        if E == 60
            misc1_IPI_all_color(N) = 'b';
        elseif E == 30
            misc1_IPI_all_color(N) = 'r';
        elseif E == 50
            misc1_IPI_all_color(N) = 'g';
        else 
            misc1_IPI_all_color(N) = 'k'; 
        end
    end
    
    misc1_bd1_ch0_color = misc1_IPI_all_color(1);
    misc1_bd1_ch1_color = misc1_IPI_all_color(2);
    misc1_bd1_ch2_color = misc1_IPI_all_color(3);
    misc1_bd1_ch3_color = misc1_IPI_all_color(4);
    misc1_bd1_ch4_color = misc1_IPI_all_color(5);
    misc1_bd1_ch5_color = misc1_IPI_all_color(6);
    misc1_bd1_ch6_color = misc1_IPI_all_color(7);
    misc1_bd1_ch7_color = misc1_IPI_all_color(8);
    misc1_bd2_ch0_color = misc1_IPI_all_color(9);
    misc1_bd2_ch1_color = misc1_IPI_all_color(10);
    misc1_bd2_ch2_color = misc1_IPI_all_color(11);
    misc1_bd2_ch3_color = misc1_IPI_all_color(12);
    misc1_bd2_ch4_color = misc1_IPI_all_color(13);
    misc1_bd2_ch5_color = misc1_IPI_all_color(14);
    misc1_bd2_ch6_color = misc1_IPI_all_color(15);
    misc1_bd2_ch7_color = misc1_IPI_all_color(16); 
    
    
    misc2_IPI_bd1 = xlsread(excel_filename, 'Misc2', 'E42:E98');
    misc2_IPI_bd2 = xlsread(excel_filename, 'Misc2', 'M42:M98');
    
    misc2_IPI_bd1_ch0 = misc2_IPI_bd1(1);
    misc2_IPI_bd1_ch1 = misc2_IPI_bd1(9);
    misc2_IPI_bd1_ch2 = misc2_IPI_bd1(17);
    misc2_IPI_bd1_ch3 = misc2_IPI_bd1(25);
    misc2_IPI_bd1_ch4 = misc2_IPI_bd1(33);
    misc2_IPI_bd1_ch5 = misc2_IPI_bd1(41);
    misc2_IPI_bd1_ch6 = misc2_IPI_bd1(49);
    misc2_IPI_bd1_ch7 = misc2_IPI_bd1(57);
    
    misc2_IPI_bd2_ch0 = misc2_IPI_bd2(1);
    misc2_IPI_bd2_ch1 = misc2_IPI_bd2(9);
    misc2_IPI_bd2_ch2 = misc2_IPI_bd2(17);
    misc2_IPI_bd2_ch3 = misc2_IPI_bd2(25);
    misc2_IPI_bd2_ch4 = misc2_IPI_bd2(33);
    misc2_IPI_bd2_ch5 = misc2_IPI_bd2(41);
    misc2_IPI_bd2_ch6 = misc2_IPI_bd2(49);
    misc2_IPI_bd2_ch7 = misc2_IPI_bd2(57);
    

    
    misc2_IPI_all = [misc2_IPI_bd1_ch0 misc2_IPI_bd1_ch1 misc2_IPI_bd1_ch2 misc2_IPI_bd1_ch3 misc2_IPI_bd1_ch4 misc2_IPI_bd1_ch5 misc2_IPI_bd1_ch6 misc2_IPI_bd1_ch7 misc2_IPI_bd2_ch0 misc2_IPI_bd2_ch1 misc2_IPI_bd2_ch2 misc2_IPI_bd2_ch3 misc2_IPI_bd2_ch4 misc2_IPI_bd2_ch5 misc2_IPI_bd2_ch6 misc2_IPI_bd2_ch7];

    for N = 1:16;
        E = misc2_IPI_all(N); 
        if E == 60
            misc2_IPI_all_color(N) = 'b';
        elseif E == 30
            misc2_IPI_all_color(N) = 'r';
        elseif E == 50
            misc2_IPI_all_color(N) = 'g';
        else 
            misc2_IPI_all_color(N) = 'k'; 
        end
    end
    
    misc2_bd1_ch0_color = misc2_IPI_all_color(1);
    misc2_bd1_ch1_color = misc2_IPI_all_color(2);
    misc2_bd1_ch2_color = misc2_IPI_all_color(3);
    misc2_bd1_ch3_color = misc2_IPI_all_color(4);
    misc2_bd1_ch4_color = misc2_IPI_all_color(5);
    misc2_bd1_ch5_color = misc2_IPI_all_color(6);
    misc2_bd1_ch6_color = misc2_IPI_all_color(7);
    misc2_bd1_ch7_color = misc2_IPI_all_color(8);
    misc2_bd2_ch0_color = misc2_IPI_all_color(9);
    misc2_bd2_ch1_color = misc2_IPI_all_color(10);
    misc2_bd2_ch2_color = misc2_IPI_all_color(11);
    misc2_bd2_ch3_color = misc2_IPI_all_color(12);
    misc2_bd2_ch4_color = misc2_IPI_all_color(13);
    misc2_bd2_ch5_color = misc2_IPI_all_color(14);
    misc2_bd2_ch6_color = misc2_IPI_all_color(15);
    misc2_bd2_ch7_color = misc2_IPI_all_color(16); 
    
    
    misc3_IPI_bd1 = xlsread(excel_filename, 'Misc3', 'E42:E98');
    misc3_IPI_bd2 = xlsread(excel_filename, 'Misc3', 'M42:M98');
    
    misc3_IPI_bd1_ch0 = misc3_IPI_bd1(1);
    misc3_IPI_bd1_ch1 = misc3_IPI_bd1(9);
    misc3_IPI_bd1_ch2 = misc3_IPI_bd1(17);
    misc3_IPI_bd1_ch3 = misc3_IPI_bd1(25);
    misc3_IPI_bd1_ch4 = misc3_IPI_bd1(33);
    misc3_IPI_bd1_ch5 = misc3_IPI_bd1(41);
    misc3_IPI_bd1_ch6 = misc3_IPI_bd1(49);
    misc3_IPI_bd1_ch7 = misc3_IPI_bd1(57);
    
    misc3_IPI_bd2_ch0 = misc3_IPI_bd2(1);
    misc3_IPI_bd2_ch1 = misc3_IPI_bd2(9);
    misc3_IPI_bd2_ch2 = misc3_IPI_bd2(17);
    misc3_IPI_bd2_ch3 = misc3_IPI_bd2(25);
    misc3_IPI_bd2_ch4 = misc3_IPI_bd2(33);
    misc3_IPI_bd2_ch5 = misc3_IPI_bd2(41);
    misc3_IPI_bd2_ch6 = misc3_IPI_bd2(49);
    misc3_IPI_bd2_ch7 = misc3_IPI_bd2(57);
    

    
    misc3_IPI_all = [misc3_IPI_bd1_ch0 misc3_IPI_bd1_ch1 misc3_IPI_bd1_ch2 misc3_IPI_bd1_ch3 misc3_IPI_bd1_ch4 misc3_IPI_bd1_ch5 misc3_IPI_bd1_ch6 misc3_IPI_bd1_ch7 misc3_IPI_bd2_ch0 misc3_IPI_bd2_ch1 misc3_IPI_bd2_ch2 misc3_IPI_bd2_ch3 misc3_IPI_bd2_ch4 misc3_IPI_bd2_ch5 misc3_IPI_bd2_ch6 misc3_IPI_bd2_ch7];

    for N = 1:16;
        E = misc3_IPI_all(N); 
        if E == 60
            misc3_IPI_all_color(N) = 'b';
        elseif E == 30
            misc3_IPI_all_color(N) = 'r';
        elseif E == 50
            misc3_IPI_all_color(N) = 'g';
        else 
            misc3_IPI_all_color(N) = 'k'; 
        end
    end
    
    misc3_bd1_ch0_color = misc3_IPI_all_color(1);
    misc3_bd1_ch1_color = misc3_IPI_all_color(2);
    misc3_bd1_ch2_color = misc3_IPI_all_color(3);
    misc3_bd1_ch3_color = misc3_IPI_all_color(4);
    misc3_bd1_ch4_color = misc3_IPI_all_color(5);
    misc3_bd1_ch5_color = misc3_IPI_all_color(6);
    misc3_bd1_ch6_color = misc3_IPI_all_color(7);
    misc3_bd1_ch7_color = misc3_IPI_all_color(8);
    misc3_bd2_ch0_color = misc3_IPI_all_color(9);
    misc3_bd2_ch1_color = misc3_IPI_all_color(10);
    misc3_bd2_ch2_color = misc3_IPI_all_color(11);
    misc3_bd2_ch3_color = misc3_IPI_all_color(12);
    misc3_bd2_ch4_color = misc3_IPI_all_color(13);
    misc3_bd2_ch5_color = misc3_IPI_all_color(14);
    misc3_bd2_ch6_color = misc3_IPI_all_color(15);
    misc3_bd2_ch7_color = misc3_IPI_all_color(16); 
    
    
    date_time_label = strcat('Spreadsheet date/time stamp:', date_time);
    filename_label = strcat('Spreadsheet filename:', excel_filename);
    
    ch0_bd1_label = strcat('1-0)',  muscle_ch0_bd1);
    ch1_bd1_label = strcat('1-1)',  muscle_ch1_bd1);
    ch2_bd1_label = strcat('1-2)',  muscle_ch2_bd1);
    ch3_bd1_label = strcat('1-3)',  muscle_ch3_bd1);
    ch4_bd1_label = strcat('1-4)',  muscle_ch4_bd1);
    ch5_bd1_label = strcat('1-5)',  muscle_ch5_bd1);
    ch6_bd1_label = strcat('1-6)',  muscle_ch6_bd1);
    ch7_bd1_label = strcat('1-7)',  muscle_ch7_bd1);
    
    ch0_bd2_label = strcat('2-0)',  muscle_ch0_bd2);
    ch1_bd2_label = strcat('2-1)',  muscle_ch1_bd2);
    ch2_bd2_label = strcat('2-2)',  muscle_ch2_bd2);
    ch3_bd2_label = strcat('2-3)',  muscle_ch3_bd2);
    ch4_bd2_label = strcat('2-4)',  muscle_ch4_bd2);
    ch5_bd2_label = strcat('2-5)',  muscle_ch5_bd2);
    ch6_bd2_label = strcat('2-6)',  muscle_ch6_bd2);
    ch7_bd2_label = strcat('2-7)',  muscle_ch7_bd2);
    
    
    duration_ratio = lstep_duration ./ rstep_duration;
    lstep_plot_width = (0.84 .* duration_ratio) ./ (1 + duration_ratio);
    rstep_plot_width = 0.84 - lstep_plot_width;
    rstep_plot_x_origin = 0.13 + lstep_plot_width;

    scrsz = get(0,'ScreenSize');
    figure('Position',[scrsz(3).*0.044 scrsz(4).*0.034 scrsz(3).*0.95 scrsz(4).*0.77],'Name','VCK5 Walk Pulse Width Plots','NumberTitle','off')
    subplot('Position',[0.11 0.87 lstep_plot_width 0.033])
    area(lstep_values_bd1_x0_t, lstep_values_bd1_y0, 'FaceColor', lstep_bd1_ch0_color)   
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.30 0.80 0.65 0.2], 'string', 'VCK5 Walk Pulse Width Plots (y axes = "us")(blue: IPI=60ms; green: IPI=50ms; red: IPI=30ms)', 'FontSize', 12);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.32 0.775 0.625 0.2], 'string', filename_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.40 0.755 0.3 0.2], 'string', date_time_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.006 0.70 0.2 0.2], 'string', ch0_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    title('Left Step')
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.87 rstep_plot_width 0.033])
    area(rstep_values_bd1_x0_t, rstep_values_bd1_y0, 'FaceColor', rstep_bd1_ch0_color)
    axis([0 rstep_duration 0 250])
    title('Right Step')
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.815 lstep_plot_width 0.033])
    area(lstep_values_bd1_x1_t, lstep_values_bd1_y1, 'FaceColor', lstep_bd1_ch1_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.645 0.2 0.2], 'string', ch1_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.815 rstep_plot_width 0.033])
    area(rstep_values_bd1_x1_t, rstep_values_bd1_y1, 'FaceColor', rstep_bd1_ch1_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.76 lstep_plot_width 0.033])
    area(lstep_values_bd1_x2_t, lstep_values_bd1_y2, 'FaceColor', lstep_bd1_ch2_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.59 0.2 0.2], 'string', ch2_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.76 rstep_plot_width 0.033])
    area(rstep_values_bd1_x2_t, rstep_values_bd1_y2, 'FaceColor', rstep_bd1_ch2_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.705 lstep_plot_width 0.033])
    area(lstep_values_bd1_x3_t, lstep_values_bd1_y3, 'FaceColor', lstep_bd1_ch3_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.535 0.2 0.2], 'string', ch3_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.705 rstep_plot_width 0.033])
    area(rstep_values_bd1_x3_t, rstep_values_bd1_y3, 'FaceColor', rstep_bd1_ch3_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.65 lstep_plot_width 0.033])
    area(lstep_values_bd1_x4_t, lstep_values_bd1_y4, 'FaceColor', lstep_bd1_ch4_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.48 0.2 0.2], 'string', ch4_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.65 rstep_plot_width 0.033])
    area(rstep_values_bd1_x4_t, rstep_values_bd1_y4, 'FaceColor', rstep_bd1_ch4_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.595 lstep_plot_width 0.033])
    area(lstep_values_bd1_x5_t, lstep_values_bd1_y5, 'FaceColor', lstep_bd1_ch5_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.425 0.2 0.2], 'string', ch5_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.595 rstep_plot_width 0.033])
    area(rstep_values_bd1_x5_t, rstep_values_bd1_y5, 'FaceColor', rstep_bd1_ch5_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.54 lstep_plot_width 0.033])
    area(lstep_values_bd1_x6_t, lstep_values_bd1_y6, 'FaceColor', lstep_bd1_ch6_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.37 0.2 0.2], 'string', ch6_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.54 rstep_plot_width 0.033])
    area(rstep_values_bd1_x6_t, rstep_values_bd1_y6, 'FaceColor', rstep_bd1_ch6_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.485 lstep_plot_width 0.033])
    area(lstep_values_bd1_x7_t, lstep_values_bd1_y7, 'FaceColor', lstep_bd1_ch7_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.315 0.2 0.2], 'string', ch7_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.485 rstep_plot_width 0.033])
    area(rstep_values_bd1_x7_t, rstep_values_bd1_y7, 'FaceColor', rstep_bd1_ch7_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    
    
    
    subplot('Position',[0.11 0.43 lstep_plot_width 0.033])
    area(lstep_values_bd2_x0_t, lstep_values_bd2_y0, 'FaceColor', lstep_bd2_ch0_color) 
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.26 0.2 0.2], 'string', ch0_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.43 rstep_plot_width 0.033])
    area(rstep_values_bd2_x0_t, rstep_values_bd2_y0, 'FaceColor', rstep_bd2_ch0_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.375 lstep_plot_width 0.033])
    area(lstep_values_bd2_x1_t, lstep_values_bd2_y1, 'FaceColor', lstep_bd2_ch1_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.205 0.2 0.2], 'string', ch1_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.375 rstep_plot_width 0.033])
    area(rstep_values_bd2_x1_t, rstep_values_bd2_y1, 'FaceColor', rstep_bd2_ch1_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.32 lstep_plot_width 0.033])
    area(lstep_values_bd2_x2_t, lstep_values_bd2_y2, 'FaceColor', lstep_bd2_ch2_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.15 0.2 0.2], 'string', ch2_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.32 rstep_plot_width 0.033])
    area(rstep_values_bd2_x2_t, rstep_values_bd2_y2, 'FaceColor', rstep_bd2_ch2_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.265 lstep_plot_width 0.033])
    area(lstep_values_bd2_x3_t, lstep_values_bd2_y3, 'FaceColor', lstep_bd2_ch3_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.095 0.2 0.2], 'string', ch3_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.265 rstep_plot_width 0.033])
    area(rstep_values_bd2_x3_t, rstep_values_bd2_y3, 'FaceColor', rstep_bd2_ch3_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.21 lstep_plot_width 0.033])
    area(lstep_values_bd2_x4_t, lstep_values_bd2_y4, 'FaceColor', lstep_bd2_ch4_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.04 0.2 0.2], 'string', ch4_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.21 rstep_plot_width 0.033])
    area(rstep_values_bd2_x4_t, rstep_values_bd2_y4, 'FaceColor', rstep_bd2_ch4_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.155 lstep_plot_width 0.033])
    area(lstep_values_bd2_x5_t, lstep_values_bd2_y5, 'FaceColor', lstep_bd2_ch5_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.132 0.2 0.05], 'string', ch5_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.155 rstep_plot_width 0.033])
    area(rstep_values_bd2_x5_t, rstep_values_bd2_y5, 'FaceColor', rstep_bd2_ch5_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.10 lstep_plot_width 0.033])
    area(lstep_values_bd2_x6_t, lstep_values_bd2_y6, 'FaceColor', lstep_bd2_ch6_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.077 0.2 0.05], 'string', ch6_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[rstep_plot_x_origin 0.10 rstep_plot_width 0.033])
    area(rstep_values_bd2_x6_t, rstep_values_bd2_y6, 'FaceColor', rstep_bd2_ch6_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.045 lstep_plot_width 0.033])
    area(lstep_values_bd2_x7_t, lstep_values_bd2_y7, 'FaceColor', lstep_bd2_ch7_color)
    axis([0 lstep_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.022 0.2 0.05], 'string', ch7_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    xlabel('Time (s)')

    subplot('Position',[rstep_plot_x_origin 0.045 rstep_plot_width 0.033])
    area(rstep_values_bd2_x7_t, rstep_values_bd2_y7, 'FaceColor', rstep_bd2_ch7_color)
    axis([0 rstep_duration 0 250])
    set(gca,'YTick',[0 125 250])
    set(gca,'YTickLabel',[])
    xlabel('Time (s)')
    

    figure('Position',[scrsz(3).*0.031 scrsz(4).*0.062 scrsz(3).*0.95 scrsz(4).*0.77],'Name','VCK5 Stand Pulse Width Plots','NumberTitle','off')
    subplot('Position',[0.11 0.87 0.8 0.033])
    area(stand_values_bd1_x0_t, stand_values_bd1_y0, 'FaceColor', stand_bd1_ch0_color)  
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.30 0.80 0.65 0.2], 'string', 'VCK5 Stand Pulse Width Plots (y axes = "us")(blue: IPI=60ms; green: IPI=50ms; red: IPI=30ms)', 'FontSize', 12);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.32 0.775 0.625 0.2], 'string', filename_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.40 0.755 0.3 0.2], 'string', date_time_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.006 0.70 0.2 0.2], 'string', ch0_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    title('Stand')
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
 
    subplot('Position',[0.11 0.815 0.8 0.033])
    area(stand_values_bd1_x1_t, stand_values_bd1_y1, 'FaceColor', stand_bd1_ch1_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.645 0.2 0.2], 'string', ch1_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.76 0.8 0.033])
    area(stand_values_bd1_x2_t, stand_values_bd1_y2, 'FaceColor', stand_bd1_ch2_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.59 0.2 0.2], 'string', ch2_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.705 0.8 0.033])
    area(stand_values_bd1_x3_t, stand_values_bd1_y3, 'FaceColor', stand_bd1_ch3_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.535 0.2 0.2], 'string', ch3_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.65 0.8 0.033])
    area(stand_values_bd1_x4_t, stand_values_bd1_y4, 'FaceColor', stand_bd1_ch4_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.48 0.2 0.2], 'string', ch4_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.595 0.8 0.033])
    area(stand_values_bd1_x5_t, stand_values_bd1_y5, 'FaceColor', stand_bd1_ch5_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.425 0.2 0.2], 'string', ch5_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.54 0.8 0.033])
    area(stand_values_bd1_x6_t, stand_values_bd1_y6, 'FaceColor', stand_bd1_ch6_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.37 0.2 0.2], 'string', ch6_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.485 0.8 0.033])
    area(stand_values_bd1_x7_t, stand_values_bd1_y7, 'FaceColor', stand_bd1_ch7_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.315 0.2 0.2], 'string', ch7_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
       
    subplot('Position',[0.11 0.43 0.8 0.033])
    area(stand_values_bd2_x0_t, stand_values_bd2_y0, 'FaceColor', stand_bd2_ch0_color) 
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.26 0.2 0.2], 'string', ch0_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.375 0.8 0.033])
    area(stand_values_bd2_x1_t, stand_values_bd2_y1, 'FaceColor', stand_bd2_ch1_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.205 0.2 0.2], 'string', ch1_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.32 0.8 0.033])
    area(stand_values_bd2_x2_t, stand_values_bd2_y2, 'FaceColor', stand_bd2_ch2_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.15 0.2 0.2], 'string', ch2_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.265 0.8 0.033])
    area(stand_values_bd2_x3_t, stand_values_bd2_y3, 'FaceColor', stand_bd2_ch3_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.095 0.2 0.2], 'string', ch3_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.21 0.8 0.033])
    area(stand_values_bd2_x4_t, stand_values_bd2_y4, 'FaceColor', stand_bd2_ch4_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.04 0.2 0.2], 'string', ch4_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.155 0.8 0.033])
    area(stand_values_bd2_x5_t, stand_values_bd2_y5, 'FaceColor', stand_bd2_ch5_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.132 0.2 0.05], 'string', ch5_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.10 0.8 0.033])
    area(stand_values_bd2_x6_t, stand_values_bd2_y6, 'FaceColor', stand_bd2_ch6_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.077 0.2 0.05], 'string', ch6_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.045 0.8 0.033])
    area(stand_values_bd2_x7_t, stand_values_bd2_y7, 'FaceColor', stand_bd2_ch7_color)
    axis([0 stand_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.022 0.2 0.05], 'string', ch7_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    xlabel('Time (s)')

    
    figure('Position',[scrsz(3).*0.018 scrsz(4).*0.09 scrsz(3).*0.95 scrsz(4).*0.77],'Name','VCK5 Sit Pulse Width Plots','NumberTitle','off')
    subplot('Position',[0.11 0.87 0.8 0.033])
    area(sit_values_bd1_x0_t, sit_values_bd1_y0, 'FaceColor', sit_bd1_ch0_color)  
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.30 0.80 0.65 0.2], 'string', 'VCK5 Sit Pulse Width Plots (y axes = "us")(blue: IPI=60ms; green: IPI=50ms; red: IPI=30ms)', 'FontSize', 12);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.32 0.775 0.625 0.2], 'string', filename_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.40 0.755 0.3 0.2], 'string', date_time_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.006 0.70 0.2 0.2], 'string', ch0_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    title('Sit')
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
 
    subplot('Position',[0.11 0.815 0.8 0.033])
    area(sit_values_bd1_x1_t, sit_values_bd1_y1, 'FaceColor', sit_bd1_ch1_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.645 0.2 0.2], 'string', ch1_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.76 0.8 0.033])
    area(sit_values_bd1_x2_t, sit_values_bd1_y2, 'FaceColor', sit_bd1_ch2_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.59 0.2 0.2], 'string', ch2_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.705 0.8 0.033])
    area(sit_values_bd1_x3_t, sit_values_bd1_y3, 'FaceColor', sit_bd1_ch3_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.535 0.2 0.2], 'string', ch3_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.65 0.8 0.033])
    area(sit_values_bd1_x4_t, sit_values_bd1_y4, 'FaceColor', sit_bd1_ch4_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.48 0.2 0.2], 'string', ch4_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.595 0.8 0.033])
    area(sit_values_bd1_x5_t, sit_values_bd1_y5, 'FaceColor', sit_bd1_ch5_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.425 0.2 0.2], 'string', ch5_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.54 0.8 0.033])
    area(sit_values_bd1_x6_t, sit_values_bd1_y6, 'FaceColor', sit_bd1_ch6_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.37 0.2 0.2], 'string', ch6_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.485 0.8 0.033])
    area(sit_values_bd1_x7_t, sit_values_bd1_y7, 'FaceColor', sit_bd1_ch7_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.315 0.2 0.2], 'string', ch7_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
       
    subplot('Position',[0.11 0.43 0.8 0.033])
    area(sit_values_bd2_x0_t, sit_values_bd2_y0, 'FaceColor', sit_bd2_ch0_color) 
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.26 0.2 0.2], 'string', ch0_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.375 0.8 0.033])
    area(sit_values_bd2_x1_t, sit_values_bd2_y1, 'FaceColor', sit_bd2_ch1_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.205 0.2 0.2], 'string', ch1_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.32 0.8 0.033])
    area(sit_values_bd2_x2_t, sit_values_bd2_y2, 'FaceColor', sit_bd2_ch2_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.15 0.2 0.2], 'string', ch2_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.265 0.8 0.033])
    area(sit_values_bd2_x3_t, sit_values_bd2_y3, 'FaceColor', sit_bd2_ch3_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.095 0.2 0.2], 'string', ch3_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.21 0.8 0.033])
    area(sit_values_bd2_x4_t, sit_values_bd2_y4, 'FaceColor', sit_bd2_ch4_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.04 0.2 0.2], 'string', ch4_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.155 0.8 0.033])
    area(sit_values_bd2_x5_t, sit_values_bd2_y5, 'FaceColor', sit_bd2_ch5_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.132 0.2 0.05], 'string', ch5_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.10 0.8 0.033])
    area(sit_values_bd2_x6_t, sit_values_bd2_y6, 'FaceColor', sit_bd2_ch6_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.077 0.2 0.05], 'string', ch6_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.045 0.8 0.033])
    area(sit_values_bd2_x7_t, sit_values_bd2_y7, 'FaceColor', sit_bd2_ch7_color)
    axis([0 sit_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.022 0.2 0.05], 'string', ch7_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    xlabel('Time (s)')

    
    
    figure('Position',[scrsz(3).*0.013 scrsz(4).*0.104 scrsz(3).*0.95 scrsz(4).*0.77],'Name','VCK5 Misc1 Pulse Width Plots','NumberTitle','off')
    subplot('Position',[0.11 0.87 0.8 0.033])
    area(misc1_values_bd1_x0_t, misc1_values_bd1_y0, 'FaceColor', misc1_bd1_ch0_color)  
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.30 0.80 0.65 0.2], 'string', 'VCK5 Misc1 Pulse Width Plots (y axes = "us")(blue: IPI=60ms; green: IPI=50ms; red: IPI=30ms)', 'FontSize', 12);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.32 0.775 0.625 0.2], 'string', filename_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.40 0.755 0.3 0.2], 'string', date_time_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.006 0.70 0.2 0.2], 'string', ch0_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    title('Misc1')
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
 
    subplot('Position',[0.11 0.815 0.8 0.033])
    area(misc1_values_bd1_x1_t, misc1_values_bd1_y1, 'FaceColor', misc1_bd1_ch1_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.645 0.2 0.2], 'string', ch1_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.76 0.8 0.033])
    area(misc1_values_bd1_x2_t, misc1_values_bd1_y2, 'FaceColor', misc1_bd1_ch2_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.59 0.2 0.2], 'string', ch2_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.705 0.8 0.033])
    area(misc1_values_bd1_x3_t, misc1_values_bd1_y3, 'FaceColor', misc1_bd1_ch3_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.535 0.2 0.2], 'string', ch3_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.65 0.8 0.033])
    area(misc1_values_bd1_x4_t, misc1_values_bd1_y4, 'FaceColor', misc1_bd1_ch4_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.48 0.2 0.2], 'string', ch4_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.595 0.8 0.033])
    area(misc1_values_bd1_x5_t, misc1_values_bd1_y5, 'FaceColor', misc1_bd1_ch5_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.425 0.2 0.2], 'string', ch5_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.54 0.8 0.033])
    area(misc1_values_bd1_x6_t, misc1_values_bd1_y6, 'FaceColor', misc1_bd1_ch6_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.37 0.2 0.2], 'string', ch6_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.485 0.8 0.033])
    area(misc1_values_bd1_x7_t, misc1_values_bd1_y7, 'FaceColor', misc1_bd1_ch7_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.315 0.2 0.2], 'string', ch7_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
       
    subplot('Position',[0.11 0.43 0.8 0.033])
    area(misc1_values_bd2_x0_t, misc1_values_bd2_y0, 'FaceColor', misc1_bd2_ch0_color) 
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.26 0.2 0.2], 'string', ch0_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.375 0.8 0.033])
    area(misc1_values_bd2_x1_t, misc1_values_bd2_y1, 'FaceColor', misc1_bd2_ch1_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.205 0.2 0.2], 'string', ch1_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.32 0.8 0.033])
    area(misc1_values_bd2_x2_t, misc1_values_bd2_y2, 'FaceColor', misc1_bd2_ch2_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.15 0.2 0.2], 'string', ch2_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.265 0.8 0.033])
    area(misc1_values_bd2_x3_t, misc1_values_bd2_y3, 'FaceColor', misc1_bd2_ch3_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.095 0.2 0.2], 'string', ch3_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.21 0.8 0.033])
    area(misc1_values_bd2_x4_t, misc1_values_bd2_y4, 'FaceColor', misc1_bd2_ch4_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.04 0.2 0.2], 'string', ch4_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.155 0.8 0.033])
    area(misc1_values_bd2_x5_t, misc1_values_bd2_y5, 'FaceColor', misc1_bd2_ch5_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.132 0.2 0.05], 'string', ch5_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.10 0.8 0.033])
    area(misc1_values_bd2_x6_t, misc1_values_bd2_y6, 'FaceColor', misc1_bd2_ch6_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.077 0.2 0.05], 'string', ch6_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.045 0.8 0.033])
    area(misc1_values_bd2_x7_t, misc1_values_bd2_y7, 'FaceColor', misc1_bd2_ch7_color)
    axis([0 misc1_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.022 0.2 0.05], 'string', ch7_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    xlabel('Time (s)')

    
    
    figure('Position',[scrsz(3).*0.009 scrsz(4).*0.118 scrsz(3).*0.95 scrsz(4).*0.77],'Name','VCK5 Misc2 Pulse Width Plots','NumberTitle','off')
    subplot('Position',[0.11 0.87 0.8 0.033])
    area(misc2_values_bd1_x0_t, misc2_values_bd1_y0, 'FaceColor', misc2_bd1_ch0_color)  
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.30 0.80 0.65 0.2], 'string', 'VCK5 Misc2 Pulse Width Plots (y axes = "us")(blue: IPI=60ms; green: IPI=50ms; red: IPI=30ms)', 'FontSize', 12);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.32 0.775 0.625 0.2], 'string', filename_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.40 0.755 0.3 0.2], 'string', date_time_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.006 0.70 0.2 0.2], 'string', ch0_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    title('Misc2')
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
 
    subplot('Position',[0.11 0.815 0.8 0.033])
    area(misc2_values_bd1_x1_t, misc2_values_bd1_y1, 'FaceColor', misc2_bd1_ch1_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.645 0.2 0.2], 'string', ch1_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.76 0.8 0.033])
    area(misc2_values_bd1_x2_t, misc2_values_bd1_y2, 'FaceColor', misc2_bd1_ch2_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.59 0.2 0.2], 'string', ch2_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.705 0.8 0.033])
    area(misc2_values_bd1_x3_t, misc2_values_bd1_y3, 'FaceColor', misc2_bd1_ch3_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.535 0.2 0.2], 'string', ch3_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.65 0.8 0.033])
    area(misc2_values_bd1_x4_t, misc2_values_bd1_y4, 'FaceColor', misc2_bd1_ch4_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.48 0.2 0.2], 'string', ch4_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.595 0.8 0.033])
    area(misc2_values_bd1_x5_t, misc2_values_bd1_y5, 'FaceColor', misc2_bd1_ch5_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.425 0.2 0.2], 'string', ch5_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.54 0.8 0.033])
    area(misc2_values_bd1_x6_t, misc2_values_bd1_y6, 'FaceColor', misc2_bd1_ch6_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.37 0.2 0.2], 'string', ch6_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.485 0.8 0.033])
    area(misc2_values_bd1_x7_t, misc2_values_bd1_y7, 'FaceColor', misc2_bd1_ch7_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.315 0.2 0.2], 'string', ch7_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
       
    subplot('Position',[0.11 0.43 0.8 0.033])
    area(misc2_values_bd2_x0_t, misc2_values_bd2_y0, 'FaceColor', misc2_bd2_ch0_color) 
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.26 0.2 0.2], 'string', ch0_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.375 0.8 0.033])
    area(misc2_values_bd2_x1_t, misc2_values_bd2_y1, 'FaceColor', misc2_bd2_ch1_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.205 0.2 0.2], 'string', ch1_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.32 0.8 0.033])
    area(misc2_values_bd2_x2_t, misc2_values_bd2_y2, 'FaceColor', misc2_bd2_ch2_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.15 0.2 0.2], 'string', ch2_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.265 0.8 0.033])
    area(misc2_values_bd2_x3_t, misc2_values_bd2_y3, 'FaceColor', misc2_bd2_ch3_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.095 0.2 0.2], 'string', ch3_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.21 0.8 0.033])
    area(misc2_values_bd2_x4_t, misc2_values_bd2_y4, 'FaceColor', misc2_bd2_ch4_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.04 0.2 0.2], 'string', ch4_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.155 0.8 0.033])
    area(misc2_values_bd2_x5_t, misc2_values_bd2_y5, 'FaceColor', misc2_bd2_ch5_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.132 0.2 0.05], 'string', ch5_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.10 0.8 0.033])
    area(misc2_values_bd2_x6_t, misc2_values_bd2_y6, 'FaceColor', misc2_bd2_ch6_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.077 0.2 0.05], 'string', ch6_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.045 0.8 0.033])
    area(misc2_values_bd2_x7_t, misc2_values_bd2_y7, 'FaceColor', misc2_bd2_ch7_color)
    axis([0 misc2_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.022 0.2 0.05], 'string', ch7_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    xlabel('Time (s)')

    
    
    figure('Position',[scrsz(3).*0.005 scrsz(4).*0.132 scrsz(3).*0.95 scrsz(4).*0.77],'Name','VCK5 Misc3 Pulse Width Plots','NumberTitle','off')
    subplot('Position',[0.11 0.87 0.8 0.033])
    area(misc3_values_bd1_x0_t, misc3_values_bd1_y0, 'FaceColor', misc3_bd1_ch0_color)  
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.30 0.80 0.65 0.2], 'string', 'VCK5 Misc3 Pulse Width Plots (y axes = "us")(blue: IPI=60ms; green: IPI=50ms; red: IPI=30ms)', 'FontSize', 12);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.32 0.775 0.625 0.2], 'string', filename_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.40 0.755 0.3 0.2], 'string', date_time_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    anno_obj_handle = annotation('textbox', [0.006 0.70 0.2 0.2], 'string', ch0_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    title('Misc3')
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
 
    subplot('Position',[0.11 0.815 0.8 0.033])
    area(misc3_values_bd1_x1_t, misc3_values_bd1_y1, 'FaceColor', misc3_bd1_ch1_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.645 0.2 0.2], 'string', ch1_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.76 0.8 0.033])
    area(misc3_values_bd1_x2_t, misc3_values_bd1_y2, 'FaceColor', misc3_bd1_ch2_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.59 0.2 0.2], 'string', ch2_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.705 0.8 0.033])
    area(misc3_values_bd1_x3_t, misc3_values_bd1_y3, 'FaceColor', misc3_bd1_ch3_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.535 0.2 0.2], 'string', ch3_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])

    subplot('Position',[0.11 0.65 0.8 0.033])
    area(misc3_values_bd1_x4_t, misc3_values_bd1_y4, 'FaceColor', misc3_bd1_ch4_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.48 0.2 0.2], 'string', ch4_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.595 0.8 0.033])
    area(misc3_values_bd1_x5_t, misc3_values_bd1_y5, 'FaceColor', misc3_bd1_ch5_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.425 0.2 0.2], 'string', ch5_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.54 0.8 0.033])
    area(misc3_values_bd1_x6_t, misc3_values_bd1_y6, 'FaceColor', misc3_bd1_ch6_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.37 0.2 0.2], 'string', ch6_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.485 0.8 0.033])
    area(misc3_values_bd1_x7_t, misc3_values_bd1_y7, 'FaceColor', misc3_bd1_ch7_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.315 0.2 0.2], 'string', ch7_bd1_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
       
    subplot('Position',[0.11 0.43 0.8 0.033])
    area(misc3_values_bd2_x0_t, misc3_values_bd2_y0, 'FaceColor', misc3_bd2_ch0_color) 
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.26 0.2 0.2], 'string', ch0_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.375 0.8 0.033])
    area(misc3_values_bd2_x1_t, misc3_values_bd2_y1, 'FaceColor', misc3_bd2_ch1_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.205 0.2 0.2], 'string', ch1_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.32 0.8 0.033])
    area(misc3_values_bd2_x2_t, misc3_values_bd2_y2, 'FaceColor', misc3_bd2_ch2_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.15 0.2 0.2], 'string', ch2_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.265 0.8 0.033])
    area(misc3_values_bd2_x3_t, misc3_values_bd2_y3, 'FaceColor', misc3_bd2_ch3_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.095 0.2 0.2], 'string', ch3_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.21 0.8 0.033])
    area(misc3_values_bd2_x4_t, misc3_values_bd2_y4, 'FaceColor', misc3_bd2_ch4_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.04 0.2 0.2], 'string', ch4_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
   
    subplot('Position',[0.11 0.155 0.8 0.033])
    area(misc3_values_bd2_x5_t, misc3_values_bd2_y5, 'FaceColor', misc3_bd2_ch5_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.132 0.2 0.05], 'string', ch5_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.10 0.8 0.033])
    area(misc3_values_bd2_x6_t, misc3_values_bd2_y6, 'FaceColor', misc3_bd2_ch6_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.077 0.2 0.05], 'string', ch6_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    set(gca,'XTickLabel',[])
    
    subplot('Position',[0.11 0.045 0.8 0.033])
    area(misc3_values_bd2_x7_t, misc3_values_bd2_y7, 'FaceColor', misc3_bd2_ch7_color)
    axis([0 misc3_duration 0 250])
    anno_obj_handle = annotation('textbox', [0.006 0.022 0.2 0.05], 'string', ch7_bd2_label, 'FontSize', 10);
    set(anno_obj_handle,'LineStyle', 'none');
    set(gca,'YTick',[0 125 250])
    xlabel('Time (s)')

    
    figure(6)
    figure(5)
    figure(4)
    figure(3)
    figure(2)
    figure(1)
     
else
    h = errordlg('The data in the Excel Workbook called by this model/mfile has not been validated.  Please validate all sheets in this Excel Workbook and then rebuild the model.');
    set_param(gcs, 'SimulationCommand', 'stop')
end 

