close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% s^4 + 6*s^3 + 9*s^2 + k*(s^2 + 4*s + 5) = 0
% Luego, se tiene que el denominador sera el termino que no depende de K y el
% numerador sera el termino que si depende de K, por lo tanto se define a:

GH5 = (s^2 + 4*s + 5)/(s^4 + 6*s^3 + 9*s^2);
rlocusx(GH5)
