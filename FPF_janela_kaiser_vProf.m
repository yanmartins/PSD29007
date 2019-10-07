 ws1 = 0.1*pi; wp1 = 0.2*pi; wp2 = 0.3*pi; ws2 = 0.4*pi;
As = 50;
Ap = 0.2;
wc1 = sqrt(wp1*ws1);
wc2 = sqrt(wp2*ws2);

N1 = 60;  % obtido por kaiser
N = 58; % corrigido
wc1 = wc1 +0.0107*pi
wc2 = wc2 + 0.0018*pi;
M = N/2;
L = N+1;
n = (-M:M);
% ajuste pois a janela ficou acima de 50
As2 = As + 0.65;
if As2 > 50
    beta = 0.1102*(As2-8.7);
elseif As2 >= 21
    beta = 0.5842*(As2-21)^0.4 + 0.07886*(As2-21);
else
    beta = 0;
end
wkaiser = kaiser(L,beta)';

cbp = (sin(wc2*n)-sin(wc1*n))./(pi*n);
cbp(M+1) = (wc2 -wc1)/pi;
figure(1)
Glin0 = 10^(-Ap/2/20);
h = cbp.*wkaiser * Glin0;
stem(n,cbp,'xr'); hold on
stem(n,wkaiser,'+k')
stem(n,h, 'ob')
hold off
%fvtool(h,1);
[Hw,w] = freqz(h,1,10000);
plot(w/pi, 20*log10(abs(Hw)))
fmask = [0 0.1 0.1 0.4 0.4 1 1 0.2 0.2 0.3 0.3];
Amask = -[As As 0 0 As As 100 100 Ap Ap 100];
hold on; plot(fmask, Amask,':m'); hold off; ylim([-(As +30) 5]); grid on

% APLICANDO FILTRO A UM SINAL REAL

fa = 44100;
fs1 = 