close all; clear all; history -c; clc;
pkg load symbolic;

syms s k real;
% Para determinar la estabilidad del sistema es necesario estudiar su ecuación
% característica, por lo tanto necesitamos la función de transferencia de lazo
% cerrado, la cual es:
G = 1/(s + 1)^3;
FdTLC = collect(simplify(k*G/(1 + k*G)), 's')
% Se obtuvo que FdTLC = k/(k + (s+1)^3) = k/(s^3 + 3*s^2 + 3*s + 1 + k)
% Por lo que se puede plantear Routh-Hurwitz con la ecuación característica
% siendo esta igual a: s^3 + 3*s^2 + 3*s + 1 + k = 0
%   1      3
%   3   (1 + k)
%   x1
%   y1

x1 = (3*3 - 1*(1 + k))/3;      % x1 = (8-k)/3
y1 = (x1*(1 + k) - 3*0)/x1;    % y1 = 1 + k

% Se verifica entonces que de la expresión de x1, que 8/3 - k/3 > 0 => k < 8 y
% al ser una ganancia, no tiene sentido que esta sea menor a 0, por lo que el
% rango de estabilidad del sistema es el siguiente:
disp("El sistema es estable para todo k que cumpla que: 0 < k < 8")
