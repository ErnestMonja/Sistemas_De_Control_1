close all; clear all; history -c; clc;
pkg load control;

s = tf("s");

% Inciso C:
EC3 = [1 2.996 3 10.998];
PolosEC3 = roots(EC3);
if all(real(PolosEC3) < 0)
  disp("El Sistema 3 es Estable");
else
  disp("El Sistema 3 es Inestable");
end
