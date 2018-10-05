function [linepar acc] = houghedgeline(pic, scale, gradmagnthreshold,nrho, ntheta, nlines, verbose)

% edge detection step
curves = extractedge(pic, scale, gradmagnthreshold, 'same');
pic = gaussfft(pic,scale);
magnitude = Lv(pic);
% magnitude = Lv(pic, true, scale, 'same');

if verbose == 1
    figure('name', 'overlaycurves: image + edge segments')
    overlaycurves(pic, curves);

    figure('name', 'gradient magnitude')
    showgrey(magnitude);
end

[linepar, acc] = houghline(curves, magnitude, nrho, ntheta,gradmagnthreshold, nlines);
visual_output(pic, linepar);

if verbose == 2
    figure('name', 'Hough space')
    showgrey(acc);
    figure('name', 'gradient magnitude')
    showgrey(magnitude);
end

