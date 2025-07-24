close all; clear all; history -c; clc;
pkg load symbolic;

syms O Tm V I s;              % Variables y Operador
syms M C G R L Kb J Ka B;    % Constantes

eq1 =  M*O*s^2 + C*O*s + G*O == Tm;
eq2 =  V == R*I + L*I*s + Kb*O*s;
eq3 =  J*O*s^2 == Ka*I - B*O*s;
I = Tm/Ka;

S1 = solve(eq1, O);
O_Tm = S1/Tm;

S3 = solve(eq3, O);
eq2p =  V == R*I + L*I*s + Kb*S3*s;
S2 = factor(solve(eq2p, Tm), V);
Tm_V = S2/V;

F_S = factor(O_Tm*Tm_V, s)
