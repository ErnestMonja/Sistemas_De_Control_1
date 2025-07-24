close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G4 = 1.24/(s + 1)^3;
% Se añade un compensador PI para cancelar el polo dominante:
Ti = 1/1;
PI = (s + 1/Ti)/s;

% Para un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita
% el cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))     % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(minreal(PI*G4)); sgrid(psita, [20 40 60 80])

s1 = -0.294 + j*0.287;
G4PI = minreal(G4*PI)
Kp = 1/abs(1.24/(s1^3 + 2*s1^2 + s1))                % Kp = 0.1924
% Verificamos este resultado mediante el rlocusx():
rlocusx(G4*PI)                                       % Kp = 0.19 aprox.
