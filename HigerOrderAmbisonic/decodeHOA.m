function  D = decodeHOA(n, C, Weighting)

%n - order

if nargin <3

D = pinv(C); % Basic decoding with pseudo inverse of speaker layout spherical harmonics functions
end

an = zeros(n,1);
if nargin ==3 %max-re decoding
    
    if Weighting ==1 %max-re
        syms x
        roots = vpasolve(legendreP(n+1,x) == 0);
        rE = max(roots);
        ev = double(rE);
        for N=0:n
            for m = -N:N
            acn = N^2+N+m+1;
            an(acn,:) = legendreP(N, ev); 
            end
        end
       % gain = double(an);
    end
    if Weighting ==2 %in-phase 
       for N =0:n
           for m = -N:N
           acn = N^2+N+m+1;
           an(acn,:) = (factorial(n)*factorial(n+1))./(factorial(N + n + 1).*factorial(n - N));
           end
       end
      % gain = double(an);
    end
    D = pinv(C)*diag(an);    %multiply the gain with decoding matrix
end
    