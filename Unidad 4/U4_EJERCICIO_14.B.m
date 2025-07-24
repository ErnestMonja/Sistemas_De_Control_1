close all; clear all; history -c; clc;
pkg load simbolic;

syms s k real;

% Inciso B:
% s^3 + 11*s^2 + 10^s + k = 0
% Aplicando Routh-Hurwitz:
% 1     10
% 11    k
% x1    x2
% y1

x1 = (11*10 - 1*k)/11             % x1 = 10 - k/11
x2 = (11*0 - 1*0)/11              % x2 = 0

y1 = simplify((x1*k - 11*x2)/x1)  % y1 = k

% Se tiene que de la expresion de x1 e y1 que:
% 10 - k/11 > 0  ====>  0 < k < 100
disp("El Sistema 2 es Estable para: 0 < k < 100")
