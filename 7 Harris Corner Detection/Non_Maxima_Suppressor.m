function local_maxima = Non_Maxima_Suppressor(img)
    output = zeros(size(img));
    
    for u = 2 : (size(img, 2) - 2)
        for v = 2 : (size(img, 1) - 2)
            x1 = u - 1; x2 = u + 1;
            y1 = v - 1; y2 = v + 1;
            
            patch = img(y1 : y2, x1 : x2);
            patch = img(v, u) >= patch(:);
            
            if sum(patch) == 9
                output(v, u) = 1;
            else
                output(v, u) = 0;
            end
        end
    end
    local_maxima = output;    
end