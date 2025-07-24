close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G1 = 10/((s + 10)*(s + 100));
% Se añade un compensador PI para cancelar el polo dominante:
Ti = 1/10;
PI = (s + 1/Ti)/s;

% Para un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita
% el cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))     % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(minreal(PI*G1)); sgrid(psita, [20 40 60 80])

s1 = -50 + j*48.8;
Kp = 1/abs( (s1 + 1/Ti)/s1 * 10/((s1 + 10)*(s1 + 100)) )   % Kp = 488.14
% Verificamos este resultado mediante el rlocusx():
rlocusx(G1*PI)                                             % Kp = 488 aprox.
