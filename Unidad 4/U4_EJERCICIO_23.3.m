close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G3 = 1200/(s^2 + 70*s + 1000);

% Inciso 1:
% Si queremos una respuesta criticamente amortiguada, se tendran dos raices
% reales negativas e iguales, por lo que buscaremos que el LdR coincida con
% el eje x, osea que graficaremos el LdR y veremos este punto:
rlocus(G3)                                          % s31 = -35

% Se verifica que podemos obtener el valor, tanto analíticamente mediante su
% formula, como graficamente mediante el uso del rlocusx()
s31 = -35;
K = 1/abs(1200/(s31^2 + 70*s31 + 1000))             % k = 0.1875

rlocusx(G3)                                         % k = 0.19 aproximadamente

% Inciso 2:
% Un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita el
% cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))    % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(G3); sgrid(psita, [20 40 60 80])

s32 = -35 + j*35.15;
K = 1/abs(1200/(s32^2 + 70*s32 + 1000))              % k = 1.2171
% Verificamos este resultado mediante el rlocusx():
rlocusx(G3)                                          % k = 1.21 aproximadamente

% Inciso 3:
FdTLC3 = feedback(G3*1.2171, 1);
step(FdTLC3)
