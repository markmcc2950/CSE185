function kernel = myKernel(h_size, sigma)

m = h_size; n = h_size;
g = @(dx,dy) exp(-(dx^2 + dy^2)/(2*sigma^2));

grid = zeros(m,n);
middle = ceil(m/2);
for i = 1:m
    for j = 1:n
        dx = j - middle;
        dy = i - middle;
        grid(i,j) = g(dx,dy);
    end
end
sum = 0;
for i = 1:size(grid,1)
    for j = 1:size(grid,2)
        sum = sum + grid(i,j);
    end
end
h = grid ./ sum;
kernel = h;
end