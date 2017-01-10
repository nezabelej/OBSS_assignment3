function [ kernel ] = calcLog( sigma )
 
    kSize = ceil(4*sigma*sqrt(2));
   
    if (rem(kSize, 2) == 0)
        kSize = kSize+1;
    end
    hSize = floor(kSize/2);
    
 
 
   
    [X, Y] = meshgrid(-hSize:hSize, -hSize:hSize);
   
    kernel = ((X.^2 + Y.^2 - 2*sigma^2)./(sigma^4)).* exp(-(X.^2 + Y.^2)/(2*sigma^2))/(2*pi*sigma^2);
   
    kernel = kernel-(mean(kernel(:)));
   
    mSuma = sum(round(kernel(:).*(-1.49/kernel(hSize + 1, 1))));
   
    valS = -1.49;
   
    for v=-1.49:0.01:-0.50
       
        suma = sum(round(kernel(:).*(v/kernel(hSize+1, 1))));
       
        if (abs(mSuma) > abs(suma))
            mSuma = suma;
            valS = v;
           
        end    
           
       
    end
   
    kernel = round(kernel.*(valS/kernel(hSize, 1)));
 
end