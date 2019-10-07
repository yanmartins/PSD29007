close all;
clear all;
%clc;

Ap = 0.2;
As = 50;

wp = 0.3*pi;
ws = 0.2*pi;
wc = sqrt(ws*wp);

ordem_calc = ceil((3.32*pi)/abs(wp-ws)); % Deve ser um número inteiro e par
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

% Encontrando os pontos onde o filtro ultrapassa o limiar da máscara
aux = find((abs(Hw) > 10^(-Ap/20)), 1);
W_p_medido = w(aux)/pi

aux = find((abs(Hw) > 10^(-As/20)), 1);
W_stop_medido = w(aux)/pi

plot(w/pi,20*log10(abs(Hw))); grid on, hold on
plot([0 ws/pi ws/pi 1], -[As As 0 0], '-r')
plot([1 wp/pi wp/pi], -[Ap Ap 120], '-r')
plot([wp/pi ws/pi], -[Ap As], 'Ok')
title(['Hamming N = ' num2str(ordem)])