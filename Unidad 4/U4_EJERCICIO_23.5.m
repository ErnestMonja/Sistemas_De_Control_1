close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G5 = 0.75/((s + 1)^3);

% Inciso 1:
% Si queremos una respuesta criticamente amortiguada, se tendran dos raices
% reales negativas e iguales, por lo que buscaremos que el LdR coincida con
% el eje x, osea que graficaremos el LdR y veremos este punto:
rlocusx(G5)

% Se observa que dos de las tres ramas no se encuentran sobre el eje x para
% ningun K, por lo tanto no hay criterio para poder elegir un punto de trabajo
% que satisfaga la condicion de respuesta criticamente amortiguada.

% Inciso 2:
% Un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita el
% cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))    % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(G5); sgrid(psita, [20 40 60 80])

s52 = 0.64 + j+0.64;
k = 1/abs(12*(s52 + 10)/(s52*(s52 + 30)))            % k = 0.3741

% Inciso 3:
FdTLC5 = feedback(G5*0.3741, 1);
step(FdTLC5)
