close all; clear all; history -c; clc;
pkg load control;

s = tf("s");
G9 = 54/(s^3 + 13*s^2 + 55*s + 75);

% Enciso 1:
PolosG9 = pole(G9)

% Enciso 2:
pzmap(G9)

% Enciso 3:
if all(real(PolosG9)<0)
  disp("El Sistema es Estable");
else
  disp("El Sistema es Inestable");
end

% Enciso 4:
step(G9)
