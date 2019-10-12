%%TODO 1: 
%%(SHIFT BY 25 PIXELS IN THE POSITIVE VERTICAL DIRECTION) -> translate.jpg
I1 = imread('01.jpg');
fprintf('Loading 01.jpg...');
I2 = zeros(300 + 25, 400, 3, 'uint8');          %
figure, imshow(I1), title('Original Image');    % Show original image

for y1 = 1 : 300
    for x1 = 1 : 400
        y2 = 25 + y1;                           % Add 25 pixels vertically
        x2 = x1;                                % Horizontal stays the same
        
        I2(y2, x2, :) = I1(y1, x1, :);          % I2 is shifted I1
    end
end

figure, imshow(I2), title('Shifted Image');     % Show the shifted image
imwrite(I2, 'translate.jpg');  