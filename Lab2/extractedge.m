

function [edgecurves] = extractedge(inpic, scale, threshold, shape)

if (nargin < 4)
    shape = 'same';
end

inpic_smooth = gaussfft(inpic,scale);

lv = Lv(inpic_smooth,shape);                       % magnitude of the first derivative
Lvv = Lvvtilde(inpic_smooth, shape);              % magnitude of the second derivative
Lvvv = Lvvvtilde(inpic_smooth, shape);            % magnitude of the third derivative

Lv_mask = (lv > threshold)-0.1;             % since 0 and 1 are considered true, we subtract an arbitrary term 
Lvvv_mask = (Lvvv < 0)-0.1;                 % in order to obtain positive and negative values.

% sort zerocrossings with negative Lvvv and Lv above threshold
% The first one extracts level curves in a given image and rejects points based on the sign of the second input argument.
% The second function thresholds these curves with respect to the sign of another image.
edgecurves = zerocrosscurves(Lvv, Lvvv_mask);
edgecurves = thresholdcurves(edgecurves, Lv_mask);

overlaycurves(inpic, edgecurves);

end