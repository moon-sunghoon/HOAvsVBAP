function Bmn = encodeHOA(order, signal, azim,elev,L)


if nargin ==4
Ymn = getSHM(order,azim,elev);  %spherical harmonics function

Bmn = signal*Ymn.'; %calcuatle the ambisnoic signals
end

if nargin ==5
 Ymn = speakerSH(order,L);
 Bmn = signal*Ymn;
end 



