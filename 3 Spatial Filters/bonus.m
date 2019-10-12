%% BONUS
% Implement Boundary Padding
% Zero padding
img1 = im2double(imread('lena_noisy.jpg'));
fprintf("Opening lena_noisy.jpg...\n");
img2 = im2double(imread('lena.jpg'));
fprintf("Opening lena.jpg...\n");

img3 = zeros(size(img1,1) + 6, size(img1,2) + 6);
for k = 4:size(img1) + 3
    for l = 4:size(img1) + 3
        img3(k,l) = img2(k-3,l-3); 
    end
end

figure, imshow(img3);

% Replicated/Repeated Pattern
img4 = zeros(size(img1,1) + 6, size(img1,2) + 6);
img4 = img3;

% Top
for i = 3 : size(img4,2) - 3                % Height
    for j = 1:3                             % Width
        img4(j,i) = img3(4, i);     
    end
end
% Bottom
for i = 3 : size(img4,1) - 3
    for j = size(img4,2) - 2 : size(img4,2)
        img4(j,i) = img3(size(img4,2)-3, i);
    end
end
% Left Side
for i = 1 : size(img4,2)                    % Height
    for j = 1:3                             % Width
        img4(i,j) = img4(i,4);     
    end
end
% Right Side
for i = 1 : size(img4,1)
    for j = size(img4,2) - 2 : size(img4,2)
        img4(i,j) = img4(i,size(img4,2)-3);
    end
end




figure, imshow(img4);

%% Bonus Pt. II

%Implemented in myKernel.m
