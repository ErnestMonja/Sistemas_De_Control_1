close all; clear all; history -c; clc;
pkg load control;

s = tf("s");

% Inciso E:
EC5 = [1 3 -2 7 12];
PolosEC5 = roots(EC5);
if all(real(PolosEC5) < 0)
  disp("El Sistema 5 es Estable");
else
  disp("El Sistema 5 es Inestable");
end
