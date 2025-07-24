close all; clear all; history -c; clc;
pkg load symbolic;

syms s real;
G1 = 50/((1+0.5*s)*(1+2*s))
% Sistema Tipo 0

Kp = G1;
Kv = simplify(G1*s);
Ka = simplify(G1*s^2);

s = 0;
eval(Kp) % 50
eval(Kv) % 0
eval(Ka) % 0

ess_e = eval(1/(1+Kp))  % 0.019608
ess_r = eval(1/Kv)      % Infinito
ess_p = eval(1/Ka)      % Infinito
