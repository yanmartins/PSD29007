close all;
clear all;
clc;

fp = 10e3;
fs = 15e3;
fa = 50e3;

wa = 2*pi*(fa/2);
ws = 2*pi*fs;
wp = 2*pi*fp;
wc = sqrt(ws*wp);

teta_c = wc/wa;
teta_c = teta_c - 0.01;

ordem = 10;
M = ordem/2;
n = -M:M;

% Valores medidos
n_atual = ordem;
w_sm = 0.766;
w_pm = 0.33;

n_novo = ((w_sm-w_pm)*n_atual)/(0.2)

ordem = 24;
M = ordem/2;
n = -M:M;

% Janelas temporais usadas no projeto de filtros digitais
w_n_retangular = 1;
w_n_hamming = 0.54 + 0.46*cos((2*pi.*n)/(2*M + 1));
w_n_hann = 0.5 + 0.5*cos((2*pi.*n)/(2*M + 1));

% Coeficiente da série de Fourier de filtros ideias
clp = sin(teta_c*pi.*n)./(pi*n);
clp(M+1) = teta_c;

retangular = w_n_retangular.*clp;
hamming = w_n_hamming.*clp;
hann = w_n_hann.*clp;

fvtool(retangular,1, hamming, 1, hann, 1);
legend('Retangular', 'Hamming', 'Hann')