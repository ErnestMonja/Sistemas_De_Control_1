close all; clear all; history -c; clc;
pkg load control;

s = tf("s");
G3 = (50*s - 8)/(s^3 + 11*s^2 + 23*s + 8);

% Enciso 1:
PolosG3 = pole(G3)

% Enciso 2:
pzmap(G3)

% Enciso 3:
if all(real(PolosG3)<0)
  disp("El Sistema es Estable");
else
  disp("El Sistema es Inestable");
end

% Enciso 4:
step(G3)
