close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G4 = 12*(s + 10)/(s*(s + 30));

% Inciso 1:
% Si queremos una respuesta criticamente amortiguada, se tendran dos raices
% reales negativas e iguales, por lo que buscaremos que el LdR coincida con
% el eje x, osea que graficaremos el LdR y veremos este punto:
rlocus(G4)                                          % s41 = -80

% Se verifica que podemos obtener el valor, tanto analíticamente mediante su
% formula, como graficamente mediante el uso del rlocusx()
s41 = -80;
K = 1/abs(12*(s41 + 10)/(s41*(s41 + 30)))           % k = 4.7619

rlocusx(G4)                                         % k = 4.76 aproximadamente

% Inciso 2:
% Un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita el
% cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))    % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(G4); sgrid(psita, [20 40 60 80])

s42 = 0;
K = 1/abs(12*(s42 + 10)/(s42*(s42 + 30)))            % k = 0
% Verificamos este resultado mediante el rlocusx():
rlocusx(G4)                                          % k = 0

% Inciso 3:
FdTLC4 = feedback(G4*4.7619, 1);
step(FdTLC4)
