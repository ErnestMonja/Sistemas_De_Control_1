close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% s^4 + 2*s^3 + 2*s^2 + 2*k*s + 5*k = 0
% s^4 + 2*s^3 + 2*s^2 + k*(2*s + 5) = 0
% Luego, se tiene que el denominador sera el termino que no depende de K y el
% numerador sera el termino que si depende de K, por lo tanto se define a:

GH6 = (2*s + 5)/(s^4 + 2*s^3 + 2*s^2);
rlocusx(GH6)
