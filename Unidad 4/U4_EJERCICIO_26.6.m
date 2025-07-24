close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G6 = (800*s + 32000)/(s^3 + 330*s^2 + 29000*s + 600000);
pole(G6)    % Se tiene que los polos estan en -30, -100 y -200

% Requerimientos: ess = 0 ; Ts minimo ; Mp = 0 (respuesta criticamente amort.)
% Se utiliza un compensador PI para cancelar el polo dominante, esto es:
Ti = 1/30;
PI = (s + 1/Ti)/s;
FdTLA = PI*G6;
rlocus(FdTLA)
% Para una respuesta criticamente amortiguada, se elige un punto donde las
% raices sean reales, negativas e iguales, por lo que segun el rlocus, este
% punto es:
s1 = -146.82;
G6PI = minreal(G6*PI)
Kp = 1/abs((800*s1 + 3.2e+04)/(s1^3 + 300*s1^2 + 2e+04*s1))  % Kp = 4.2778
rlocusx(FdTLA)                                               % Kp = 4.28 aprox.
PI = 4.2778*PI;
FdTLC = minreal(feedback(G6*PI, 1))
% Se verifican estos valores con:
pole(FdTLC)               % Se tiene que dos polos son practicamente iguales,
                          % cumpliendo asi el requerimiento de psita.
step(G6, FdTLC, 5)
