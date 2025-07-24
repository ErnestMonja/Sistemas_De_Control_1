close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% Inciso 1:
G = zpk([-40], [-1 -5], [100]);
H1 = 1;
rlocus(G*H1); sgrid(0.707, [20 40 60 80])

% Inciso 2:
H2 = zpk([], [-20], [1]);
rlocus(G*H2); sgrid(0.707, [20 40 60 80])

% Inciso 3:
% Un sobrepasamiento maximo del 4% equivale a un cierto valor de psita el cual
% calcularemos a continuación
psita = sqrt((log(0.04)^2)/(pi^2 + log(0.04)^2))  % psita = 0.7156

K1 = 0.7;
K2 = 0.05;
step(feedback(K1*G, H1),feedback(K2*G, H2))
