close all; clear all; history -c; clc;
pkg load control;

s = tf("s");
G5 = (s - 4)/(s^5 + s^4 + 3*s^3 + 9*s^2 + 16*s + 10);

% Enciso 1:
PolosG5 = pole(G5)

% Enciso 2:
pzmap(G5)

% Enciso 3:
if all(real(PolosG5)<0)
  disp("El Sistema es Estable");
else
  disp("El Sistema es Inestable");
end

% Enciso 4:
step(G5)
