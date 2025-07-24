close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G1 = 20/((s + 10)*(s + 100));

% Inciso 1:
% Si queremos una respuesta criticamente amortiguada, se tendran dos raices
% reales negativas e iguales, por lo que buscaremos que el LdR coincida con
% el eje x, osea que graficaremos el LdR y veremos este punto:
rlocus(G1)                                          % s11 = -55

% Se verifica que podemos obtener el valor, tanto analíticamente mediante su
% formula, como graficamente mediante el uso del rlocusx()
s11 = -55;
K = 1/abs(20/((s11 + 10)*(s1 + 100)))               % k = 101.25

rlocusx(G1)                                         % k = 101.25

% Inciso 2:
% Un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita el
% cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))    % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(G1); sgrid(psita, [20 40 60 80])

s12 = -55 + j*53.68;
K = 1/abs(20/((s12 + 10)*(s12 + 100)))              % k = 245.33
% Verificamos este resultado mediante el rlocusx():
rlocusx(G1)                                         % k = 252 aproximadamente

% Inciso 3:
FdTLC1 = feedback(G1*245.33,1);
step(FdTLC1)
