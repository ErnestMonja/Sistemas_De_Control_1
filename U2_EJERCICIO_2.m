close all; clear all; clc; history -c;
pkg load control;

% Sistema 1:
G1 = zpk([-1], [-10, -100], 53);
G2 = zpk([], [0], 1);
Kp = 31;
Kd = 16;

FdS1 = feedback(G1, Kd);
FdS2 = Kp*FdS1*G2;
FdST = feedback(FdS2, 1)

% Sistema 2:
G1 = zpk([], [-200], 27);
G2 = zpk([], [-0.1], 5);
PI = zpk([-0.1], [0], 1);
P = 12;

FdS1 = feedback(G1*P, 1);
FdS2 = PI*FdS1*G2;
FdST = feedback(FdS2,1)

% Sistema 3:
pkg load symbolic;
syms Ti Td Kp Wn Ps s real;
G1 = (Ti*Td*s^2 + Ti*s + 1)/(Ti*s);
G2 = (Wn^2)/(s^2 + 2*Ps*Wn*s + Wn^2);

GT = G1*G2*Kp;
FdS = GT/(1 + GT);
FdST = factor(FdS)

% Sistema 4:
pkg load symbolic;
syms Ti Td Kp Wn K T s real;
G1 = K/(T*s + 1);

Gadd = 1 + 1/(Ti*s) + Td*s;
F1 = Gadd*Kp*G1;
FdS = F1/(1 + F1);
FdST = factor(simplify(FdS))
