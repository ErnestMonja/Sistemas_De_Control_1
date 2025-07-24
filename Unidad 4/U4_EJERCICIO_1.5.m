close all; clear all; history -c; clc;
pkg load symbolic;

syms s real;
G5 = (10*(1+s))/(s*(s+4)*(4*s^2 + 6*s + 1))
% Sistema Tipo 1

Kp = G5;
Kv = simplify(G5*s);
Ka = simplify(G5*s^2);

s = 0;
eval(Kp) % Infinito
eval(Kv) % 2.5
eval(Ka) % 0

ess_e = eval(1/(1+Kp))  % 0
ess_r = eval(1/Kv)      % 0.4
ess_p = eval(1/Ka)      % Infinito
