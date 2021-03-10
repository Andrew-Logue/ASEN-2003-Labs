function [l] = arclength(dSec,xSec)
    int = sqrt(dSec.^2+1);
    l = Simpson(xSec,int);
end