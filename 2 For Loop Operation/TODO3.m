%%TODO 3:
%%(ROTATE BY 60 DEGREES USING BACKWARD WARPING) -> rotateB.jpg
I5 = imread('rotateF.jpg');                          % Open original image
a = 60;                                         % Angle of 60 degrees
xO = 200;                                       % X-coordinate origin
yO = 150;                                       % Y-coordinate origin
I6 = zeros(300, 400, 3, 'uint8');               % Initialize size of new image
figure, imshow(I5), title('Original Image');    % Show original image

for y2 = 1:300
    for x2 = 1:400
        x1 = round(cosd(a)*(x2-xO) + -sind(a)*(y2-yO) + xO);
        y1 = round(sind(a)*(x2-xO) + cosd(a)*(y2-yO) + yO);
        if (x1 >= 1 && x1 <= 400 && y1 >= 1 && y1 <= 300)
            I3(y2, x2, :) = I1(y1, x1, :);
        end
    end
end

figure, imshow(I3), title('Backwards Warped Image');
%fprintf('Writing rotateB.jpg...\n');
%imwrite(I3, 'rotateB.jpg');