%1.4 Linearity
close all;
clc;
clear all;

F = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
G = F';
H = F + 2 * G;

Fhat = fft2(F);
Ghat = fft2(G);
Hhat = fft2(H);

figure(1);
subplot(2,2,1)
showgrey(F);
title(sprintf('F'));
subplot(2,2,2);
showgrey(G);
title(sprintf('G'));
subplot(2,2,3);
showgrey(log(1 + abs(Fhat)));
title(sprintf('Fhat'));
subplot(2,2,4);
showgrey(log(1 + abs(Ghat)));
title(sprintf('Ghat'));

%with logarithm
figure(2);
subplot(1,3,1);
showgrey(H);
title(sprintf('H: F + 2*G'));
subplot(1,3,2);
showgrey(log(1 + abs(Hhat)));
title(sprintf('Hhat'));
subplot(1,3,3);
showgrey(log(1 + abs(fftshift(Hhat))));
title(sprintf('Centered Hhat'));

%without logarithm
figure(3);
subplot(1,3,1);
showgrey(H);
title(sprintf('H: F + 2*G'));
subplot(1,3,2);
showgrey(abs(Hhat));
title(sprintf('Hhat'));
subplot(1,3,3);
showgrey(abs(fftshift(Hhat)));
title(sprintf('Centered Hhat'));