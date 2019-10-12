function img_filtered = gaussian_filter2(img, hsize, sigma)
    myKernel = fspecial('gaussian', hsize, sigma);
    
    I2 = zeros(size(img));
    shift_u = floor(size(myKernel,2) / 2);
    shift_v = floor(size(myKernel,1) / 2);
    
    for u = (1 + shift_u) : (size(img, 2) - shift_u)
        for v = (1 + shift_v) : (size(img, 1) - shift_v)
            x1 = u - shift_u; 
            x2 = u + shift_u;
            y1 = v - shift_v; 
            y2 = v + shift_v;
            
            patch = img(y1:y2, x1:x2);
            patch = patch(:);           % Convert Matrix to column Vector (V)
            myKernel = myKernel(:);         % Convert Matrix to row Vector (H)
            myKernel = myKernel';
            
            value = myKernel*patch;
            I2(v,u) = value;
            
        end
    end
    
    img_filtered = I2;
    
    
end