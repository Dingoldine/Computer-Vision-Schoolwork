%1.8 Fourier Phase and Magnitude

% POW2IMAGE(inpic, threshold) -- Power spectrum as negative power of two
%
% POW2IMAGE performs a transformation in the Fourier domain such 
% that the phase information is preserved, whereas the magnitude 
% is REPLACED BY a power spectrum of the form
%
% |Fourier|^2 \sim 1/(a + |omega|^2)

% Replace the power spectrum (NOT a linear operation)

close all;
clear all;
clc;
a = 10^-9;

img1 = phonecalc128;
img2 = few128;
img3 = nallo128;

figure(1);
subplot(1,3,1);
showgrey(img1);
subplot(1,3,2);
showgrey(img2);
subplot(1,3,3);
showgrey(img3);

mod1 = pow2image(img1, a);
mod2 = pow2image(img2, a);
mod3 = pow2image(img3, a);

figure(2);
subplot(1,3,1);
showgrey(mod1);
subplot(1,3,2);
showgrey(mod2);
subplot(1,3,3);
showgrey(mod3);


rand1 = randphaseimage(img1);
rand2 = randphaseimage(img2);
rand3 = randphaseimage(img3);

figure(3);
subplot(1,3,1);
showgrey(rand1);
subplot(1,3,2);
showgrey(rand2);
subplot(1,3,3);
showgrey(rand3);
