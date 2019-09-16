close all;
clear all;
clc;

syms s p z;

% Especificações do filtro
Ap = 1;     % Atenuação de passagem
As = 30;    % Atenuação de stop (dB)
fp1 = 811;
fp2 = 895.5;
fs1 = 770;
fs2 = 1209;

fa = 8000;

teta_p1 = fp1/(fa/2);
lambda_p1 = 2*tan((teta_p1*pi)/2);

teta_p2 = fp2/(fa/2);
lambda_p2 = 2*tan((teta_p2*pi)/2);

teta_s1 = fs1/(fa/2);
lambda_s1 = 2*tan((teta_s1*pi)/2);

teta_s2 = fs2/(fa/2);
lambda_s2 = 2*tan((teta_s2*pi)/2);

% Passa baixa para passa faixa

lambda_o = sqrt(lambda_p1*lambda_p2);
B = lambda_p2 - lambda_p1;
P = (s^2 + lambda_o^2)/(B*s);

Ws1 = abs((-(lambda_s1^2)+(lambda_o^2))/(B*lambda_s1)); % Cálculo da frequência do primeiro protótipo
Ws2 = abs((-(lambda_s2^2)+(lambda_o^2))/(B*lambda_s2)); % Cálculo da frequência do segundo protótipo

Wp = 1;
Ws = min(Ws1, Ws2);     % Salva o menor protótipo


% Protótipo do filtro
[n, Wn] = buttord(Wp, Ws, Ap, As, 's');
[b, a] = butter(n, Wn, 's');
[h1, w1] = freqs(b, a, 10e3);
Hp(p) = poly2sym(b,p)/poly2sym(a,p);


% Transformação de frequência
Hs(s) = subs(Hp, P);
[bs_sym, as_sym] = numden(Hs);
bs = sym2poly(bs_sym);
as = sym2poly(as_sym);
[h2, w2] = freqs(bs, as, 10e3);


% Transformação bilinear (filtro-digital)
Hz(z) = subs(Hs, (2*1*(z-1)/(z+1)));
[bz_sym, az_sym] = numden(collect(Hz));
bz = sym2poly(bz_sym);
az = sym2poly(az_sym);
an = az(1);     % fator de normalização
bzn = bz/an;    % normalizado
azn = az/an;    % normalizado
[h3, w3] = freqz(bzn, azn, 1e3);

figure,
semilogx(w1, mag2db(abs(h1))); grid on;hold on;
title('Protótipo passa-baixa - Hp')
ylim([-20 0])
%plot([lambda_p, lambda_s], -[Ap, As], 'Ok'); % Visualização do período de transição
hold off;

figure,
semilogx(w2, mag2db(abs(h2))); grid on; hold on;
title('Transformação em frequência - Hs')
ylim([-20 0])
%plot([lambda_p, lambda_s], -[Ap, As], 'Ok'); % Visualização do período de transição
hold off;

figure,
semilogx((w3/(2*pi))*fa, mag2db(abs(h3))); grid on; hold on;
title('Transformação bilinear - Hz')
ylim([-20 0])
%plot([fp, fs], -[Ap, As], 'Ok'); % Visualização do período de transição
hold off;

figure,
zplane(b,a)
title('Polos e Zeros - Hp')
xlabel('Eixo real')
ylabel('Eixo imaginário')

figure,
zplane(bs, as)
title('Polos e Zeros - Hs')
xlabel('Eixo real')
ylabel('Eixo imaginário')

figure,
zplane(bzn, azn)
title('Polos e Zeros - Hz')
xlabel('Eixo real')
ylabel('Eixo imaginário')