close all; clear all; history -c; clc;
pkg load symbolic;

syms s K real;
G6 = K/((1 + s)*(1 + 10*s)*(1 + 20*s))
% Sistema Tipo 0

Kp = G6;
Kv = simplify(G6*s);
Ka = simplify(G6*s^2);

s = 0;
eval(Kp) % K
eval(Kv) % 0
eval(Ka) % 0

ess_e = eval(1/(1+Kp))  % 1/(1 + K)
ess_r = eval(1/Kv)      % Infinito
ess_p = eval(1/Ka)      % Infinito
