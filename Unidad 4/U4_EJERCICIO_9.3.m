close all; clear all; history -c; clc;
pkg load control;

yss = 1;
ymax = 1.1;
K = yss;

% Se calcula Mp para poder obtener psita:
Mp = (ymax-yss)/yss;
psita = sqrt(log(Mp)^2/(pi^2 + log(Mp)^2)) % psita = 0.5912

% Con el tiempo pico se puede obtener Wn:
Td = 0.05;
Tp = 0.15 - Td;
Wn = pi/(Tp*sqrt(1-0.5912^2)) % Wn = 38.952

% Por ultimo se arma la F(s)
F = tf([K*Wn^2], [1 2*psita*Wn Wn^2]) %F.inputdelay = Td;
step(F)
