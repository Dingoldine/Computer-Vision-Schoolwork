clear all; close all; clc;
[x y] = meshgrid(-5:5, -5:5);

dx = [0 0 0 0 0; 0 0 0 0 0; 0 -0.5 0 0.5 0; 0 0 0 0 0; 0 0 0 0 0];
dy = dx';

dxx = [0 0 0 0 0; 0 0 0 0 0; 0 1 -2 1 0; 0 0 0 0 0; 0 0 0 0 0];
dyy = dxx';

% dxy = filter2(dx, dy, shape);
dxxx = conv2(dx, dxx, 'same');
dxxy = conv2(dxx, dy, 'same');
dxyy = conv2(dx, dyy, 'same');
dyyy = conv2(dy, dyy, 'same');

Lx = filter2(dx, x.^3, 'valid');
Lxx = filter2(dxx, x .^3, 'valid');
Lxxx = filter2(dxxx, x .^3, 'valid');
Lxxy = filter2(dxxy, x .^2 .* y, 'valid');

figure;
subplot(1,4,1)
showgrey(Lx)
subplot(1,4,2)
showgrey(Lxx)
subplot(1,4,3)
showgrey(Lxxx)
subplot(1,4,4)
showgrey(Lxxy)

figure;
subplot(1,4,1)
showgrey(3*x.^2)
subplot(1,4,2)
showgrey(6*x)
subplot(1,4,3)
showgrey(6);
