function pixels = gaussfft(img, t)
%t : variance 

row = size(img, 1);
col = size(img, 2);

[X Y] = meshgrid(-row / 2 : (row / 2) - 1, -col / 2 : (col / 2) - 1); %make the grid and specify endpoints

lp_gauss = (1 / (2 * pi * t)) * exp(-(X.^2 + Y.^2) / (2 * t)); %formula for gaussian distribution


Phat = fft2(img);
Ghat = fft2(fftshift(lp_gauss));

%shows the fourier transform of filter

% figure;
% showfs(Ghat);
% title(sprintf('var = %d' , t)); 


pixels = ifft2(Phat .* Ghat);

end
