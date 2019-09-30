close all;
clear all;
clc;

%% LOW PASS
close all;
clear all;
clc;
wc = 0.2*pi;
M = 1000;
n = -M:M;
clp = sin(wc.*n)./(pi*n);
clp(M+1) = wc/pi;

% stem(n,clp);
% figure
% freqz(clp,1);
% figure
% zplane(clp,1);
% figure
fvtool(clp,1);

%% HIGH PASS
wc = 0.2*pi;
M = 32;
n = -M:M;
chp = -sin(wc.*n)./(pi*n);
chp(M+1) = 1-(wc/pi);

figure,
stem(n,chp);

figure,
freqz(chp,1);

figure,
zplane(chp,1);

%% BAND PASS
close all;
clear all;
clc;

wc1= 0.5*pi;
wc2 = 0.55*pi;
M = 10;
n = -M:M;

cbp = (sin(wc2.*n) - sin(wc1.*n))./(pi*n);
cbp(M+1) = (wc2-wc1)/pi;

figure,
stem(n,cbp);

figure,
zplane(cbp,1);

fvtool(cbp,1);