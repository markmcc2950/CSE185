%%TODO 5:
%%(Down-sample by scale of 2) -> scale.jpg
I1 = imread('01.jpg');
scale = 3;
I6 = zeros(300*scale, 400*scale, 3, 'uint8');                   % Initialize size of new image


for y1 = 1:300
    for x1 = 1:400
        y2 = y1*scale;
        x2 = x1*scale;
        I6(y2, x2, :) = I1(y1, x1, :);
        
    end
end

figure, imshow(I6), title('Scaled Up');
