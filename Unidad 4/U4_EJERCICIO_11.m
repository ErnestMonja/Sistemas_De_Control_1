close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% Ejercicio 11.1:
EC1 = [1 2.996 3 10.998];
PolosEC1 = roots(EC1);
if all(real(PolosEC1) < 0)
  disp("El Sistema 1 es Estable");
else
  disp("El Sistema 1 es Inestable");
end

% Ejercicio 11.2:
% 2*(s + 1)*(s + 1) = 2*(s^2 + s + s + 1) = 2*s^2 + 2*s + 2
EC2 = [2 2 2]
PolosEC2 = roots(EC2);
if all(real(PolosEC2) < 0)
  disp("El Sistema 2 es Estable");
else
  disp("El Sistema 2 es Inestable");
end

% Ejercicio 11.3:
% EC3 = 3*s^2 + (2 + k)*s + 1;
% Aplicando el criterio de Routh-Hurwitz se tiene que:
%   3      1
% (2+k)    0
%   x
% De aquí se calcula x como: x = ((2 + k)*1 - 3*0)/(2 + k) = 1
% Por lo tanto para que el sistema sea estable, según Routh-Hurwitz
% se tiene que dar que: (2 + k) > 0, esto es: k > -2
