function [Velocity] = VelFinder(Fcn)
    Velocity = sqrt(2*9.81*(125-Fcn));
end