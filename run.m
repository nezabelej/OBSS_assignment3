I = imread('0001.png');

% sigma=0.5% of min. image size dimension in pixels.
sigma = min(size(I))*0.01;

% Calculate coefficients of the LoG filter. Result is the mask.
M = calcLog(sigma);

% Applying mask on the image.
% filter2: Filters the data in I with the two-dimensional FIR filter in the matrix M. Result is the same size as I.
F = filter2(M,I); 

figure(1); clf;
imshow(I);
colormap gray;
figure(2); clf;
imshow(F);
colormap gray;
% Finds the zero crossings of F to determine the locations of edges in I
final = marrHildreth(F,250); 
figure(3); clf;
imagesc(final);
imwrite(final, 'output.png');
colormap gray;

I2 = edge(I,'log');
figure(4); clf;
imagesc(I2);
colormap gray;