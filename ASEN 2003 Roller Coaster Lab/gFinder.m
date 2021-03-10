function [gtan, gnorm] = gFinder(atan, anorm)
    gtan = atan./9.81;
    gnorm = (anorm./9.81)-1;
end