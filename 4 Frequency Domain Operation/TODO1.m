%% TODO 1: Split Frequency
img = im2double(imread('images/cameraman.jpg'));
ratio = 0.1;
ratio2 = 0.2;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);
[low_pass_img2, high_pass_img2] = separate_frequency(img, ratio2);

imwrite(low_pass_img, 'cameraman_low_0.1.jpg');
imwrite(high_pass_img + 0.5, 'cameraman_high_0.1.jpg');
imwrite(low_pass_img2, 'cameraman_low_0.2.jpg');
imwrite(high_pass_img2 + 0.5, 'cameraman_high_0.2.jpg');