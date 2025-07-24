close all; clear all; history -c; clc;
pkg load control;

s = tf("s");
G8 = s/(2*s^5 + s^4 + 2*s^3 + 4*s^2 + s + 6);

% Enciso 1:
PolosG8 = pole(G8)

% Enciso 2:
pzmap(G8)

% Enciso 3:
if all(real(PolosG8)<0)
  disp("El Sistema es Estable");
else
  disp("El Sistema es Inestable");
end

% Enciso 4:
step(G8)
