clear all; close all; clc;
img = godthem256;

tools = few256;
figure;
showgrey(img);

scale = [0.0001 1 4 16 64];

figure;
for n = 1 : 5
    subplot(2,3,n)
    contour(Lvvtilde(discgaussfft(img, scale(n)), 'same'), [0 0]); % Draws a contour plot of matrix Z in the x-y plane
    axis('image')
    axis('ij')
    if n == 1
        title(sprintf('scale = %.4f', scale(1)));
    else
        title(sprintf('scale = %.1f', scale(n)));
    end        
end

figure;
for n = 1 : 5
    subplot(2,3,n)
    showgrey(Lvvvtilde(discgaussfft(tools, scale(n)), 'same') < 0)    

    if n == 1
        title(sprintf('scale = %.4f', scale(1)));
    else
        title(sprintf('scale = %.1f', scale(n)));
    end        
end


