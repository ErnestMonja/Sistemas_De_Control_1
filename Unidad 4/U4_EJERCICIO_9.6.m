close all; clear all; history -c; clc;
pkg load control;

yss = 2;
ymax = 2.75;
K = yss;

% Se calcula Mp para poder obtener psita:
Mp = (ymax-yss)/yss;
psita = sqrt(log(Mp)^2/(pi^2 + log(Mp)^2)) % psita = 0.2980

% Con el tiempo pico se puede obtener Wn:
Tp = 1.2;
Wn = pi/(Tp*sqrt(1-0.2980^2)) % Wn = 2.7426

% Por ultimo se arma la F(s)
F = tf([K*Wn^2], [1 2*psita*Wn Wn^2])
step(F)
