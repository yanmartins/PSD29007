close all;
clear all;
clc;

%% FPB
fs = 8000;
f = [1000 1500];
a = [1 0];

dev = [0.01 0.01]; 
[n,fo,ao,w] = firpmord(f,a,dev,fs);
b = firpm(n,fo,ao);

[h,w] = freqz(b,1,512);
plot(w/pi, 20*log10(abs(h)))
xlabel 'Radian Frequency (\omega/\pi)', ylabel 'Magnitude'

%% FPF

fs = 8000;
f = [800+100 1100-100 1200 1300];
a = [0 1 0];

dev = [0.01 0.05 0.05]; 
[n,fo,ao,w] = firpmord(f,a,dev,fs);
b = firpm(n,fo,ao, w);

[h,w] = freqz(b,1,512);
plot(w/pi, 20*log10(abs(h)))
xlabel 'Radian Frequency (\omega/\pi)', ylabel 'Magnitude'