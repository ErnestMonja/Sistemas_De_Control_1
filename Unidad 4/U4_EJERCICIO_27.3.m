close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G3 = 125/(s^2 + 33*s + 200);
% Se añade un compensador PI para cancelar el polo dominante:
Ti = 1/8;
PI = (s + 1/Ti)/s;

% Para un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita
% el cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))     % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(minreal(PI*G3)); sgrid(psita, [20 40 60 80])

s1 = -12.5 + j*12.2;
G3PI = minreal(G3*PI);
Kp = 1/abs(125/(s1^2 + 25*s1))                       % Kp = 2.4407
% Verificamos este resultado mediante el rlocusx():
rlocusx(G3*PI)                                       % Kp = 2.44 aprox.
