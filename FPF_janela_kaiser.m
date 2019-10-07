close all;
clear all;
clc;

ws1 = 0.1*pi;
wp1 = 0.2*pi;
wp2 = 0.3*pi;
ws2 = 0.4*pi;

wc1 = sqrt(wp1*ws1);
wc2 = sqrt(wp2*ws2);

As = 50;            % Atenuação de stop (alfa)
Ap = 0.2;           % Atenuação de passagem
delta_w = 0.1*pi;   % Largura da banda de transição 

% Estimação do fator β
if As > 50
    beta = 0.1102*(As - 8.7);
elseif 50 >= As || As >= 21
    beta = 0.5842*((As - 21)^0.4) + 0.07886*(As - 21);
else
    beta = 0;
end

% Estimação da ordem do filtro (N)
N_estimado = ceil((As - 8)/(2.285*delta_w) + 1); % Deve ser um número inteiro e par

% Correções
N = 58; % Ordem corrigida com base na equação acima

M = N/2;
L = N+1;
n = (-N/2:N/2);

% Janela temporal usada no projeto de filtros digitais
wkaiser = kaiser(L, beta)';

% Coeficiente da série de Fourier de filtros ideias passa faixa
cbp = (sin(wc2.*n) - sin(wc1.*n))./(pi*n);
cbp(M+1) = (wc2-wc1)/pi;

figure,
G_lin0 = 10^((-Ap/2)/20); % Ganho linear para trazer o sinal abaixo de zero
h = cbp.*wkaiser*G_lin0;
stem(n, cbp, 'xr'); hold on;
stem(n, wkaiser, '+k');
stem(n, h, 'ob'); hold off;

figure,
[Hw,w] = freqz(h, 1, 10000);
plot(w/pi,20*log10(abs(Hw))); grid on, hold on

% Criando as máscaras
fmask = [0 0.1 0.1 0.4 0.4 1];
Amask = -[As As 0 0 As As];

fmask2 = [0 0.2 0.2 0.3 0.3 1];
Amask2 = -[100 100 Ap Ap 100 100];

plot(fmask, Amask, '--r')
plot(fmask2, Amask2, '--m')
ylim([-100 20])
