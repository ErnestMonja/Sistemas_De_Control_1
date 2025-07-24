close all; clear all; history -c; clc;
pkg load symbolic;

syms s K Kt real;

% Ejercicio 3:
G1 = 100/(0.2*s + 1);
G2 = 1/(20*s);
FdSLC1 = factor(G1/(1+G1*Kt), 's');
FdST = factor(K*FdSLC1*G2, 's');
pretty(FdST)
% Sistema tipo 1

Kp = FdST;
Kv = FdST*s;
Ka = FdST*s^2;

s = 0;
eval(Kp) % 200*K
eval(Kv) % 25*K/(500*Kt + 5)
eval(Ka) % 0

ess_escalon = eval(1/(1+Kp))  % 1/(1+200*K)
ess_rampa = eval(1/Kv)      % (500*Kt + 5)/(25*K)
ess_parabola = eval(1/Ka)      % 200*(500*Kt + 5)

%Ejercicio 4:
disp("Error para Kt = 5 y K = 50:")
Kt = 5;
K = 50;
ess_rampa = eval(1/Kv)
