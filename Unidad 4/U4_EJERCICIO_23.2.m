close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G2 = 5/(s + 10);

% Inciso 1:
% Si queremos una respuesta criticamente amortiguada, se tendran dos raices
% reales negativas e iguales, por lo que buscaremos que el LdR coincida con
% el eje x, osea que graficaremos el LdR y veremos este punto:
rlocus(G2)                                          % s21 = -20

% Se verifica que podemos obtener el valor, tanto analíticamente mediante su
% formula, como graficamente mediante el uso del rlocusx()
s21 = -20;
K = 1/abs(5/(s21 + 10))                             % k = 2

rlocusx(G2)                                         % k = 2

% Inciso 2:
% Un sobrepasamiento máximo del 4% corresponde a un cierto valor de psita el
% cual se puede calcular a continuación:
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))    % psita = 0.7156
% Se verifica donde coinciden los valores de psita con el LdR mediante el rlocus
rlocus(G2); sgrid(psita, [20 40 60 80])
% No hay interseccion entre psita y el LdR

% Inciso 3: No es posible
