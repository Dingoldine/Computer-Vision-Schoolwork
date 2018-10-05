%1.7 Rotation
close all; 
clc;
clear all;

alpha = 30;
F = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
G = rot(F, alpha); 

Fhat = fft2(F);
Ghat = fft2(G);
Hhat = rot(fftshift(Ghat), -alpha);

figure(1);
subplot(3,2,1);
showgrey(F)
axis on;
subplot(3,2,2);
showfs(Fhat)
axis on;
title(sprintf('F'));
subplot(3,2,3);
showgrey(G);
title(sprintf('G: rotated F by alpha = %d', alpha));
axis on;
subplot(3,2,4);
showfs(Ghat);
title(sprintf('Ghat'));
axis on;
subplot(3,2,5);
showgrey(log(1 + abs(Hhat)));
title(sprintf('Hhat: Ghat rotated back the same angle'));
axis on;