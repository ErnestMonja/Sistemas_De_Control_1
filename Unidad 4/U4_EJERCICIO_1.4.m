close all; clear all; history -c; clc;
pkg load symbolic;

syms s real;
G4 = (30*(1+2*s)*(1+4*s))/(s*(s^2 + 2*s + 10))
% Sistema Tipo 1

Kp = G4;
Kv = simplify(G4*s);
Ka = simplify(G4*s^2);

s = 0;
eval(Kp) % Infinito
eval(Kv) % 3
eval(Ka) % 0

ess_e = eval(1/(1+Kp))  % 0
ess_r = eval(1/Kv)      % 0.33
ess_p = eval(1/Ka)      % Infinito
