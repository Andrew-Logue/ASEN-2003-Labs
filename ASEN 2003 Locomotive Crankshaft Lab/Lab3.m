%% LAB 3 LOCOMOTIVE CRANK SHAFT
% Flynn HIll
% Linus Schmitz 
% Andrew Logue
% Benjamin Bauman

%% House Keeping

clear all;
clear;
clc;

%% Variables

r = 7.5; %distance between the origin (rotation axis)and the attachment point A
d = 15.5; %horizontal distance between the vertical shaft and the center of the disk
l = 25; %length of the connecting bar from A to B

uncertanty = 0.0005; % +/- '

%% Loading in Data

Test_5 = 'Test1_5pt5V';
Test_6 = 'Test1_6pt5V';
Test_7 = 'Test1_7pt5V';
Test_8 = 'Test1_8pt5V';
Test_9 = 'Test1_9pt5V';
Test_10 = 'Test1_10pt5V';

%% Functions Calls

[theta_exp_5, w_exp_5, v_exp_5, time_5] = LCSDATA(Test_5);
[theta_exp_6, w_exp_6, v_exp_6, time_6] = LCSDATA(Test_6);
[theta_exp_7, w_exp_7, v_exp_7, time_7] = LCSDATA(Test_7);
[theta_exp_8, w_exp_8, v_exp_8, time_8] = LCSDATA(Test_8);
[theta_exp_9, w_exp_9, v_exp_9, time_9] = LCSDATA(Test_9);
[theta_exp_10, w_exp_10, v_exp_10, time_10] = LCSDATA(Test_10);

v_model_5 = LCSMODEL(r, d, l, theta_exp_5, w_exp_5);
v_model_6 = LCSMODEL(r, d, l, theta_exp_6, w_exp_6);
v_model_7 = LCSMODEL(r, d, l, theta_exp_7, w_exp_7);
v_model_8 = LCSMODEL(r, d, l, theta_exp_8, w_exp_8);
v_model_9 = LCSMODEL(r, d, l, theta_exp_9, w_exp_9);
v_model_10 = LCSMODEL(r, d, l, theta_exp_10, w_exp_10);

%% Calculations

misfit_5 = v_exp_5(1:360) - v_model_5(1:360);
misfit_6 = v_exp_6(1:200) - v_model_6(1:200);
misfit_7 = v_exp_7(1:175) - v_model_7(1:175);
misfit_8 = v_exp_8(1:132) - v_model_8(1:132);
misfit_9 = v_exp_9(1:120) - v_model_9(1:120);
misfit_10 = v_exp_10(1:100) - v_model_10(1:100);

mean_5 = mean(misfit_5);
mean_6 = mean(misfit_6);
mean_7 = mean(misfit_7);
mean_8 = mean(misfit_8);
mean_9 = mean(misfit_9);
mean_10 = mean(misfit_10);

std_5 = std(misfit_5);
std_6 = std(misfit_6);
std_7 = std(misfit_7);
std_8 = std(misfit_8);
std_9 = std(misfit_9);
std_10 = std(misfit_10);

track = 1;
nMisfit_5 = 0;
for i=1:360
    if (misfit_5(i) <= (mean_5 + 2*std_5) && misfit_5(i) >= (mean_5 - 2*std_5))
        nMisfit_5(track) = misfit_5(i);
        track = track + 1;
    end
end

track = 1;
nMisfit_6 = 0;
for i=1:200
    if (misfit_6(i) <= (mean_6 + 2*std_6) && misfit_6(i) >= (mean_6 - 2*std_6))
        nMisfit_6(track) = misfit_6(i);
        track = track + 1;
    end
end

track = 1;
nMisfit_7 = 0;
for i=1:175
    if (misfit_7(i) <= (mean_7 + 2*std_7) && misfit_7(i) >= (mean_7 - 2*std_7))
        nMisfit_7(track) = misfit_7(i);
        track = track + 1;
    end
end

track = 1;
nMisfit_8 = 0;
for i=1:132
    if (misfit_8(i) <= (mean_8 + 2*std_8) && misfit_8(i) >= (mean_8 - 2*std_8))
        nMisfit_8(track) = misfit_8(i);
        track = track + 1;
    end
end

track = 1;
nMisfit_9 = 0;
for i=1:120
    if (misfit_9(i) <= (mean_9 + 2*std_9) && misfit_9(i) >= (mean_9 - 2*std_9))
        nMisfit_9(track) = misfit_9(i);
        track = track + 1;
    end
end

track = 1;
nMisfit_10 = 0;
for i=1:100
    if (misfit_10(i) <= (mean_10 + 2*std_10) && misfit_10(i) >= (mean_10 - 2*std_10))
        nMisfit_10(track) = misfit_10(i);
        track = track + 1;
    end
end

mean_5 = mean(nMisfit_5);
mean_6 = mean(nMisfit_6);
mean_7 = mean(nMisfit_7);
mean_8 = mean(nMisfit_8);
mean_9 = mean(nMisfit_9);
mean_10 = mean(nMisfit_10);

std_5 = std(nMisfit_5);
std_6 = std(nMisfit_6);
std_7 = std(nMisfit_7);
std_8 = std(nMisfit_8);
std_9 = std(nMisfit_9);
std_10 = std(nMisfit_10);

m = max(v_model_5)
m_10 = max(v_model_10)
%% Plots

figure(1)
hold on 
plot(theta_exp_5(1:360), v_exp_5(1:360))
plot(theta_exp_5(1:360), v_model_5(1:360))

xlabel('Angle of theta in degrees')
ylabel('Speed of Collar in cm/s')
title('Speed of Collar vs Angle of Disk: 5.5V')

legend('Experimental Data','Model Data')
hold off

figure(2)
hold on 
plot(theta_exp_6(1:200), v_exp_6(1:200))
plot(theta_exp_6(1:200), v_model_6(1:200))

xlabel('Angle of theta in degrees')
ylabel('Speed of Collar in cm/s')
title('Speed of Collar vs Angle of Disk: 6.5V')
legend('Experimental Data', 'Model Data')
hold off

figure(3)
hold on 
plot(theta_exp_7(1:175), v_exp_7(1:175))
plot(theta_exp_7(1:175), v_model_7(1:175))

xlabel('Angle of theta in degrees')
ylabel('Speed of Collar in cm/s')
title('Speed of Collar vs Angle of Disk: 7.5V')
legend('Experimental Data', 'Model Data')
hold off

figure(4)
hold on 
plot(theta_exp_8(1:132), v_exp_8(1:132))
plot(theta_exp_8(1:132), v_model_8(1:132))

xlabel('Angle of theta in degrees')
ylabel('Speed of Collar in cm/s')
title('Speed of Collar vs Angle of Disk: 8.5V')
legend('Experimental Data', 'Model Data')
hold off


figure(5)
hold on 
plot(theta_exp_9(1:120), v_exp_9(1:120))
plot(theta_exp_9(1:120), v_model_9(1:120))

xlabel('Angle of theta in degrees')
ylabel('Speed of Collar in cm/s')
title('Speed of Collar vs Angle of Disk: 9.5V')
legend('Experimental Data', 'Model Data')
hold off


figure(6)
hold on 
plot(theta_exp_10(1:100), v_exp_10(1:100))
plot(theta_exp_10(1:100), v_model_10(1:100))

xlabel('Angle of theta in degrees')
ylabel('Speed of Collar in cm/s')
title('Speed of Collar vs Angle of Disk: 10.5V')
legend('Experimental Data', 'Model Data')
hold off

figure(7)
hold on
plot(time_5(1:360),misfit_5)
plot(time_6(1:200),misfit_6)
plot(time_7(1:175),misfit_7)
plot(time_8(1:132),misfit_8)
plot(time_9(1:120),misfit_9)
plot(time_10(1:100),misfit_10)

xlabel('Time in Seconds');
ylabel('Residuals in cm/s');

title('Residuals vs Time');

legend('Residual 5','Residual 6','Residual 7','Residual 8','Residual 9','Residual 10')

hold off

figure(8)
hold on
voltage = [5.5,6.5,7.5,8.5,9.5,10.5];
std = [3.6370,3.5625,4.0661,7.5018,4.9038,10.0126];
plot(voltage,std,'o');
lsline

hold off
%% Functions

function [theta_exp, w_exp, v_exp, time] = LCSDATA(filename)

    data = load(filename);
    
    time = data(:,1);
    
    v_exp = data(:,5);
    v_exp = v_exp/10;
    
    w_exp = data(:,4);
    
    theta_exp = data(:,2);
    theta_exp = theta_exp/360;
    
    theta_exp = theta_exp - fix(theta_exp(1));
    
    theta_exp = theta_exp*360;
end

function Vb = LCSMODEL(r, d, l, theta, w)

    beta = asind((d - r.* sind(theta))./l);

    Vb = -r .* w.*(pi/180) .* sind(theta) - r .* w.*(pi/180) .* cosd(theta) .* tand (beta);

end
