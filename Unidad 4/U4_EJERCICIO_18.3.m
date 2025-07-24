close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% s^3 + 5*k*s^2 + 10 = 0
% s^3 + 10 + k*(5*s^2) = 0
% Luego, se tiene que el denominador sera el termino que no depende de K y el
% numerador sera el termino que si depende de K, por lo tanto se define a:

GH3 = (5*s^2)/(s^3 + 10);
rlocusx(GH3)
