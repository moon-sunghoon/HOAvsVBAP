function Ymn = getSHM(n, azim_deg, elev_deg)
%n is order
%m is index,degree
%convert degree to radian
azim = azim_deg*pi/180;
elev = elev_deg*pi/180;
%calculate the number of ambisonic components
nComp = (n+1)^2;
%Matrix for spherical harmonic functions
Y =  zeros(nComp, 1);

for N = 0:n
  for m = -N:N
      acn = N^2+N+m+1; %ambisonic channel numbers ordering for building up the SH matrix
      P = legendre(N, sin(elev));
      %define Associated Legendre Functions
      if N==0
          Pmn = P;
      else
          Pmn = squeeze(P(abs(m)+1,:,:));
      end    
      
      if N==0
           e = 1;
      else
           e = 2;
      end     
      %Nmn = e* (factorial(N - abs(m))) / factorial(N + abs(m))*sqrt(2*N + 1);  N3D
      Nmn = sqrt(e*(factorial(n - abs(m))) ./ (4*pi*factorial(n + abs(m)))); %SN3D
      
      %Spherical Harmonics Functions with the removal of Cordon-shortley
      %phase issue
      if m >=0
          Y (acn,:) =sqrt(2)* Nmn .* Pmn .* cos(abs(m)*azim).*(-1)^abs(m);
      else 
          Y (acn,:)= sqrt(2)*Nmn .* Pmn .* sin(abs(m)*azim).*(-1)^abs(m);
      end
      Ymn = Y;
  end
end  
    
      
    
