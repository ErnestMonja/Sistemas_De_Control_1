close all; clear all; history -c; clc;
pkg load symbolic;

syms s real;
G9 = 10/((1 + s)*(1 + 10*s)*(1 + 20*s))
% G9.inputdelay = -0.2
% Sistema Tipo 0

Kp = G9;
Kv = simplify(G9*s);
Ka = simplify(G9*s^2);

s = 0;
eval(Kp) % 10
eval(Kv) % 0
eval(Ka) % 0

ess_e = eval(1/(1+Kp))  % 0.0909
ess_r = eval(1/Kv)      % Infinito
ess_p = eval(1/Ka)      % Infinito
