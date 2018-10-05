clear all; close all; clc;

tools = few256;
%smoothing
% tools = gaussfft(tools, 0.5);

% simple difference operator
sdo_x = [-1 1];
sdo_y = sdo_x';

% central difference operator
cdo_x = [-0.5 0 0.5];
cdo_y = cdo_x';

% roberts operator
roberts_pos_dig = [-1 0; 0 1];
roberts_neg_dig = [0 -1; 1 0];

% sobel operator
sobel_x = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_y = [-1 0 1; -2 0 2; -1 0 1];
sobel_pos_dig = [0 1 2; -1 0 1; -2 -1 0];
sobel_neg_dig = [-2 -1 0; -1 0 1; 0 1 2];

% sdo
figure('name', 'Simple Difference Operator')
sdxtools = conv2(tools, sdo_x, 'same');
sdytools = conv2(tools, sdo_y, 'same');
subplot(1,2,1)
showgrey(sdxtools);
title('x direction');
subplot(1,2,2)
showgrey(sdytools);
title('y direction');

% cdo
figure('name', 'Central Difference Operator')
cdxtools = conv2(tools, cdo_x, 'same');
cdytools = conv2(tools, cdo_y, 'same');
subplot(1,2,1)
showgrey(cdxtools);
title('cdo x direction');
subplot(1,2,2)
showgrey(cdytools);
title('cdo y direction');


gradmagntools = sqrt(sdxtools .^2 + sdytools .^2);
figure;
showgrey(gradmagntools);
title(sprintf('image of magnitude of derivative'));

threshold = 15;
figure;
histogram(gradmagntools, 256) %256 = possible pixel values
title(sprintf('Histogram of magnitude: tools'));


figure;
showgrey((gradmagntools - threshold) > 0) %shows onbly pixel that is > 0 after removing the value set at threshold
% if we set threshoold to 
title(sprintf('threshold = %d', threshold));

img = godthem256; 
derivative = Lv(godthem256);

figure;
histogram(derivative, 256)
title(sprintf('Histogram of magnitude: House')); 
threshold_2 = 20;

figure;
showgrey((derivative - threshold_2) > 0)
title(sprintf('threshold = %d', threshold_2));


% % roberts
% figure('name', 'Roberts Operator')
% posdigtools = conv2(tools, roberts_pos_dig, 'valid');
% negdigtools = conv2(tools, roberts_neg_dig, 'valid');
% subplot(1,2,1)
% showgrey(posdigtools);
% title('diagonal');
% subplot(1,2,2)
% showgrey(negdigtools);
% title('reverse diagonal');
% 
% % sobel
% figure('name', 'Sobel Operator')
% dxtools = conv2(tools, sobel_x, 'valid');
% dytools = conv2(tools, sobel_y, 'valid');
% posdigtools = conv2(tools, sobel_pos_dig, 'valid');
% negdigtools = conv2(tools, sobel_neg_dig, 'valid');
% subplot(2,2,1)
% showgrey(dxtools);
% title('x direction');
% subplot(2,2,2)
% showgrey(dytools);
% title('y direction');
% subplot(2,2,3)
% showgrey(posdigtools);
% title('diagonal');
% subplot(2,2,4)
% showgrey(negdigtools);
% title('reverse diagonal');