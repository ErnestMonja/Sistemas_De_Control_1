close all; clear all; history -c; clc;
pkg load symbolic;

syms V I Wm s real;           % Variables y Operador
syms Ra La Kb Ki Jm Bm real;  % Constantes

eq1 =       V == Ra*I + La*s*I + Kb*Wm;
eq2 = Jm*s*Wm == Ki*I - Bm*Wm;

% Ejercicio 5.2: Se pide Wm(s)/V(s) con Tl(s) = 0
S = solve(eq1, eq2, Wm, V);
Wm_V = simplify(factor(S.Wm/S.V, 's'))

% Ejercicio 5.3: Se pide Om(s)/V(s) con Tl(s) = 0
% Notese que Wm(s)= s*Om(s) por ser derivadas, entonces:
Om_V = Wm_V/s

% Ejercicio 5.4: Se pide Tm(s)/V(s) con Tl(s) = 0
% se tiene que Wm(s)= Tm(s)/(Jm*s + Bm)
Tm_V = Wm_V*(Jm*s + Bm)
