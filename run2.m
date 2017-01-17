I = imread('./images/0099.png');
I = im2double(I);

% sigma=0.5% of min. image size dimension in pixels.
sigma = min(size(I))*0.01;

% Calculate coefficients of the LoG filter. Result is the mask.
M = calcLog(sigma);

% Applying mask on the image.
% filter2: Filters the data in I with the two-dimensional FIR filter in the matrix M. Result is the same size as I.
F = conv2(I, M);

%%% Try also with simple filter.
gfilter= [0 0 1 0 0;
          0 1 2 1 0;
          1 2 -16 2 1;
          0 1 2 1 0;
          0 0 1 0 0];
F2 = conv2(I, gfilter);
%%%

% Finds the zero crossings of F to determine the locations of edges in I
final = marrHildreth(F2, 2);
final = im2uint8(final);
imwrite(final, 'out3.png');

figure(1); clf;
imshow(I);
colormap gray;
figure(2); clf;
imshow(F);
colormap gray;
figure(3); clf;
imagesc(final);
colormap gray;

%Built-in function:
I2 = edge(I,'log');
figure(4); clf;
imagesc(I2);
imwrite(I2, 'out4.png');

%colormap gray;