close all; clear all; history -c; clc;
pkg load symbolic;
syms R1 R2 R3 C1 C2 C3 s real;

% Circuito 1:
F1 = 1/(s*R1*C1 + 1);
F2 = 1/(s*R2*C2 + 1);
F3 = 1/(s*R3*C3 + 1);
FdST = F1*F2*F3

% Circuito 2:
syms I1 I2 I3 Vin Vout real;
XC1 = 1/(s*C1);
XC2 = 1/(s*C2);
XC3 = 1/(s*C3);

eq1 = Vin == I1*(R1 + XC1) - I2*XC1;
eq2 =   0 == -I1*XC1 + I2*(XC1 + R2 + XC2) - I3*XC2;
eq3 =   0 == -I2*XC2 + I3*(XC2 + R3 + XC3);

S1 = solve(eq3, I2); % I2 = I3*(C2*R3*s + C2/C3 + 1)
S2 = solve(eq2, I1); % I1 = I2*(C1*R2*s + C1/C2 + 1) - C1*I3
                     % I1 = I3*((C2*R3*s + C2/C3 + 1)*(C1*R2*s + C1/C2 + 1) - C1)
eq4 = Vin == (I3*((C2*R3*s + C2/C3 + 1)*(C1*R2*s + C1/C2 + 1) - C1))*(R1 + XC1) - I3*(C2*R3*s + C2/C3 + 1)*XC1;
S = solve(eq4 , I3);
Vout = S*XC3;
FdST = pretty(simplify(Vout/Vin))
