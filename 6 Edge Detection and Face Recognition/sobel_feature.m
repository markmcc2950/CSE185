function [magnitude, orientation] = sobel_feature(img)

    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
    Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
    
    %% Sobel filtering
    hSobel = sobel_filter(img, Hy);
    vSobel = sobel_filter(img, Hx);
    M = sqrt(hSobel.^2+vSobel.^2);
    O = atan2(hSobel, vSobel);
    
    %% compute gradient magnitude and orientation
    magnitude = M; % change img to your gradient magnitude
    orientation = O; % change img to your gradient orientation
end