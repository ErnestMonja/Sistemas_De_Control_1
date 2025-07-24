close all; clear all; history -c; clc;
pkg load control;

s = tf("s");
G6 = (s + 8)/(s^4 + s^3 + 2*s^2 + 2*s + 3);

% Enciso 1:
PolosG6 = pole(G6)

% Enciso 2:
pzmap(G6)

% Enciso 3:
if all(real(PolosG6)<0)
  disp("El Sistema es Estable");
else
  disp("El Sistema es Inestable");
end

% Enciso 4:
step(G6)
