close all; clear all; history -c; clc;
pkg load symbolic;

syms s real;
G8 = (10*(s+1))/(s^3*(s^2 + 5*s + 5))
% Sistema Tipo 3

Kp = G8;
Kv = simplify(G8*s);
Ka = simplify(G8*s^2);

s = 0;
eval(Kp) % Infinito
eval(Kv) % Infinito
eval(Ka) % Infinito

ess_e = eval(1/(1+Kp))  % 0
ess_r = eval(1/Kv)      % 0
ess_p = eval(1/Ka)      % 0
