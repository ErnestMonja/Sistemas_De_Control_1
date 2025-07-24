close all; clear all; history -c; clc;
pkg load control;

yss = 1;
ymax = 1.3;
K = yss;

% Se calcula Mp para poder obtener psita:
Mp = (ymax-yss)/yss;
psita = sqrt(log(Mp)^2/(pi^2 + log(Mp)^2)) % psita = 0.3579

% Con el tiempo pico se puede obtener Wn:
Tp = 0.1;
Wn = pi/(Tp*sqrt(1-0.3579^2)) % Wn = 33.645

% Por ultimo se arma la F(s)
F = tf([K*Wn^2], [1 2*psita*Wn Wn^2])
step(F)
