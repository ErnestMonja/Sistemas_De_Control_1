close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% Encontraremos primero el cruce entre el LdR y el psita de 0.66 para luego
% utilizar rlocusx() y localizar el valor de K en el punto donde el LdR y el
% psita coincidan. Nótese que estos valores son aproximados

G = 1/(s^3 + 4*s^2 + 5*s);
rlocus(G); sgrid(0.66, [20 40 60 80]);           % s = -0.74 +- j0.845

% Método Analítico:
s1 = -0.74 + j*0.845;
K = 1/abs(1/(s1^3 + 4*s1^2 + 5*s1))              % k = 3.1858

% Método Gráfico:
rlocusx(G);                                      % k = 3.17
