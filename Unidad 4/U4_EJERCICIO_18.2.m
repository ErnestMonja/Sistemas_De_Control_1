close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% s^3 + s^2 + (k + 2)*s + 3*k = 0
% s^3 + s^2 + 2*s + k*(s + 3) = 0
% Luego, se tiene que el denominador sera el termino que no depende de K y el
% numerador sera el termino que si depende de K, por lo tanto se define a:

GH2 = (s + 3)/(s^3 + s^2 + 2*s);
rlocusx(GH2)
