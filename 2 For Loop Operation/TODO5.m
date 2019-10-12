%%TODO 5:
%%(Down-sample by scale of 2) -> scale.jpg

% Worked with Elsie Cortez for idea of averaging the pixels while scaling
% down. When comparing to just taking every other pixel, we noticed much
% more detail within the scaled image with averaged pixel values.

I1 = imread('01.jpg');                          % Open original image
I6 = zeros(150, 200, 3, 'uint8');               % Initialize size of new image

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