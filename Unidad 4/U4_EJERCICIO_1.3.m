close all; clear all; history -c; clc;
pkg load symbolic;

syms s real;
G3 = 1/(s*(s^2 + 4*s + 200))
% Sistema Tipo 1

Kp = G3;
Kv = simplify(G3*s);
Ka = simplify(G3*s^2);

s = 0;
eval(Kp) % Infinito
eval(Kv) % 5*10^-3
eval(Ka) % 0

ess_e = eval(1/(1+Kp))  % 0
ess_r = eval(1/Kv)      % 200
ess_p = eval(1/Ka)      % Infinito
