% 1.3 Basic functions
clear all; 
close all; 
clc;

Fhat = zeros(128, 128); % 128x128 pixel image
Fhat(5, 9) = 1;
F = ifft2(Fhat); % inverse discrete Fourier transform

figure;
fftwave(5,9);
figure;
fftwave(9,5);
figure;
fftwave(17,9);
figure;
fftwave(17,121);
figure;
fftwave(5,1);
figure;
fftwave(125,1);
figure;
fftwave(1,5);

%passing half the image size
figure;
fftwave(5,70);



