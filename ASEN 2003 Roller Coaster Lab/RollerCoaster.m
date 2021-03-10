% ASEN 2003 Roller Coaster Project Code
% Lab Section 019
% Andrew Logue, Devon Paris, Jack Foster, Siyang Liu
% This code will plot the designed path of our group's roller coaster and analyze its
%   dynamic motion as it travels along the track and separate elements. From this analysis, we will
%   investigate the coaster's velocity and G forces through specifically
%   designed track elements

%% Clearing Commands
clc
clear all
close all

%% Track Sections and Plot
x1 = 0:.5:100;
x2 = 100:.5:162.5;
x3 = 162.5:.5:225;
x4 = 225:.5:230;
x5 = 230:.5:300;
x6 = 300:.5:350;
x7 = 350:.5:400;
x8 = 400:.5:420;
x9 = 420:.5:425;
Sec1 = 125-(0.0025*(x1.^2));
Sec2 = (.004*(x2-162.5).^2)+84.375;
Sec3 = (.002*(x3-162.5).^2)+84.375;
Sec4 = .25*(x4-225)+92.1875;
Sec5 = (6.035*((x5-230)/24.142))-(4.905*((x5-230)/24.142).^2)+93.4375;
Sec6 = (.009233*(x6-350).^2)+46.6169;
Sec7 = (.01*(x7-350).^2)+46.6169;
Sec8 = (-.025*(x8-420).^2)+81.617;
Sec9 = 81.617*ones(1,length(x9));
ds1 = .005.*x1;
ds2 = .008.*(x2-162.5);
ds3 = .004.*(x3-162.5);
ds4 = .25*ones(1,length(x4));
ds5 = (6.035/24.142) - ((2*4.905)/24.142).*((x5-230)/24.243);
ds6 = 2*.009233*(x6-350);
ds7 = .02*(x7-350);
ds8 = -.05*(x8-420);
ds9 = 0*ones(1,length(x9));
dd1 = .005*ones(1,length(x1));
dd2 = .008*ones(1,length(x2));
dd3 = .004*ones(1,length(x3));
dd4 = 0*ones(1,length(x4));
dd5 = (((2*4.905)/24.142)*(1/24.142))*ones(1,length(x5));
dd6 = 2*.009233*ones(1,length(x6));
dd7 = .02*ones(1,length(x7));
dd8 = -.05*ones(1,length(x8));
dd9 = ds9;

ycurve = 0:.5:200;
th1 = 0:.125:25;
th2 = 24.875:-.125:0;
BankTheta = [th1,th2];
x10 = sqrt(10000-(ycurve-100).^2)+435;
Sec10 = 81.617*ones(1,length(x10));
ds10 = -(ycurve-100)./sqrt(-ycurve.^2+200.*ycurve);
dd10 = -10000./((-ycurve.^2+200.*ycurve).^(3/2));

% generate loop
[X_arr,Y_arr,Z_arr] = LoopGeneration(30);
x11 = X_arr;
Sec11 = Z_arr;

% Braking Section
x12 = 395.3807:-.5:295.3807;
Sec12 = 81.617*ones(1,length(x12));
ypostcurve = 200*ones(1,length(x12));


fpv = [Sec1,Sec2,Sec3,Sec4,Sec5,Sec6,Sec7,Sec8,Sec9,Sec10,Sec11,Sec12];
fd = [ds1,ds2,ds3,ds4,ds5,ds6,ds7,ds8,ds9,ds10];
fdd = [dd1,dd2,dd3,dd4,dd5,dd6,dd7,dd8,dd9,dd10];
dy = [ds1,ds2,ds3,ds4,ds5,ds6,ds7,ds8,ds9,zeros(1,401)];
xt = [x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12];
pc = [Sec1,Sec2,Sec3,Sec4,Sec5,Sec6,Sec7,Sec8,Sec9];
yprecurve = zeros(1,length(pc));
y = [yprecurve,ycurve,ypostcurve];
y = [y Y_arr];

figure
plot3(xt,y,fpv)
title('Roller Coaster Track')
xlabel('X Distance')
ylabel('Y Distance')
zlabel('Height')
hold on
plot3(00,500,00)
% % plot3(X_arr,Y_arr,Z_arr)

%% Calculations
Vel1 = VelFinder(fpv);
Rho = IR(fpv,fd,fdd);
[atan, anorm] = aFinder(dy,Rho,Vel1);
[gtan, gnorm] = gFinder(atan, anorm);
c=1;
for i=860:1260
    gnormlr(c) = gnorm(i).*cosd(BankTheta(c));
    gnormud(c) = gnorm(i).*sind(BankTheta(c));
    c=c+1;
end
braked = -4.25587395;
brakevel = sqrt(Vel1(1971)^2+2*braked*(395.3807-x12));
brakevel(201) = 0;
Vel1 = [Vel1,brakevel];
gbrake = braked/9.81;
gloop = 3.8922*ones(1,711);
for i=1:710
    atanloop(i) = -1*(Vel1(i+1260)*(Sec11(i+1)-Sec11(i)));
    gtanloop(i) = atanloop(i)/9.81;
end
gtanloop(711) = 0;
gnorm = [gnorm, gloop, zeros(1,201)];
gtan = [gtan, gtanloop, gbrake*ones(1,201)];
table = gPrint(gnorm, gtan, gnormud, gnormlr);
%L = arclength(fdd,xt);









