close all; clc; clear all;


%pic = few256;
% pic = phonecalc256;
% pic = godthem256;

pic = triangle128;
scale = 2;
nrho = 300;
ntheta = 300;
gradmagnthreshold = 20;
nlines = 3;
verbose = 2;


[linepar acc] = houghedgeline(pic, scale, gradmagnthreshold,nrho, ntheta, nlines, verbose);

% too high threshold: accumulator without local maxima --> no line
% rho=500, theta=50, threshold=5, nlines=3 --> good (subsampled triangle)
% rho = 500, theta=60; threshold=4, nlines=4 --> good (triangle)
% too small scale(1): too many detail: no precision in the edge detection
% by incresing the scale, we need a lower threshold
