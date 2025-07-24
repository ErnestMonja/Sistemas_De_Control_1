close all; clear all; history -c; clc;
pkg load symbolic;

syms s k real;

% Inciso F:
% s^5 + s^4 + s^3 + 3*s^2 + (2 + k)*s + 1 = 0
% Aplicando Routh-Hurwitz:
%  1    1   (2 + k)
%  1    3      1
%  x1   x2
%  y1   y2
%  z1

x1 = (1*1 - 1*3)/1;                 % x1 = -2
x2 = (1*(2 + k) - 1*1)/1;           % x2 = k + 1

y1 = (x1*3 - 1*x2)/x1;              % y1 = (k+7)/2
y2 = (x1*1 - 1*0)/x1;               % y2 = 1

z1 = simplify((y1*x2 - x1*y2)/y1);  % z1 = ((k + 1)*(k + 7) + 4)/(k + 7)

% Se tiene que el sistema es inestable para todo valor de k, ya que x1<0
disp("El Sistema 6 es Inestable para todo valor de k")
