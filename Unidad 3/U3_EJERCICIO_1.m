close all; clear all; history -c; clc;
pkg load control;

% Ejercicio 1.1
% 5DDy + 2Dy + 3y = 5Dx + x
% 5s^2Y(s) + 2sY(s) + 3Y(s) = 5sX(s) + X(s)
% Y(s)[5s^2 + 2s + 3] = X(s)[5s + 1]
% Y(s)/X(s) = (5s + 1)/(5s^2 + 2s + 3)

s = tf('s');
Ys_Xs = (5*s + 1)/(5*s^2 + 2*s + 3)

% Ejercicio 1.2
p = pole(Ys_Xs);
if(real(p)<0)
    disp("Sistema Estable")
else
    disp("Sistema Inestable")
endif

% Ejercicio 1.3
step(Ys_Xs, 50)
