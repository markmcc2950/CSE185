
img1 = im2double(imread('lena_noisy.jpg'));
fprintf("Opening lena_noisy.jpg...\n");
img2 = im2double(imread('lena.jpg'));
fprintf("Opening lena.jpg...\n");
% 
% 
%% Median filter
patch_size = [3, 3];
patch_size2 = [5, 5];

img_median = median_filter(img1, patch_size);
figure, imshow(img_median), title('3x3 Median Filter');
imwrite(img_median, 'median_3.jpg');                   % Save image

img_median2 = median_filter(img1, patch_size2);
figure, imshow(img_median2), title('5x5 Median Filter');
imwrite(img_median2, 'median_5.jpg');                   % Save image



%% Sobel filter
HE = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
VE = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge

img_sobel = sobel_filter(img2, HE);
figure, imshow(img_sobel), title('Horizontal Sobel Filter');
imwrite(img_sobel, 'sobel_h.jpg');                   % Save image

img_sobel2 = sobel_filter(img2, VE);
figure, imshow(img_sobel2), title('Vertical Sobel Filter');
imwrite(img_sobel2, 'sobel_v.jpg');                   % Save image


%% Gaussian filter
hsize = 5; sigma = 2;
hsize2 = 9; sigma2 = 4;

img_gaussian = gaussian_filter(img2, hsize, sigma);
figure, imshow(img_gaussian), title('Gaussian Filter (size 2, sigma 2)');
imwrite(img_gaussian, 'gaussian_5.jpg');                   % Save image

img_gaussian2 = gaussian_filter(img2, hsize2, sigma2);
figure, imshow(img_gaussian2), title('Gaussian Filter (size 9, sigma 4)');
imwrite(img_gaussian2, 'gaussian_9.jpg');                   % Save image

%% BONUS
% Implement Boundary Padding
% Zero padding

img3 = zeros(size(img1,1) + 6, size(img1,2) + 6);
for k = 4:size(img1) + 3
    for l = 4:size(img1) + 3
        img3(k,l) = img2(k-3,l-3); 
    end
end

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
figure, imshow(img4), title('Padded Image (Pre-Filter)');
imwrite(img4, 'BONUS_padded.jpg');                   % Save image

% Gaussian Filter without Kernel on Padded Image
hsize2 = 9; sigma2 = 4;
img_gaussian2 = gaussian_filter2(img4, hsize2, sigma2);
% Crop size variable
img5 = img_gaussian2(3:size(img4,1)-3, 3:size(img4,2)-3, :);

figure, imshow(img5), title('Padded Image (Post-Filtered)');
imwrite(img5, 'BONUS_gaussian_padding.jpg');                   % Save image


