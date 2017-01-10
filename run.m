I = imread('image1.png');
[N,sigma] = computeParameters(I,0.005);%
M = logMask(10, 1.80);
%M = calcLog(sigma);
If = filter2(M,I);
figure(1); clf;
imshow(I);
colormap gray;
figure(2); clf;
imshow(If)
colormap gray;
final = marrHildreth(If,0);
figure(3); clf;
imagesc(final);
colormap gray;