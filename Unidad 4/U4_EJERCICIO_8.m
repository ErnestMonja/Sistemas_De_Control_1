close all; clear all; history -c; clc;
pkg load control;

yss = 2;
ymax = 2.45;
K = yss;

% Se calcula Mp para poder obtener psita:
Mp = (ymax-yss)/yss;
psita = sqrt(log(Mp)^2/(pi^2 + log(Mp)^2)) % psita = 0.4289

% Con el tiempo pico se puede obtener Wn:
Td = 0.5*10^-3;
Tp = 1.5*10^-3;
Wn = pi/(Tp*sqrt(1-0.4289^2)) % Wn = 3477.7

% Por ultimo se arma la F(s)
F = tf([K*Wn^2], [1 2*psita*Wn Wn^2]) %F.inputdelay = Td;
step(F)
