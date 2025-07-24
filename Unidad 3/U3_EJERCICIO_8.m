close all; clear all; history -c; clc;
pkg load symbolic;
pkg load control;

syms O X F s;       % Variables y Operador
syms I m l g M b;   % Constantes

eq1 =  O*(I + m*l)*s^2 == m*l*(g*O + X*s^2);
eq2 =   X*(M + m)*s^2 == F - b*X*s + m*l*O*s^2;

% Ejercicio 8.1:
S1 = solve(eq1, X);
S2 = solve(eq2, X);
eq3 = S1 == S2;
S3 = solve(eq3, O);
F_S = simplify(factor(S3/F, s))

% Ejercicio 8.2:
p = pole(F_S);
if(real(p)<0)
    disp("Sistema Estable")
else
    disp("Sistema Inestable")
endif
