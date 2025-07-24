close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G6 = 150*(s + 10)*(s + 20)/(s*(s + 5));

% Inciso 1:
% Si queremos una respuesta criticamente amortiguada, se tendran dos raices
% reales negativas e iguales, por lo que buscaremos que el LdR coincida con
% el eje x, osea que graficaremos el LdR y veremos este punto:
rlocus(G6)                                            % s61 = -12.9

% Se verifica que podemos obtener el valor, tanto analíticamente mediante su
% formula, como graficamente mediante el uso del rlocusx()
s61 = -12.9;
K = 1/abs(150*(s61 + 10)*(s61 + 20)/(s61*(s61 + 5))) % k = 0.032997

rlocusx(G6)                                          % k = 0.03 aproximadamente

% Inciso 2:
% Un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita el
% cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))     % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(G6); sgrid(psita, [20 40 60 80])
% No hay interseccion entre psita y el LdR

% Inciso 3: No es posible
