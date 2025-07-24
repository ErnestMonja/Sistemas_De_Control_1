close all; clear all; history -c; clc;
pkg load control;

s = tf("s");

% Inciso D:
EC4 = [2 2 3 1 3 2 1];
PolosEC4 = roots(EC4);
if all(real(PolosEC4) < 0)
  disp("El Sistema 4 es Estable");
else
  disp("El Sistema 4 es Inestable");
end
