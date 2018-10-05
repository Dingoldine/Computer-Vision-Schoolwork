clear all; clc; close all; 

K = 5;               % number of clusters used
L = 30;              % number of iterations
seed = 14;           % seed used for random initialization
scale_factor = 1;  % image downscale factor
image_sigma = 1;   % image preblurring scale

%I = imread('orange.jpg');
%I = imread('tiger1.jpg');
%I = imread('tiger2.jpg');
%I = imread('tiger3.jpg');
I = imread('pingis.jpeg');

I = imresize(I, scale_factor);
Iback = I;
d = 2*ceil(image_sigma*2) + 1;
h = fspecial('gaussian', [d d], image_sigma);
I = imfilter(I, h);
Ivec = reshape(I, size(I,1)*size(I,2), 3);

tic
[segm, centers, empty, cen_idx, num_iterations] = kmeans_segm(I, K, L, seed);
toc

segm = reshape(segm,size(I,1),size(I,2),1);
Inew = mean_segments(Iback, segm);
Iover = overlay_bounds(Iback, segm);
imwrite(Inew,'result/kmeans1.png')
imwrite(Iover,'result/kmeans2.png')

    figure;
    subplot(1,3,1)
    imshow(I)
    title('original');
    subplot(1,3,2)
    imshow(Inew)
    title(sprintf('K: %d  and L = %d' ,K , num_iterations));
    subplot(1,3,3)
    imshow(Iover)
    title('overlay bound');

    