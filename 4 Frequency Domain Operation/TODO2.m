%% TODO 2: Hybrid Image
meow = 'images/cat.jpg';
woof = 'images/dog.jpg';

img1 = im2double(imread(meow));
img2 = im2double(imread(woof));

ratio = 0.1;
meoof = hybrid_image(img1, img2, ratio);

figure, imshow(meoof);