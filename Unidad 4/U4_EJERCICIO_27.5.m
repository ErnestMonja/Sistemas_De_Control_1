close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G5 = 20*(s + 60)/((s + 10)*(s + 20));
% Se añade un compensador PI para cancelar el polo dominante:
Ti = 1/10;
PI = (s + 1/Ti)/s;

% Para un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita
% el cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))     % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(minreal(PI*G5)); sgrid(psita, [20 40 60 80])

s1 = -48.8 + j*47.7;
G5PI = minreal(G5*PI)
Kp = 1/abs((20*s1 + 1200)/(s1^2 + 20*s1))            % Kp = 3.8802
% Verificamos este resultado mediante el rlocusx():
rlocusx(G5*PI)                                       % Kp = 3.89 aprox.
