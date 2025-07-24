close all; clear all; history -c; clc;
pkg load symbolic;

syms s k real;

% Inciso G:
% 6*s^4 + s^3 + 3*s^2 + k*s + 1 + k = 0
% Aplicando Routh-Hurwitz:
%  6    3   (1 + k)
%  1    k      0
%  x1   x2
%  y1   y2
%  z1

x1 = (1*3 - 6*k)/1;                 % x1 = 3 - 6*k
x2 = (1*(1 + k) - 6*0)/1;           % x2 = 1 + k

y1 = simplify((x1*k - 1*x2)/x1);    % y1 = (6*k^2 - 2*k + 1)/(6*k - 3)
y2 = (x1*0 - 1*0)/x1;               % y2 = 0

z1 = simplify((y1*x2 - x1*y2)/y1);  % z1 = 1 + k

% Si miramos el criterio de estabilidad para x1, se tiene que: 3 - 6*k > 0 =>
% k > 0,5. Luego para y1, se puede graficar esta funcion de k y se observa que
% y1 es positiva para k > - 0,5. Por ultimo se tiene que mirando a z1, k > -1
% para que z1 sea positiva, por lo tanto el sistema es estable para todo k mayor
% a 0,5 de modo que se cumplan las 3 condiciones.
disp("El Sistema 7 es Estable para todo k > 0,5")
