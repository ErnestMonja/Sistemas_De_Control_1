close all; clear all; history -c; clc;
pkg load symbolic;

syms V Vr I1 I2 s real;    % Variables y Operador
syms R1 R2 L1 L2 C1 real;  % Constantes

% Ejercicio 10.1:
eq1 = V/s == I1*(R1 + s*L1 + 1/(s*C1)) - I2*1/(s*C1);
eq2 =   0 == -I1*1/(s*C1) + I2*(1/(s*C1) + s*L2 + R2);

% Ejercicio 10.2: se pide Vr(s)/V(s)
S = solve(eq1, eq2, I1, I2);
Vr_V = simplify(factor((S.I2)*R2/V, 's'))

% Ejercicio 10.3:
R1 = 100;
R2 = 250;
L1 = 100*10^-3;
L2 = 100*10^-3;
C1 = 1*10^-6;
