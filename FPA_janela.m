close all;
clear all;
%clc;

Ap = 0.2;
As = 50;

wp = 0.3*pi;
ws = 0.2*pi;
wc = sqrt(ws*wp);

ordem_calc = ceil((3.32*pi)/abs(wp-ws));
ordem = 40;
M = ordem/2;
n = -M:M;

% Janela temporal usada no projeto de filtros digitais
w_hamming = 0.54 + 0.46*cos((2*pi.*n)/(2*M + 1));

% Coeficiente da série de Fourier de filtros ideias
chp = -sin(wc.*n)./(pi*n);
chp(M+1) = 1-(wc/pi);

hamming = w_hamming.*chp;
h = hamming * 10^(-0.1/20);

[Hw,w] = freqz(h, 1, 10000);


vector = abs(Hw) > 10^(-Ap/20);
aux = find(vector, 1, 'first');
W_p_medido = w(aux)/pi

vector2 = abs(Hw) > 10^(-As/20);
aux = find(vector2, 1, 'first');
W_stop_medido = w(aux)/pi


plot(w/pi,20*log10(abs(Hw))); grid on, hold on
plot([0 ws/pi ws/pi 1], -[As As 0 0], '-m')
plot([1 wp/pi wp/pi], -[Ap Ap 120], '-m')
plot([wp/pi ws/pi], -[Ap As], 'Ok')
plot(w/pi, vector*(-10))
title(['Hamming N = ' num2str(ordem)])