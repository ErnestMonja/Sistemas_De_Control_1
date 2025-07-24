close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
R = 5.8;
L = 135*10^-6;
Ki = 14,48*10^-3; % Ki = Ka = Kb
J = 1,7*10^-7;
B = 1.136*10^-7; % Se obtiene mediante el TVF

% Expresión deducida del Ejercicio 5.1
F_s = Ki/(J*L*s^2 + s*(B*L + J*R) + Ki*Ki + B*R)
step(F_s,12)


% Ejercicio 7
Tm = (R*J)/(R*B + Ki*Ki);
Wmax = 785.39;
% En el apartado 4, no load speed hace referencia a la maxima
% velocidad angular ya que al no tener carga, su velocidad se
% maximiza, por lo tanto: 7500 rpm = 785.39 rad/s

G1 = (Wmax/12)/(Tm*s + 1)
G2 = (Wmax/12)/(((Tm/2)*s + 1)^2)
