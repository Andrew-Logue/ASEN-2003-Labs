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
hr = 0.05;   % (m)
% Error in Time Between Bounces
tbr = 0.02; % (s)
% Error in Final Time
tfr = 0.1; % (s)
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
    eT1_hr(j) = ((T1_height(j+1)+hr)/(T1_height(j)+hr))-eT1_height(j);
    eT1_hpr(j) = 100*eT1_hr(j)/eT1_height(j);
end
for j=1:size(T2_height,1)-1
    eT2_height(j) = (T2_height(j+1)/T2_height(j));
    eT2_hr(j) = ((T2_height(j+1)+hr)/(T2_height(j)+hr))-eT2_height(j);
    eT2_hpr(j) = 100*eT2_hr(j)/eT2_height(j);
end
for j=1:size(T3_height,1)-1
    eT3_height(j) = (T3_height(j+1)/T3_height(j));
    eT3_hr(j) = ((T3_height(j+1)+hr)/(T3_height(j)+hr))-eT3_height(j);
    eT3_hpr(j) = 100*eT3_hr(j)/eT3_height(j);
end
for j=1:size(T4_height,1)-1
    eT4_height(j) = (T4_height(j+1)/T4_height(j));
    eT4_hr(j) = ((T4_height(j+1)+hr)/(T4_height(j)+hr))-eT4_height(j);
    eT4_hpr(j) = 100*eT4_hr(j)/eT4_height(j);
end
for j=1:size(T5_height,1)-1
    eT5_height(j) = (T5_height(j+1)/T5_height(j));
    eT5_hr(j) = ((T5_height(j+1)+hr)/(T5_height(j)+hr))-eT5_height(j);
    eT5_hpr(j) = 100*eT5_hr(j)/eT5_height(j);
end
%% e From Time Between Bounces
for j=1:size(T1_times,1)-1
    eT1_times(j) = (T1_times(j+1)/T1_times(j));
    eT1_tbr(j) = ((T1_times(j+1)+tbr)/(T1_times(j)+tbr))-eT1_times(j);
    eT1_tbpr(j) = 100*eT1_tbr(j)/eT1_times(j);
end
for j=1:size(T2_times,1)-1
    eT2_times(j) = (T2_times(j+1)/T2_times(j));
    eT2_tbr(j) = ((T2_times(j+1)+tbr)/(T2_times(j)+tbr))-eT2_times(j);
    eT2_tbpr(j) = 100*eT2_tbr(j)/eT2_times(j);
end
for j=1:size(T3_times,1)-1
    eT3_times(j) = (T3_times(j+1)/T3_times(j));
    eT3_tbr(j) = ((T3_times(j+1)+tbr)/(T3_times(j)+tbr))-eT3_times(j);
    eT3_tbpr(j) = 100*eT3_tbr(j)/eT3_times(j);
end
for j=1:size(T4_times,1)-1
    eT4_times(j) = (T4_times(j+1)/T4_times(j));
    eT4_tbr(j) = ((T4_times(j+1)+tbr)/(T4_times(j)+tbr))-eT4_times(j);
    eT4_tbpr(j) = 100*eT4_tbr(j)/eT4_times(j);
end
for j=1:size(T5_times,1)-1
    eT5_times(j) = (T5_times(j+1)/T5_times(j));
    eT5_tbr(j) = ((T5_times(j+1)+tbr)/(T5_times(j)+tbr))-eT5_times(j);
    eT5_tbpr(j) = 100*eT5_tbr(j)/eT5_times(j);
end
%% e From Total Time
q = sqrt(2*h0/9.81);
eTT1 = (T1_total-q)/(T1_total+q);
eTT1_r = (T1_total+tfr-q)/(T1_total+tfr+q)-eTT1;
eTT1_pr = eTT1_r*100/eTT1;
eTT2 = (T2_total-q)/(T2_total+q);
eTT2_r = (T2_total+tfr-q)/(T2_total+tfr+q)-eTT2;
eTT2_pr = eTT2_r*100/eTT2;
eTT3 = (T3_total-q)/(T3_total+q);
eTT3_r = (T3_total+tfr-q)/(T3_total+tfr+q)-eTT3;
eTT3_pr = eTT3_r*100/eTT3;
eTT4 = (T4_total-q)/(T4_total+q);
eTT4_r = (T4_total+tfr-q)/(T4_total+tfr+q)-eTT4;
eTT4_pr = eTT4_r*100/eTT4;
eTT5 = (T5_total-q)/(T5_total+q);
eTT5_r = (T5_total+tfr-q)/(T5_total+tfr+q)-eTT5;
eTT5_pr = eTT5_r*100/eTT5;

%%Plots
%T1
figure
errorbar(1:size(eT1_height,2),eT1_height, eT1_hr, 'b--o','LineWidth',1)
title('Trial 1: e derived for Height')
xlabel('Number of Bounces')
ylabel('e')

figure
errorbar(1:size(eT1_times,2),eT1_times, eT1_tbr, 'r--o','LineWidth',1)
title('Trial 1: e derived for Time')
xlabel('Number of Bounces')
ylabel('Time between Bounces [s]')
%T2
figure
errorbar(1:size(eT2_height,2),eT2_height, eT2_hr, 'b--o','LineWidth',1)
title('Trial 2: e derived for Height')
xlabel('Number of Bounces')
ylabel('e')

figure
errorbar(1:size(eT2_times,2),eT2_times, eT2_tbr, 'r--o','LineWidth',1)
title('Trial 2: e derived for Time')
xlabel('Number of Bounces')
ylabel('Time between Bounces [s]')
%T3
figure
errorbar(1:size(eT3_height,2),eT3_height, eT3_hr, 'b--o','LineWidth',1)
title('Trial 3: e derived for Height')
xlabel('Number of Bounces')
ylabel('e')

figure
errorbar(1:size(eT3_times,2),eT3_times, eT3_tbr, 'r--o','LineWidth',1)
title('Trial 3: e derived for Time')
xlabel('Number of Bounces')
ylabel('Time between Bounces [s]')
%T4
figure
errorbar(1:size(eT4_height,2),eT4_height, eT4_hr, 'b--o','LineWidth',1)
title('Trial 4: e derived for Height')
xlabel('Number of Bounces')
ylabel('e')

figure
errorbar(1:size(eT4_times,2),eT4_times, eT4_tbr, 'r--o','LineWidth',1)
title('Trial 4: e derived for Time')
xlabel('Number of Bounces')
ylabel('Time between Bounces [s]')
%T5
figure
errorbar(1:size(eT5_height,2),eT5_height, eT5_hr, 'b--o','LineWidth',1)
title('Trial 5: e derived for Height')
xlabel('Number of Bounces')
ylabel('e')

figure
errorbar(1:size(eT5_times,2),eT5_times, eT5_tbr, 'r--o','LineWidth',1)
title('Trial 5: e derived for Time')
xlabel('Number of Bounces')
ylabel('Time between Bounces [s]')
%ToT
figure
ett=[eTT1,eTT2,eTT3,eTT4,eTT5];
ettr=[eTT1_r,eTT2_r,eTT3_r,eTT4_r,eTT5_r];
errorbar(1:size(ett,2),ett, ettr, 'm--o','LineWidth',1)
title('e Derived for Total Time')
xlabel('Number of Trials')
ylabel('Time [s]')
