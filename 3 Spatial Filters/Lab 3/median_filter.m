function img_filtered = median_filter(img, patch_size)
    I2 = zeros(size(img));
    shift_v = floor(patch_size(2) / 2);
    shift_u = floor(patch_size(1) / 2);
    
    for u = 1 + shift_u : size(img, 2) - shift_u
        for v = 1 + shift_v : size(img, 1) - shift_v
            x1 = u - shift_u; 
            x2 = u + shift_u;
            y1 = v - shift_v; 
            y2 = v + shift_v;
            
            patch = img(y1:y2, x1:x2);
            patch = patch(:);           % Convert Matrix to Vector
            value = median(patch);
            I2(v, u) = value;
            
        end
    end
    
    img_filtered = I2;
end