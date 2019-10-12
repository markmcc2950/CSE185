%% CODE BY MARK MCCULLOUGH

%% TODO 1 (Remove Red Channel)
% Load Image 1
red = imread('01.jpg');
fprintf('Loading 01.jpg...\n');

% Show Image 1
figure, imshow(red), title('Original Image');

red(:, :, 1) = 0;                           % Remove red channel
figure, imshow(red), title('No red');       % Show new image
imwrite(red, 'red.jpg');                    % Save new image

%% TODO 2 (Convert to Grayscale)
% Load Image 2
img = imread('02.jpg');
fprintf('Loading 02.jpg...\n');

% Show Image 1
figure, imshow(img), title('Original Image (02.jpg)');

redCh = img(:, :, 1);
greenCh = img(:, :, 2);
blueCh = img(:, :, 3);

Y = 0.299 * redCh + 0.5870 * greenCh + 0.1140 * blueCh;

figure, imshow(Y), title('No colors');
imwrite(Y, 'gray.jpg');

%% TODO 3 (Rotate 90 Degrees)
% Load Image 3
img = imread('03.jpg');
fprintf('Loading 03.jpg...\n');

% Show Image 1
figure, imshow(img), title('Original Image (03.jpg)');

R = imrotate(img, 90);

figure, imshow(R), title('Rotated Image');

imwrite(R, 'rotate.jpg');

%% TODO 4 (Crop 30 Pixels From All Sides)
% Load Image 3
img = imread('04.jpg');
fprintf('Loading 04.jpg...\n');

% Show Image 1
figure, imshow(img), title('Original Image (04.jpg)');

% Crop size variable

I = img(30:270, 30:370, 1:3);

figure, imshow(I), title('Cropped Image');

imwrite(I, 'crop.jpg');

%% TODO 5 (Vertical Flip)
% Load Image 4
img = imread('04.jpg');
fprintf('Loading 04.jpg...\n');

% Show Image 1
figure, imshow(img), title('Original Image (04.jpg)');

% Flip vertically (flip(img, 2) for horizontal flip)
F = flip(img);

figure, imshow(F);

imwrite(F, 'flip.jpg');

%% TODO 6 (Combine 4 Pictures to One Frame)
% Load Images
img1 = imread('01.jpg');
fprintf('Loading 01.jpg...\n');
img2 = imread('02.jpg');
fprintf('Loading 02.jpg...\n');
img3 = imread('03.jpg');
fprintf('Loading 03.jpg...\n');
img4 = imread('04.jpg');
fprintf('Loading 04.jpg...\n');

% Create a matrix of size to hold all 4 images + 15 pixel frame
A = zeros(300 * 2 + 15, 400 * 2 + 15, 3, 'uint8');

A(1:300, 1:400, 1:3) = img1;            % Image 1 is top left quadrant
A(1:300, 416:815, 1:3) = img2;          % Image 2 is top right quadrant
A(316:615, 1:400, 1:3) = img3;          % Image 3 is bottom left quadrant
A(316:615, 416:815, 1:3) = img4;        % Image 4 is bottom right quadrant

% Show combined image
figure, imshow(A), title('Combined Image');

% Save combined image
imwrite(A, 'combine.jpg');

%% TODO 7 (Average of Two Pictures Using Vectors)
% Load Images
img = imread('04.jpg');
fprintf('Loading 04.jpg...\n');
imgf = imread('flip.jpg');
fprintf('Loading flip.jpg...\n');

% Show Image 1
A = zeros(300, 400, 3, 'uint8');

A(1:300, 1:400, :) = (img + imgf) / 2;

figure, imshow(A);

imwrite(A, 'average.jpg');