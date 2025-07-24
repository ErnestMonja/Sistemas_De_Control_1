close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% Encontraremos primero el cruce entre el LdR y el psita de 0.707 para luego
% utilizar rlocusx() y localizar el valor de K en el punto donde el LdR y el
% psita coincidan. Nótese que estos valores son aproximados

G1 = 100/(s*(s + 5));
rlocus(G1); sgrid(0.707, [20 40 60 80]);           % s = -2.5 +- j2.5
rlocusx(G1);                                       % k = 0.12

G2 = 100*(s^2 + 40*s + 800)/((s + 80)*(s + 50));
rlocus(G2); sgrid(0.707, [20 40 60 80]);           % s = -20 +- j20
rlocusx(G2);                                       % k = 10.71

G3 = 100/((s + 80)*(s + 50)*(s - 10));
rlocus(G3); sgrid(0.707, [20 40 60 80]);           % s = -12.5 +- j12.5
rlocusx(G3);                                       % k = 700

G4 = 100*(s + 40)/((s + 5)*(s^2 + 20*s + 1700));
rlocus(G4); sgrid(0.707, [20 40 60 80]);           % No hay interseccion
rlocusx(G4);

G5 = 100*(s + 40)/((s - 5)*(s^2 + 20*s + 1700));
rlocus(G5); sgrid(0.707, [20 40 60 80]);           % s = 0
rlocusx(G5);                                       % k = 2.13

G6 = 100*(s - 40)/((s + 25)*(s^2 + 20*s + 1700));
rlocus(G6); sgrid(0.707, [20 40 60 80]);           % s = 0
rlocusx(G6);                                       % k = 10.64
