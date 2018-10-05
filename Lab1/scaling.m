% 1.6 Scaling
clc;
close all;
clear all;

F = [zeros(60, 128); ones(8, 128); zeros(60, 128)];
G = [zeros(128, 48) ones(128, 32) zeros(128, 48)];

OldF = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
OldG = OldF';

H = F.*G;
OldH = OldF.*OldG;  %multiplication in spacial domainG = F';

figure(1);
subplot(2,2,1);
showgrey(F);
title(sprintf('F'));
subplot(2,2,2);
showgrey(G);
title(sprintf('G'));
subplot(2,2,3);
showgrey(H);
title(sprintf('H: F.*G'));
subplot(2,2,4);
showfs(fft2(H));
title(sprintf('Centered Hhat'));

figure(2);
subplot(2,2,1);
showgrey(OldF);
title(sprintf('OldF'));
subplot(2,2,2);
showgrey(OldG);
title(sprintf('OldG'));
subplot(2,2,3);
showgrey(OldH);
title(sprintf('OldH'))
subplot(2,2,4);
showfs(fft2(OldH));
title(sprintf('Centered previous Hhat'));

