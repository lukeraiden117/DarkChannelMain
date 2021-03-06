function atmosphere = get_atmosphere(image, dark_channel)
% the color of the atmospheric light is very close to the color of the sky
% so just pick the first few pixels that are closest to 1 in JDark
% and take the average

% pick top 0.1% brightest pixels in the dark channel

% get the image size

[m, n, ~] = size(image);
n_pixels = m * n;

n_search_pixels = floor(n_pixels * 0.01);

dark_vec = reshape(dark_channel, n_pixels, 1); % a vector of pixels in JDark

image_vec = reshape(image, n_pixels, 3);% a vector of pixels in my image

[~, indices] = sort(dark_vec, 'descend'); %sorting

accumulator = zeros(1, 3);

for k = 1 : n_search_pixels
    accumulator = accumulator + image_vec(indices(k),:);
end

atmosphere = accumulator / n_search_pixels;

end