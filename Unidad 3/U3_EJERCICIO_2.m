close all; clear all; history -c; clc;
pkg load control;

% Ejercicio 2.1:
s = tf('s');
W_V = 3000/(s^2 + 156.25*s + 1837.5);
% Resulta que si se aplica el teorema del valor final con V(s) = 10/s
% lim (t_inf) w(t) = lim (s_0) s*W(s) = lim (s_0) s*V(s)*F(s) con F(s) = W(s)/V(s)
% w_est = (30000*s)/(s^2 + 156.25*s + 1837.5)
w_est = 30000/1837.5

% Ejercicio 2.2:
wn = sqrt(1837.5)
K = 3000/1837.5
Amort = 156.25/(2*wn)
Ts = 4/(Amort*wn)

% Ejercicio 2.3:
step(W_V,1)

% Ejercicio 2.4:
pzmap(W_V)
