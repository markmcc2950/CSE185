%% TODO 1: Split Frequency
img = im2double(imread('images/cameraman.jpg'));
ratio = 0.1;
ratio2 = 0.2;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);
[low_pass_img2, high_pass_img2] = separate_frequency(img, ratio2);

imwrite(low_pass_img, 'cameraman_low_0.1.jpg');
figure, imshow(low_pass_img), title('Low Frequency 0.1');
imwrite(high_pass_img + 0.5, 'cameraman_high_0.1.jpg');
figure, imshow(high_pass_img), title('High Frequency 0.1');
imwrite(low_pass_img2, 'cameraman_low_0.2.jpg');
figure, imshow(low_pass_img2), title('Low Frequency 0.2');
imwrite(high_pass_img2 + 0.5, 'cameraman_high_0.2.jpg');
figure, imshow(high_pass_img2), title('High Frequency 0.2');

%% TODO 2: Hybrid Image
meow = 'images/cat.jpg';
woof = 'images/dog.jpg';

img1 = im2double(imread(meow));
img2 = im2double(imread(woof));

ratio = 0.15;
ratio2 = 0.05;
meoof = hybrid_image(img1, img2, ratio);
woeow = hybrid_image(img1, img2, ratio2);

figure, imshow(meoof), title('Hybrid 1: Ratio 0.15');
imwrite(meoof + 0.5, 'hybrid_1.jpg');
figure, imshow(woeow), title('Hybrid 2: Ratio 0.05');
imwrite(woeow + 0.5, 'hybrid_2.jpg');