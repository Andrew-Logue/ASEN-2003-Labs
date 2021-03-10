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
M1Test = readmatrix('Method1_Data.csv');
M1Test = M1Test(:,2:end);
M2Test = readmatrix('Method2_Data.csv');
M2Test = M2Test(:,2:end);
M3Test = readmatrix('Method3_Data.csv');

%% e From Height of Bounce
for j=1:size(M1Test,2)
    for i=1:size(M1Test,1)-1
        eheight(i,j) = M1Test(i+1,j)/M1Test(i,j);
    end
end

%% e From Time Between Bounces
for j=1:size(M2Test,2)
    for i=1:size(M2Test,1)-1
        etbounce(i,j) = M2Test(i+1,j)/M2Test(i,j);
    end
end

%% e From Total Time of Motion
for i=1:size(M3Test,2)
    
end

