%%TODO 4:
%%(Vertical flip) -> flip.jpg
I7 = imread('01.jpg');                          % Open original image
a = 180;                                        % Angle of 180 degrees
xO = 200;                                       % X-coordinate origin
yO = 150;                                       % Y-coordinate origin
I8 = zeros(300, 400, 3, 'uint8');               % Initialize size of new image
figure, imshow(I7), title('Original Image');    % Show original image

for y1 = 1:300
    for x1 = 1:400
        x2 = round(cosd(a)*(x1-xO) + sind(a)*(y1-yO) + xO);
        y2 = round(-sind(a)*(x1-xO) + cosd(a)*(y1-yO) + yO);
        if (x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            I8(y2, x2, :) = I7(y1, x1, :);
        end
    end
end

figure, imshow(I8), title('Rotated Image');
imwrite(I8, 'flip.jpg');