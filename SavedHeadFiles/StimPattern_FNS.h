// StimPattern.h - Head file for storage Stim Patterns.
// Created by Lu Li (lxl361@case), SEP, 2015.
// Version 1.0
// Repo: https://github.com/lilulab/CwruStim_beta

#include <stdint.h>;

uint8_t max_pw = [150, 60, 60, 150, 150, 150, 60, 150, 0, 0, 0, 0, 150, 150, 150, 150, 25, 150, 150, 150, 0, 0, 0, 0];

uint8_t step_lft_pct = [0, 17, 20, 64, 75, 92, 0, 17, 20, 70, 92, 100, 0, 17, 20, 67, 81, 100, 0, 17, 20, 89, 92, 100, 0, 17, 20, 86, 92, 100, 0, 17, 20, 70, 92, 100, 0, 17, 20, 70, 92, 100, 0, 17, 20, 75, 86, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

uint8_t step_lft_pw = [100, 100, 0, 0, 150, 131, 0, 0, 60, 60, 0, 0, 25, 25, 0, 0, 25, 25, 150, 100, 0, 0, 150, 150, 150, 100, 0, 0, 150, 150, 0, 0, 150, 150, 0, 0, 0, 0, 60, 60, 0, 0, 0, 0, 150, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 150, 150, 150, 150, 150, 150, 0, 0, 0, 0, 0, 0, 110, 110, 110, 110, 110, 110, 150, 150, 150, 150, 150, 150, 25, 25, 25, 25, 25, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

uint8_t step_rst_pct = [0, 5, 15, 57, 79, 100, 0, 50, 75, 88, 94, 100, 0, 93, 97, 99, 100, 100, 0, 90, 95, 98, 99, 100, 0, 93, 97, 98, 99, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 12, 62, 93, 100, 0, 9, 12, 77, 93, 100, 0, 9, 12, 87, 93, 100, 0, 9, 12, 87, 90, 93, 0, 9, 12, 62, 74, 90, 0, 9, 12, 68, 81, 100, 0, 9, 12, 68, 81, 100, 0, 9, 12, 68, 77, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

uint8_t step_rst_pw = [131, 120, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, 25, 25, 25, 25, 25, 25, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 150, 150, 0, 0, 150, 150, 0, 0, 150, 150, 0, 0, 110, 110, 0, 0, 108, 110, 150, 150, 0, 0, 150, 150, 25, 25, 0, 0, 25, 25, 0, 0, 70, 70, 0, 0, 0, 0, 70, 70, 0, 0, 0, 0, 150, 150, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

uint8_t stand_pct = [0, 10, 13, 56, 78, 100, 0, 50, 75, 88, 94, 100, 10, 13, 90, 95, 98, 100, 10, 13, 56, 78, 89, 100, 10, 13, 56, 78, 89, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 13, 56, 78, 100, 0, 50, 75, 88, 94, 100, 10, 13, 56, 78, 89, 100, 10, 13, 56, 78, 89, 100, 0, 10, 13, 56, 78, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

uint8_t stand_pw = [0, 0, 119, 119, 119, 119, 0, 0, 0, 0, 0, 0, 0, 60, 60, 43, 36, 25, 0, 150, 150, 150, 150, 150, 0, 150, 150, 150, 150, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 150, 150, 150, 150, 0, 0, 0, 0, 0, 0, 0, 150, 150, 150, 150, 150, 0, 150, 150, 150, 150, 150, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

uint8_t sit_pct = [0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 80, 90, 95, 98, 100, 0, 40, 70, 85, 93, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 80, 90, 95, 98, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 50, 75, 88, 94, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

uint8_t sit_pw = [100, 50, 50, 26, 13, 0, 0, 0, 0, 0, 0, 0, 20, 10, 10, 5, 3, 0, 150, 150, 75, 38, 23, 0, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 150, 75, 75, 39, 20, 0, 0, 0, 0, 0, 0, 0, 110, 55, 55, 29, 14, 0, 150, 150, 75, 38, 23, 0, 25, 13, 13, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

// File End

