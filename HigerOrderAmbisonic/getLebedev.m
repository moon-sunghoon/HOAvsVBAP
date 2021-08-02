function [phi,theta,L] = getLebedev(n)


switch n
    case 1
            phiDeg = [0 0 90 180 270 45 135 225 315 0 45 90 135 180 ...
                            225 270 315 45 135 225 315 0 90 180 270 0];
            thetaDeg = [90 45 45 45 45 35 35 35 35 0 0 0 0 0 0 0 0 ...
                                  -35 -35 -35 -35 -45 -45 -45 -45 -90];
    case 2
            phiDeg = 	[0 45 135 225 315 0 90 180 270 45 135 225    ...
                         315 18 72 108 162 198 252 288 342 0 45 90   ...
                         135 180 225 270 315 18 72 108 162 198 252   ...
                         288 342 45 135 225 315 0 90 180 270 45 135  ...
                                                             225 315 0];
            thetaDeg = [90 65 65 65	65 45 45 45	45 35 35 35 35 18 18 ...
                        18 18 18 18	18 18 0	0 0	0 0	0 0 0 -18 -18    ...
                        -18 -18 -18 -18 -18 -18 -35 -35 -35 -35 -45  ...
                                       -45 -45 -45 -65 -65 -65 -65 -90];
end
phi = phiDeg;
theta = thetaDeg;

L(:,1) = phiDeg*pi/180;
L(:,2) = thetaDeg*pi/180;
                              
                              