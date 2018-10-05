%1.5 Multiplication
close all;
clc;
clear all;

F = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
G = F';

H = F.*G;  %multiplication in spacial domain

Hhat = fft2(H);
figure(1);
subplot(2,2,1);
showgrey(F);
title(sprintf('F'));
subplot(2,2,2);
showgrey(G);
title(sprintf('G'));
subplot(2,2,3);
showgrey(H);
title(sprintf('H: F.*G'));
subplot(2,2,4);
showfs(fft2(H));
title(sprintf('Hhat: fft2(F.*G)'));

Fhat = fft2(F);
Ghat = fft2(G);

sz =size(F, 1);
con_FG = conv2(fftshift(Fhat), fftshift(Ghat), 'same') / (sz^2); %We need to normalize the image
con_FG = fftshift(con_FG); %We need to shift the convulution again 

figure(2);
subplot(1,3,1);
showgrey(log(1 + abs(Fhat)));
title(sprintf('Fhat'));
subplot(1,3,2);
showgrey(log(1 + abs(Ghat)));
title(sprintf('Ghat'));
subplot(1,3,3);
showfs(con_FG);
title(sprintf('conv2(Fhat, Ghat): Convolutions in fourier domain'));

