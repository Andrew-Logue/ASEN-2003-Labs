function [gTable] = gPrint(gnorm, gtan, gnormud, gnormlr, gbrake)
    updown = [gnorm(1:859),gnormud,gnorm(1261:2172)];
    leftright = [zeros(1,859),gnormlr,zeros(1,912)];
    frontback = [gtan];
    gTable = [updown;leftright;frontback];
end