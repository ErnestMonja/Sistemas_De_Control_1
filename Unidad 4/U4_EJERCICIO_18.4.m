close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% s^4 + (k + 3)*s^3 + (k + 1)*s^2 + (2*k + 5)*s + 10 = 0
% s^4 + k*s^3 + 3*s^3 + k*s^2 + s^2 + 2*k*s + 5*s + 10 = 0
% s^4 + 3*s^3 + s^2 + 5*s + 10 + k*(s^3 + s^2 + 2*s)= 0
% Luego, se tiene que el denominador sera el termino que no depende de K y el
% numerador sera el termino que si depende de K, por lo tanto se define a:

GH4 = (s^3 + s^2 + 2*s)/(s^4 + 3*s^3 + s^2 + 5*s + 10);
rlocusx(GH4)
