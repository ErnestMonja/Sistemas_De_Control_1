close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% s*(s^2 - 1) + k*((s + 2)*(s + 0.5)) = 0
% Luego, se tiene que el denominador sera el termino que no depende de K y el
% numerador sera el termino que si depende de K, por lo tanto se define a:

GH7 = (s + 2)*(s + 0.5)/(s*(s^2 - 1));
rlocusx(GH7)
