close all; clear all; history -c; clc;
pkg load symbolic;

syms X1 X2 U s real;       % Variables y operador
syms M1 M2 K1 K2 B real;   % Constantes

eq1 = M1*X1*s^2 == B*s*(U - X1) + K1*(U - X1) + K2*(X2 - X1);
eq2 = M2*X2*s^2 == K2*(X1 - X2);

S = solve(eq1, eq2, X1, X2);
X1_U = simplify(factor(S.X1/U, 's'))
X2_U = simplify(factor(S.X2/U, 's'))
