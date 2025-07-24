close all; clear all; history -c; clc;
pkg load control;

yss = 1;
ymax = 1.05;
K = yss;

% Se calcula Mp para poder obtener psita:
Mp = (ymax-yss)/yss;
psita = sqrt(log(Mp)^2/(pi^2 + log(Mp)^2)) % psita = 0.6901

% Con el tiempo pico se puede obtener Wn:
Tp = 15;
Wn = pi/(Tp*sqrt(1-0.6901^2)) % Wn = 0.2894

% Por ultimo se arma la F(s)
F = tf([K*Wn^2], [1 2*psita*Wn Wn^2])
step(F)
