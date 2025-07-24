close all; clear all; history -c; clc;
pkg load control;

s = tf("s");
G2 = (50*s + 8)/(s^3 + 11*s^2 + 23*s + 8);

% Enciso 1:
PolosG2 = pole(G2)

% Enciso 2:
pzmap(G2)

% Enciso 3:
if all(real(PolosG2)<0)
  disp("El Sistema es Estable");
else
  disp("El Sistema es Inestable");
end

% Enciso 4:
step(G2)
