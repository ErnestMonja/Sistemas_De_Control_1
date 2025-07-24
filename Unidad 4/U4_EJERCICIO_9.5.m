close all; clear all; history -c; clc;
pkg load control;

yss = 0.7;
ymax = 0.75;
K = yss;

% Se calcula Mp para poder obtener psita:
Mp = (ymax-yss)/yss;
psita = sqrt(log(Mp)^2/(pi^2 + log(Mp)^2)) % psita = 0.6432

% Con el tiempo pico se puede obtener Wn:
Tp = 10;
Wn = pi/(Tp*sqrt(1-0.6432^2)) % Wn = 0.4103

% Por ultimo se arma la F(s)
F = tf([K*Wn^2], [1 2*psita*Wn Wn^2])
step(F)
