warning('off','all');

tic;
image = double(imread('Anish_Input_Img6.jpg'))/255;
%Personal images are inputted 

image = imresize(image, 0.4);

result = dehaze_fast(image, 0.95, 5);
toc;

figure, imshow(image)
figure, imshow(result)

warning('on','all');