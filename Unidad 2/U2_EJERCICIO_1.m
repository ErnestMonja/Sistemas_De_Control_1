close all; clear all; history -c; clc;
pkg load symbolic;

syms s R1 R2 C1 C2 real;

% Ejercicio 1.1:
% Vin(s) = I(s)*(R1 + 1/s*C1)
% Vout(s) = I(s)*1/s*C1
% F(s) = (I(s)*1/s*C1)/(I(s)*(R1 + 1/s*C1))
% F(s) = 1/(s*C1*R1 + 1)
G1 = 1/(s*C1*R1 + 1)

% Ejercicio 1.2:
syms Vin Vout I1 I2 real;
X1 = 1/s*C1;
X2 = 1/s*C2;
% eq1 = Vin == I1*(R1 + X1) - I2*X1;
% eq2 =   0 == -I1*X1 + I2*(X1 + R2 + X2);
I1 = I2*(X1 + R2 + X2)/X1;
% eq3 = Vin == I2*(X1 + R2 + X2)/X1*(R1 + X1) - I2*X1;
% Vout = I2*X2
I2 = Vout/X2;
eq4 = Vin == Vout/X2*(X1 + R2 + X2)/X1*(R1 + X1) - Vout/X2*X1;
S = solve(eq4,Vout);
G2 = S/Vin

% Circuito 3
G31 = 1/(s*R1*C1 + 1);
G32 = 1/(s*R2*C2 + 1);
G3 = G31*G32
