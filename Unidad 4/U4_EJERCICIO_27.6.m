close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G6 = (800*s + 32000)/(s^3 + 330*s^2 + 29000*s + 600000);
% Se añade un compensador PI para cancelar el polo dominante:
Ti = 1/30;
PI = (s + 1/Ti)/s;

% Para un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita
% el cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))     % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(minreal(PI*G6)); sgrid(psita, [20 40 60 80])

s1 = -137 + j*133.7;
G6PI = minreal(G6*PI)
Kp = 1/abs((800*s1 + 3.2e+04)/(s1^3 + 300*s1^2 + 2e+04*s1))  % Kp = 29.702
% Verificamos este resultado mediante el rlocusx():
rlocusx(G6*PI)                                               % Kp = 29.7 aprox.
