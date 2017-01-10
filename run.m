I = imread('image1.png');
sigma = min(size(I))*0.005; % sigma=0.5% of min. image size dimension in pixels.
M = calcLog(sigma); % Calculation of the mask of the LoG filter.
F = filter2(M,I); % Filters the data in I with the two-dimensional FIR filter in the matrix M. Result is the same size as I.
figure(1); clf;
imshow(I);
colormap gray;
figure(2); clf;
imshow(F)
colormap gray;
final = marrHildreth(F,0); % Finds the zero crossings of F to determine the locations of edges in I
figure(3); clf;
imagesc(final);
colormap gray;