clear all;
close all;
clc;

img = phonecalc128;
pic = sunflower128;
foto = tower128;

t1 = 0.1;
t2 = 0.3;
t3 = 1.0;
t4 = 10.0;
t5 = 100.0;

t6 = 4.0;
t7 = 16.0;
t8 = 64.0;
t9 = 256.0;

new_img1 = gaussfft(img, t3);
new_img2 = gaussfft(img, t6);
new_img3 = gaussfft(img, t7);
new_img4 = gaussfft(img, t8);
new_img5 = gaussfft(img, t9);

new_pic1 = gaussfft(pic, t3);
new_pic2 = gaussfft(pic, t6);
new_pic3 = gaussfft(pic, t7);
new_pic4 = gaussfft(pic, t8);
new_pic5 = gaussfft(pic, t9);

new_foto1 = gaussfft(foto, t3);
new_foto2 = gaussfft(foto, t6);
new_foto3 = gaussfft(foto, t7);
new_foto4 = gaussfft(foto, t8);
new_foto5 = gaussfft(foto, t9);

figure(1);
subplot(3,2,1)
showgrey(new_img1);
title(sprintf(' t = %d', t3))
subplot(3,2,2)
showgrey(new_img2);
title(sprintf(' t = %d', t6))
subplot(3,2,3)
showgrey(new_img3);
title(sprintf(' t = %d', t7))
subplot(3,2,4)
showgrey(new_img4);
title(sprintf(' t = %d', t8))
subplot(3,2,5)
showgrey(new_img5);
title(sprintf(' t = %d', t9))
subplot(3,2,6)
showgrey(img);
title(sprintf('original image'))


figure(2);
subplot(3,2,1)
showgrey(new_pic1);
title(sprintf(' t = %d', t3))
subplot(3,2,2)
showgrey(new_pic2);
title(sprintf(' t = %d', t6))
subplot(3,2,3)
showgrey(new_pic3);
title(sprintf(' t = %d', t7))
subplot(3,2,4)
showgrey(new_pic4);
title(sprintf(' t = %d', t8))
subplot(3,2,5)
showgrey(new_pic5);
title(sprintf(' t = %d', t9))
subplot(3,2,6)
showgrey(pic);
title(sprintf('original image'))

figure(3);
subplot(3,2,1)
showgrey(new_foto1);
title(sprintf(' t = %d', t3))
subplot(3,2,2)
showgrey(new_foto2);
title(sprintf(' t = %d', t6))
subplot(3,2,3)
showgrey(new_foto3);
title(sprintf(' t = %d', t7))
subplot(3,2,4)
showgrey(new_foto4);
title(sprintf(' t = %d', t8))
subplot(3,2,5)
showgrey(new_foto5);
title(sprintf(' t = %d', t9))
subplot(3,2,6)
showgrey(foto);
title(sprintf('original image'))

figure(4);
subplot(3,2,1);
psf1 = gaussfft(deltafcn(128, 128), t1);
showgrey(psf1);
v1 = variance(psf1)
title(sprintf('impulse response: t = %d', t1))
subplot(3,2,2)
psf2 = gaussfft(deltafcn(128, 128), t2);
showgrey(psf2);
v2 = variance(psf2)
title(sprintf('impulse response: t = %d', t2))
subplot(3,2,3)
psf3 = gaussfft(deltafcn(128, 128), t3);
showgrey(psf3);
v3 = variance(psf3)
title(sprintf('impulse response: t = %d', t3))
subplot(3,2,4)
psf4 = gaussfft(deltafcn(128, 128), t4);
showgrey(psf4);
v4 = variance(psf4)
title(sprintf('impulse response: t = %d', t4))
subplot(3,2,5)
psf5 = gaussfft(deltafcn(128, 128), t5);
showgrey(psf5);
v5 = variance(psf5)
title(sprintf('impulse response: t = %d', t5))


