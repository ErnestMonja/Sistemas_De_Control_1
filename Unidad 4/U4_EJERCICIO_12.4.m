close all; clear all; history -c; clc;
pkg load control;

s = tf("s");
G4 = (50*s + 8)/(s^3 + 23*s + 8);

% Enciso 1:
PolosG4 = pole(G4)

% Enciso 2:
pzmap(G4)

% Enciso 3:
if all(real(PolosG4)<0)
  disp("El Sistema es Estable");
else
  disp("El Sistema es Inestable");
end

% Enciso 4:
step(G4)
