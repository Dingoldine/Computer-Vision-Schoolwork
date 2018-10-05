close all;
clear all;
clc;

office = office256;

add = gaussnoise(office, 16); %random white noise, gaussain distribution
sap = sapnoise(office, 0.1, 255);

figure(1);
subplot(1,3,1)
showgrey(office);
title(sprintf('original image'))
subplot(1,3,2)
showgrey(add);
title(sprintf('gaussnoise'))
subplot(1,3,3)
showgrey(sap)
title(sprintf('sapnoise'))


wsz = 15; % windowsize
t = 0.5;  %variance of filter
cut = 5;  % cut-off frequency CUTOFF cycles per pixel

new_img1 = gaussfft(add, t);
new_img2 = medfilt(add, wsz, wsz);
new_img3 = ideal(add, cut, 'l');

new_img4 = gaussfft(sap, 3);
new_img5 = medfilt(sap, 5, 5);
new_img6 = ideal(sap, 0.1, 'l');


figure(1);
subplot(1,3,1)
showgrey(new_img1);
title(sprintf('gaussfft: variance = %d', t))
subplot(1,3,2)
showgrey(new_img2);
title(sprintf('median filter: window size = %d * %d', wsz, wsz))
subplot(1,3,3)
showgrey(new_img3);
title(sprintf('ideal lowpassfiter: cutoff = %d', cut))
suptitle('White noise Image')

figure(2)
subplot(1,3,1)
showgrey(new_img4);
title(sprintf('gaussfft: variance = %d', t))
subplot(1,3,2)
showgrey(new_img5);
title(sprintf('median filter: window size = %d * %d', wsz, wsz))
subplot(1,3,3)
showgrey(new_img6);
title(sprintf('ideal lowpassfiter: cutoff = %d', cut))
suptitle('Salt and Pepper image')