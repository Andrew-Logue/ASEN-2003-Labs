function [rho] = IR(TrackSec, d1, d2)
    rho = ((1+d1.^2).^1.5)./abs(d2);
end