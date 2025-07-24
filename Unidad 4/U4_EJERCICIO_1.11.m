close all; clear all; history -c; clc;
pkg load symbolic;

syms s real;
G11 = 1000/(s*(s + 10)*(s + 100))
% Sistema Tipo 1

Kp = G11;
Kv = simplify(G11*s);
Ka = simplify(G11*s^2);

s = 0;
eval(Kp) % Infinito
eval(Kv) % 1
eval(Ka) % 0

ess_e = eval(1/(1+Kp))  % 0
ess_r = eval(1/Kv)      % 1
ess_p = eval(1/Ka)      % Infinito
