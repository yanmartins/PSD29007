clc;

%% RAÍZES
a = [2 4 2]; % 2x² + 4x + 2

raizes = roots(a) % obtem as raízes do polinômio
polinomio = poly([-1 -1]) % encontra um polinômio a partir das raízes

zplane([1 2 3 4 5],1) % plota polos e zeros no circulo unitário


%% FRAÇÕES PARCIAIS
b = [ 5 3 -2 7];
a = [-4 0 8 3];
[r,p,k] = residue(b,a) % resolve as frações parcias


%% CÁLCULO SIMBÓLICO
syms x
syms y

f(x,y) = (2*x^2 + 4*x*y + 2)/(x^6)
f(-1,2)
derivada_x = diff(f(x,y),x)
derivada_y = diff(f(x,y),y)

pretty(f) % deixa a função visualmente mais legível

latex(f) % converte o código em latex


%% FORMATAÇÃO DOCUMENTAÇÃO LATEX
syms x
f = taylor(log(1+x));
ezplot(f)
hold on
title(['$' latex(f) '$'],'interpreter','latex')
hold off


%% RESPOSTA EM FREQUÊNCIA DE FILTROS ANALÓGICOS
syms s
syms w

H(s) = (0.2*s^2 + 0.3*s + 1)/(s^2 + 0.4*s + 1)

pretty(H)
latex(H)

Hw(w) = H(j*w)

pretty(Hw)
latex(Hw)

