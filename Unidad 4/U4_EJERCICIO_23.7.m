close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G7 = 25/((s - 1)*(s + 20));

% Inciso 1:
% Si queremos una respuesta criticamente amortiguada, se tendran dos raices
% reales negativas e iguales, por lo que buscaremos que el LdR coincida con
% el eje x, osea que graficaremos el LdR y veremos este punto:
rlocus(G7)                                            % s71 = -9.5

% Se verifica que podemos obtener el valor, tanto analíticamente mediante su
% formula, como graficamente mediante el uso del rlocusx()
s71 = -9.5;
K = 1/abs(25/((s71 - 1)*(s71 + 20)))                 % k = 4.41

rlocusx(G7)                                          % k = 4.41 aproximadamente

% Inciso 2:
% Un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita el
% cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))     % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(G7); sgrid(psita, [20 40 60 80])

s72 = -9.5 + j*9.27;
K = 1/abs(25/((s72 - 1)*(s72 + 20)))                 % k = 7.8473
% Verificamos este resultado mediante el rlocusx():
rlocusx(G7)                                          % k = 7.85 aproximadamente

% Inciso 3:
FdTLC7 = feedback(G7*7.8473, 1);
step(FdTLC7)
