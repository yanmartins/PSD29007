close all;
clear all;
clc;

Ap = 1;
As = 20;

fp = 1000; % Frequência de passagem (Hz)
fs = 2000; % Frequência de stopband (Hz)

wp = 2*pi*fp;
ws = 2*pi*fs; 

Ws = ws/wp;
Wp = wp/wp;

epson = sqrt(10^(0.1*Ap)-1);

n = (log10((10^(0.1*As) - 1)/(epson^2)))/(2*log10(Ws)); % Ordem do filtro
n = ceil(n); % Faz o arredondamento pra cima

k = 1:n;
p = (epson^(-1/n))*exp(1j*pi*((2.*k+n-1)/(2*n)));
D = poly(p);
N = D(end)

figure(1);
subplot(2,2,[1 3])
zplane(N,D);

subplot(2,2,2)
[h,w] = freqs(N ,D,10000);
semilogx(w, 20*log10(abs(h)))
grid on;

subplot(2,2,4)
semilogx(w, unwrap(angle(h))/pi)
grid on;