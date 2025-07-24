close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G2 = 0.8/((0.1*s + 1)*(0.05*s + 1));
% Se añade un compensador PI para cancelar el polo dominante:
Ti = 1/10;
PI = (s + 1/Ti)/s;

% Para un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita
% el cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))     % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(minreal(PI*G2)); sgrid(psita, [20 40 60 80])

s1 = -10 + j*9.76;
G2PI = minreal(G2*PI)
Kp = 1/abs(160/(s1^2 + 20*s1))                          % Kp = 1.2204
% Verificamos este resultado mediante el rlocusx():
rlocusx(G2*PI)                                          % Kp = 1.22 aprox.
