close all; clear all; history -c; clc;
pkg load symbolic;

syms s real;
G10 = (100*(s + 1))/(s^2*(s + 5)*(s + 6)^2)
% Sistema Tipo 2

Kp = G10;
Kv = simplify(G10*s);
Ka = simplify(G10*s^2);

s = 0;
eval(Kp) % Infinito
eval(Kv) % Infinito
eval(Ka) % 0.56

ess_e = eval(1/(1+Kp))  % 0
ess_r = eval(1/Kv)      % 0
ess_p = eval(1/Ka)      % 1.8
