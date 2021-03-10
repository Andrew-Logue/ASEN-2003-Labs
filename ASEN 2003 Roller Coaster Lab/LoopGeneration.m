function [X_arr,Y_arr,Z_arr] = LoopGeneration(r)
%Andrew Logue - 1/27/2021
% graph clothoid loop with constant centripital acceleration
% input: r multiplier
% output: coordinate arrays for plotting
% number upward Gs experienced in loop is 3.8922 Gs

% multiplier
% r = 30; % meters
% acceleration constant
a = 9.81;
% x distance
x6 = 300:.5:340;
% section 6
Sec6 = [];
% arc length
syms s;
% X and Z equations with Fresnel integration
X = r*sqrt(pi/2)*fresnelc(sqrt(2/pi)*s);
Z = r*sqrt(pi/2)*fresnels(sqrt(2/pi)*s);

% get first two values so while loop works
i = 1;
X_arr(1,i) = r*sqrt(pi/2)*fresnelc(sqrt(2/pi)*((i-1)/200));
Z_arr(1,i) = r*sqrt(pi/2)*fresnels(sqrt(2/pi)*((i-1)/200));
i = i+1;
X_arr(1,i) = r*sqrt(pi/2)*fresnelc(sqrt(2/pi)*((i-1)/200));
Z_arr(1,i) = r*sqrt(pi/2)*fresnels(sqrt(2/pi)*((i-1)/200));

% generate the first half of the loop
while Z_arr(1,i-1) <= Z_arr(1,i)
    i = i+1;
    X_arr(1,i) = r*sqrt(pi/2)*fresnelc(sqrt(2/pi)*((i-1)/200));
    Z_arr(1,i) = r*sqrt(pi/2)*fresnels(sqrt(2/pi)*((i-1)/200));
end

% find X coordinate offset
X_offset = X_arr(1,i);
j = i;
% generate the second half of the loop
while Z_arr(1,i) ~= 0
    i = i+1;
    j = j-1;
    X_arr(1,i) = -X_arr(1,j)+(2*X_offset);
    Z_arr(1,i) = Z_arr(1,j);
end

% set Y_arr to tie into final roller coaster plot
Y_arr = zeros(1,i)+200;
% offset X_arr and Z_arr to line up with roller coaster plot
X_arr = X_arr+435-(2*X_offset);
X_arr = flip(X_arr);
Z_arr = Z_arr+81.617;
% figure
% plot3(X_arr,Y_arr,Z_arr)

% figure
% fplot(X,Z,[0,3])
% figure
% fplot(X,[0,3])
% figure
% fplot(Z,[0,3])
% figure
% fplot(fresnels(sqrt(2/pi)*x),[-3,3])
% ezplot('x.^3 + y.^3 - 3*x.*y'), axis equal
end