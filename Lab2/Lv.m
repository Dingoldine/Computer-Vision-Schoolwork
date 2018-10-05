function pixels = Lv(inpic, shape)

sdx = [-1 1];
sdy = sdx';

cdx = [-0.5 0 0.5];
cdy = cdx';

roberts_pos_dig = [-1 0; 0 1];
roberts_neg_dig = [0 -1; 1 0];

sobel_x = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_y = [-1 0 1; -2 0 2; -1 0 1];

dxmask = sdx;
dymask = sdy;

if (nargin < 2)
    shape = 'same';
end

Lx = filter2(dxmask, inpic, shape);     % convolution between image and mask
Ly = filter2(dymask, inpic, shape);

pixels = sqrt(Lx.^2 + Ly.^2);

end