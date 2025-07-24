close all; clear all; history -c; clc;
pkg load control;

s = tf("s");
G7 = (s^2 + 3*s + 8)/(s^5 + 4*s^4 + 8*s^3 + 8*s^2 + 7*s + 4);

% Enciso 1:
PolosG7 = pole(G7)

% Enciso 2:
pzmap(G7)

% Enciso 3:
if all(real(PolosG7)<0)
  disp("El Sistema es Estable");
else
  disp("El Sistema es Inestable");
end

% Enciso 4:
step(G7,80)
