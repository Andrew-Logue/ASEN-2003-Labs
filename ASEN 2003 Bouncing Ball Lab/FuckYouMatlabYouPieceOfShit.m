% ASEN 2003 Roller Coaster Project Code
% Lab Section 019
% Andrew Logue, Devon Paris, Jack Foster, Siyang Liu
% This code will take in data describing the path of a bouncing ball and
%   use equations of motion to find the coefficient of resitution for the
%   bouncing motion. This will be done in 3 methods, the first using the
%   height of each consecutive bounce, again using the time between
%   bounces, and finally using the total time needed to stop bouncing
%% Clearing Commands
clc
clear all
close all
%% Data Inputs
% Initial Height of Drop
h0 = 1;     % (m)
% Error in Measured Height
hr = 0.01   % (m)
% Error in Time Between Bounces
tbr = 0.02 % (s)
% Error in Final Time
tfr = 0.1 % (s)
% Trial 1
T1Raw = readmatrix("BBTrial1.xlsx");    % (m)
T1_total = T1Raw(1,1);
T1_times = T1Raw(:,2);
T1_height = T1Raw(1:8,3);
% Trial 2
T2Raw = readmatrix("BBTrial2.xlsx");    % (m)
T2_total = T2Raw(1,1);
T2_times = T2Raw(:,2);
T2_height = T2Raw(:,3);
% Trial 3
T3Raw = readmatrix("BBTrial3.xlsx");    % (m)
T3_total = T3Raw(1,1);
T3_times = T3Raw(:,2);
T3_height = T3Raw(:,3);
% Trial 4
T4Raw = readmatrix("BBTrial4.xlsx");    % (m)
T4_total = T4Raw(1,1);
T4_times = T4Raw(:,2);
T4_height = T4Raw(:,3);
% Trial 5
T5Raw = readmatrix("BBTrial5.xlsx");    % (m)
T5_total = T5Raw(1,1);
T5_times = T5Raw(:,2);
T5_height = T5Raw(:,3);
%% e From Bounce Height
for j=1:size(T1_height,1)-1
    eT1_height(j) = (T1_height(j+1)/T1_height(j));
    eT1_height_errors(j) = ((T1_height(j+1)+hr)/(T1_height(j)+hr))-eT1_height(j);
end
for j=1:size(T2_height,1)-1
    eT2_height(j) = (T2_height(j+1)/T2_height(j));
end
for j=1:size(T3_height,1)-1
    eT3_height(j) = (T3_height(j+1)/T3_height(j));
end
for j=1:size(T4_height,1)-1
    eT4_height(j) = (T4_height(j+1)/T4_height(j));
end
for j=1:size(T5_height,1)-1
    eT5_height(j) = (T5_height(j+1)/T5_height(j));
end
%% e From Time Between Bounces
for j=1:size(T1_times,1)-1
    eT1_times(j) = (T1_times(j+1)/T1_times(j));
end
for j=1:size(T2_times,1)-1
    eT2_times(j) = (T2_times(j+1)/T2_times(j));
end
for j=1:size(T3_times,1)-1
    eT3_times(j) = (T3_times(j+1)/T3_times(j));
end
for j=1:size(T4_times,1)-1
    eT4_times(j) = (T4_times(j+1)/T4_times(j));
end
for j=1:size(T5_times,1)-1
    eT5_times(j) = (T5_times(j+1)/T5_times(j));
end
%% e From Total Time
q = sqrt(2*h0/9.81);
eTT1 = (T1_total-q)/(T1_total+q);
eTT2 = (T2_total-q)/(T2_total+q);
eTT3 = (T3_total-q)/(T3_total+q);
eTT4 = (T4_total-q)/(T4_total+q);
eTT5 = (T5_total-q)/(T5_total+q);