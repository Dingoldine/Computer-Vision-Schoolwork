close all; clear all; clc;

scale_factor = 0.5;       % image downscale factor
spatial_bandwidth =4;  % spatial bandwidth
colour_bandwidth = 6;   % colour bandwidth
num_iterations = 40;      % number of mean-shift iterations
image_sigma = 1.0;        % image preblurring scale
seed = 14; 

I = imread('orange.jpg');
%I = imread('tiger1.jpg');
%I = imread('tiger2.jpg');
%I = imread('tiger3.jpg');


I = imresize(I, scale_factor);
Iback = I;
d = 2*ceil(image_sigma*2) + 1;
h = fspecial('gaussian', [d d], image_sigma);
I = imfilter(I, h);

segm = mean_shift_segm(I, spatial_bandwidth, colour_bandwidth, num_iterations, seed);
Inew = mean_segments(Iback, segm);
I = overlay_bounds(Iback, segm);
imwrite(Inew,'result/meanshift1.png')
imwrite(I,'result/meanshift2.png')

subplot(1,2,1);
imshow(Inew);
title(sprintf('spatial bandwidth = %.1f, colour bandwidth = %.1f', spatial_bandwidth, colour_bandwidth));
subplot(1,2,2); 
imshow(I);