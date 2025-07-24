close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% s^3 + 3*s^2 + (k + 2)*s + 5*k = 0
% s^3 + 3*s^2 + 2*s + k*(s + 5) = 0
% Luego, se tiene que el denominador sera el termino que no depende de K y el
% numerador sera el termino que si depende de K, por lo tanto se define a:

GH1 = (s + 5)/(s^3 + 3*s^2 + 2*s);
rlocusx(GH1)
