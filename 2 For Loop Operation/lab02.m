%%CODE BY MARK MCCULLOUGH

%% TODO 1 (25 Pixel Shift Vertically): 
I1 = imread('01.jpg');
fprintf('Loading 01.jpg...\n');
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
fprintf('Writing translate.jpg...\n');
imwrite(I2, 'translate.jpg');                   % Save image

%% TODO 2 (Rotate 60 Degrees Using Forward Warping):
a = 60;                                         % Angle of 60 degrees
xO = 200;                                       % X-coordinate origin
yO = 150;                                       % Y-coordinate origin
I3 = zeros(300, 400, 3, 'uint8');               % Init. size of new image

for y1 = 1:300
    for x1 = 1:400
        x2 = round(cosd(a)*(x1-xO) + sind(a)*(y1-yO) + xO);
        y2 = round(-sind(a)*(x1-xO) + cosd(a)*(y1-yO) + yO);
        if (x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            I3(y2, x2, :) = I1(y1, x1, :);
        end
    end
end

figure, imshow(I3), title('Forward Warped Image');
fprintf('Writing rotateF.jpg...\n');
imwrite(I3, 'rotateF.jpg');

%% TODO 3 (Rotate 60 Degrees Using Backward Warping:
a = 60;                                         % Angle of 60 degrees
xO = 200;                                       % X-coordinate origin
yO = 150;                                       % Y-coordinate origin

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
fprintf('Writing rotateB.jpg...\n');
imwrite(I3, 'rotateB.jpg');

%% TODO 4 (Vertical Flip):
a = 180;                                        % Angle of 180 degrees
xO = 200;                                       % X-coordinate origin
yO = 150;                                       % Y-coordinate origin
I5 = zeros(300, 400, 3, 'uint8');               % Init. size of new image

for y1 = 1:300
    for x1 = 1:400
        x2 = round(cosd(a)*(x1-xO) + sind(a)*(y1-yO) + xO);
        y2 = round(-sind(a)*(x1-xO) + cosd(a)*(y1-yO) + yO);
        if (x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            I5(y2, x2, :) = I1(y1, x1, :);
        end
    end
end

figure, imshow(I5), title('Vertically Flipped Image');
fprintf('Writing flip.jpg...\n');
imwrite(I5, 'flip.jpg');


%% TODO 5 (Down Sample By Scale of 2):
I6 = zeros(150, 200, 3, 'uint8');               % Init. size of new image

for y1 = 1:300
    for x1 = 1:400
        if (mod(y1, 2) == 0 && mod(x1, 2) == 0)
            y2 = (y1)/2;                        
            x2 = (x1)/2;
            % Next line takes average of two neighbor pixels for the scaled
            % down pixel values.
            I6(y2, x2, :) = (I1(y1, x1, :)./2 + I1(y1-1, x1-1, :)./2);
        end
    end
end

figure, imshow(I6), title('Scaled Down By 1/2');
fprintf('Writing scale.jpg...\n');
imwrite(I6, 'scale.jpg');


