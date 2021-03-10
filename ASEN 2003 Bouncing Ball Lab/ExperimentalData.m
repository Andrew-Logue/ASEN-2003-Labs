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

% %Standard deviation
% xb1 = (sum(T1_times))/(length(T1_times));
% xb2 = (sum(T2_times))/(length(T2_times));
% xb3 = (sum(T3_times))/(length(T3_times));
% xb4 = (sum(T4_times))/(length(T4_times));
% xb5 = (sum(T5_times))/(length(T5_times));
% 
% xb = [xb1,xb2,xb3,xb4,xb5];
% 
% diff1 = sum(((T1_times-xb(1)).^2));
% diff2 = sum(((T2_times-xb(2)).^2));
% diff3 = sum(((T3_times-xb(3)).^2));
% diff4 = sum(((T4_times-xb(4)).^2));
% diff5 = sum(((T5_times-xb(5)).^2));
% 
% std1 = sqrt(((1/(length(T1_times)-1))*diff1));
% std2 = sqrt(((1/(length(T2_times)-1))*diff2));
% std3 = sqrt(((1/(length(T3_times)-1))*diff3));
% std4 = sqrt(((1/(length(T4_times)-1))*diff4));
% std5 = sqrt(((1/(length(T5_times)-1))*diff5));


% for i = 1:5
%     L(i) = length(xb(i));
%     for j = 1:L(i)
%     xtot(i) = sum(xb(i)-)
% end

eh = .05;
L1 = length(T1_height);
for i = 1:L1-1
    pd11(i) = .5.*((T1_height(i)./T1_height(i+1)).^(-.5)).*(1./T1_height(i+1));
    pd12(i) = .5.*((T1_height(i)./T1_height(i+1)).^(-.5)).*(-1*T1_height(i)./(T1_height(i+1)).^2);
    E1(i) = sqrt(((pd11(i).*eh).^2)+ ((pd12(i).*eh).^2));
    x= 1;
    
end