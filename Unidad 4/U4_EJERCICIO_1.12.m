close all; clear all; history -c; clc;
pkg load symbolic;

syms s real;
G12 = (3*s)/(s^2*(s + 6))
% Sistema Tipo 1

Kp = G12;
Kv = simplify(G12*s);
Ka = simplify(G12*s^2);

s = 0;
eval(Kp) % Infinito
eval(Kv) % 0.5
eval(Ka) % 0

ess_e = eval(1/(1+Kp))  % 0
ess_r = eval(1/Kv)      % 2
ess_p = eval(1/Ka)      % Infinito
