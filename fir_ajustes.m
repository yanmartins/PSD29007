% Utilizando o Matlab é possível estimar esses valores utilizando a função kaiserord. 
% Exemplo da obtenção de um filtro passa baixa com fpass = 1000Hz, fstop = 1500Hz, 
% famostragem = 8000Hz atenuação de 40 dB na "stopband"

clear all;
close all;
clc;

fsamp = 8000;
fcuts = [1000 1500];
mags = [1 0];   % Filtro passa baixa
devs = [0.01 0.01];
[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);

Ap = -20*log10(1-devs(1));
As = -20*log10(devs(2));
Amin = As + 20;
Ajuste_Glin = 10^((-Ap/2)/20); 

w_ps = fcuts/(fsamp/2);
wp = w_ps(1);
ws = w_ps(2);
w_c = sqrt(w_ps(1)*w_ps(2));

N = n;

N = ceil(N*(0.3867-0.2344)/(ws-wp));
L = N + 1;

h_fir_kaiser = fir1(N,Wn,kaiser((N+1), beta));
h_fir_ajustado_kaiser = h_fir_kaiser * Ajuste_Glin;

h_fir_hammig = fir1((N+14),Wn,hamming(N+15));
h_fir_ajustado_hamming = h_fir_hammig * Ajuste_Glin;

h_fir_chebwin = fir1((L),Wn,chebwin(L + 1));
h_fir_ajustado_chebwin = h_fir_chebwin * Ajuste_Glin;

[Hw,w] = freqz(h_fir_ajustado_kaiser);
plot(w/pi,20*log10(abs(Hw)));  hold on; grid on;
title(['Janela Kaiser N = ' num2str(N)])

[Hw,w] = freqz(h_fir_ajustado_hamming);
plot(w/pi,20*log10(abs(Hw)));
title(['Janela Hamming N = ' num2str(N)])

[Hw,w] = freqz(h_fir_ajustado_chebwin);
plot(w/pi,20*log10(abs(Hw)));
title(['Janela Chebwin N = ' num2str(L)])

plot([0 ws ws 1], -[0 0 As As], '--k');
plot([0 wp wp], -[Ap Ap Amin], '--k');
ylim([-Amin 5])
legend('Kaiser', 'Hamming', 'Chebwin')