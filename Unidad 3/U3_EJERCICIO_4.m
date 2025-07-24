close all; clear all; history -c; clc;
pkg load symbolic;

syms Xa Xs W real;            % Variables y Operador
syms Ma Ms Ba Kr Kc s real;   % Constantes

% Ejercicio 4.1 y 4.2: Se encuentra hecho en la guía

% Ejercicio 4.3: Se pide Xa(s)/W(s)
eq1 =  Ma*Xa*s^2 == Ba*s*(Xs - Xa) + Kr*(Xs - Xa);
eq2 =  Ms*Xs*s^2 == Ba*s*(Xa - Xs) + Kr*(Xa - Xs) + Kc*(W - Xs);

S = solve(eq1, eq2, Xa, W);
Xa_W = simplify(factor(S.Xa/S.W, s, 's'))

% Ejercicio 4.4:
Ma = 500;
Ms = 50;
Kr = 10;
Kc = 50;
Ba = 80;
Xa_W_Simb = tf(Kc*[Ba Kr],[Ma*Ms Ba*Ma+Ba*Ms Ma*(Kc+Kr)+Kr*Ms Ba*Kc Kc*Kr])
step(Xa_W_Simb)
