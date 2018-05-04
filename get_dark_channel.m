function dark_channel = get_dark_channel(image, win_size)

[m, n, ~] = size(image);

pad_size = floor(win_size/2);

padded_image = padarray(image, [pad_size pad_size], Inf); %the new image

dark_channel = zeros(m, n); 

for j = 1 : m
    for i = 1 : n
        % the patch has top left corner at (jj, ii)
        patch = padded_image(j : j + (win_size-1), i : i + (win_size-1), :);
% the dark channel for a patch is the minimum value for all
        % channels for that patch
        dark_channel(j,i) = min(patch(:));
     end
end

end