close all; clear all; history -c; clc;
pkg load control;

s = tf("s");

% Inciso A:
% 2*(s + 1)*(s + 1) = 2*(s^2 + s + s + 1) = 2*s^2 + 2*s + 2
EC1 = [2 2 2];
PolosEC1 = roots(EC1);
if all(real(PolosEC1) < 0)
  disp("El Sistema 1 es Estable");
else
  disp("El Sistema 1 es Inestable");
end
