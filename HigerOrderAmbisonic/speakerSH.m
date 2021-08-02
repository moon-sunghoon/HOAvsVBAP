function Ymn = speakerSH(n, L)
%n is order
%m is index,degree

nSpeaker = size(L, 1);

%calculate the number of ambisonic components
nComp = (n+1)^2;
%Matrix for spherical harmonic functions
Y =  zeros(nComp, nSpeaker);

for nS = 1:nSpeaker
    for N = 0:n
      for m = -N:N
          acn = N^2+N+m+1; %ambisonic channel numbers ordering for building up the SH matrix
          P = legendre(N, sin(L(nS,2)));
          %define Associated Legendre Functions
          if N==0
              Pmn = P;
          else
              Pmn = squeeze(P(abs(m)+1,:,:));
          end    

          if m==0
               e = 1;
          else
               e = 2;
          end     
          %Nmn = e.* (factorial(N - abs(m))) / factorial(N + abs(m))*sqrt(2*N + 1);  N3D
          Nmn =  sqrt((factorial(n - abs(m))) ./ (4*pi*factorial(n + abs(m)))); %SN3D

          %Spherical Harmonics Functions with the removal of Cordon-shortley
          %phase issue
          if m >=0
              Y (acn,nS) =sqrt(2)* Nmn* Pmn .* cos(abs(m)*L(nS,1)).*(-1)^abs(m);
          else 
              Y (acn,nS)= sqrt(2)*Nmn * Pmn .* sin(abs(m)*L(nS,1)).*(-1)^abs(m);
          end
          
      end
    end 
    Ymn = Y;
end   
    