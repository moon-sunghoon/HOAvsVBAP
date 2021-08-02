function output = binauralRenderer(p, phi,theta)
p = p.';

hrir= SOFAload('HRTFs/FABIAN_HRIR_measured_HATO_0.sofa');

output = zeros(length(p)+size(hrir.Data.IR,3)-1,2); 

  for x = 1:size(p,2)
      [idx, ~,~] = SOFAfind(hrir,phi(x),theta(x),1);
    

       hrirL = squeeze(hrir.Data.IR(idx,1,:));
       hrirR = squeeze(hrir.Data.IR(idx,2,:));
       

   
      
     output(:, 1) = output(:, 1) + conv(p(:,x),  hrirL);   
     output(:, 2) = output(:, 2) + conv(p(:,x),  hrirR);  
    
     
        
  end    
 
  
