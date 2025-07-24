close all; clear all; history -c; clc;
pkg load symbolic;

syms s K real;
G7 = (10*(s + 1))/(s^2 *(s + 5)*(s + 6))
% Sistema Tipo 2

Kp = G7;
Kv = simplify(G7*s);
Ka = simplify(G7*s^2);

s = 0;
eval(Kp) % Infiinito
eval(Kv) % Infiinito
eval(Ka) % 0.33

ess_e = eval(1/(1+Kp))  % 0
ess_r = eval(1/Kv)      % 0
ess_p = eval(1/Ka)      % 3
