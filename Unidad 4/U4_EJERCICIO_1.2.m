close all; clear all; history -c; clc;
pkg load symbolic;

syms s real;
G2 = 2/(s*(1+0.1*s)*(1+0.5*s))
% Sistema Tipo 1

Kp = G2;
Kv = simplify(G2*s);
Ka = simplify(G2*s^2);

s = 0;
eval(Kp) % Infinito
eval(Kv) % 2
eval(Ka) % 0

ess_e = eval(1/(1+Kp))  % 0
ess_r = eval(1/Kv)      % 0.5
ess_p = eval(1/Ka)      % Infinito
