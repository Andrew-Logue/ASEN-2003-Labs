function [atan, anorm] = aFinder(dy, rho, Velocity)
    atan = Velocity(1:1260).*dy;
    anorm = (Velocity(1:1260).^2)./rho;
end
%dy = [ds1,ds2,ds3,ds4,ds5,ds6,ds7,ds8,ds9,zeros(1,401)];