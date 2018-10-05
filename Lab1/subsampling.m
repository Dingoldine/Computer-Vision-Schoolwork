clear all;
close all;
clc;

img = phonecalc256;
smoothing = img;
N=4;
figure;

img_subsamp = img;
smoothing = img;

for i=1:N
if i>1 % generate subsampled versions
img_subsamp = rawsubsample(img);
smoothing = gaussfft(img,2); % smooth the new resize image
smoothing = rawsubsample(smoothing);
%smoothimg = ideal(img,1,'l'); % smooth the new resize image
%smoothimg = rawsubsample(smoothimg); % reduce the size image again
end
subplot(2, N, i)
showgrey(img_subsamp)
title(sprintf('subsampling: i= %d',i))
axis on
subplot(2, N, i+N)
showgrey(smoothing)
title(sprintf('subsampling-Gaussian filtering: i= %d',i))
axis on

img = img_subsamp; 
end


img = phonecalc256;


img_subsamp = img;
smoothimg = img;
figure;
for i=1:N
if i>1 % generate subsampled versions
img_subsamp = rawsubsample(img);
smoothimg = ideal(img, 0.1,'l'); % smooth the new resize image
smoothimg = rawsubsample(smoothimg);
end
subplot(2, N, i)
showgrey(img_subsamp)
title(sprintf('subsampling: i= %d',i))
axis on
subplot(2, N, i+N)
showgrey(smoothimg)
title(sprintf('subsampling-low pass filtering: i= %d',i))
axis on

img = img_subsamp; 
end