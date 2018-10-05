clc; clear all; close all;

house = godthem256;
tools = few256;

scale = [0.0001 1 4 16 64];
threshold = [1 4 10]; 

for n = 1 : 5
    figure;
    for k = 1:3
     subplot(2, 3 , k)
    edges = extractedge(house, scale(n), threshold(k),'same');
    if n == 1
        title(sprintf('scale = %.4f, threshold = %d', scale(1), threshold(k)));
    else
         title(sprintf('scale = %.4f, threshold = %d', scale(n), threshold(k)));
    end
    
    end
end


for n = 1 : 5
    figure;
    for k = 1:3
     subplot(2, 3 , k)
    edges = extractedge(tools, scale(n), threshold(k),'same');
    if n == 1
        title(sprintf('scale = %.4f, threshold = %d', scale(1), threshold(k)));
    else
         title(sprintf('scale = %.4f, threshold = %d', scale(n), threshold(k)));
    end
    
    end
end
