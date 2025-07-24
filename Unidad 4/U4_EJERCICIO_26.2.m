close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G2 = 0.8/((0.1*s + 1)*(0.05*s + 1));
pole(G2)    % Se tiene que los polos estan en -10 y -20

% Requerimientos: ess = 0 ; Ts minimo ; Mp = 0 (respuesta criticamente amort.)
% Se utiliza un compensador PI para cancelar el polo dominante, esto es:
Ti = 1/10;
PI = (s + 1/Ti)/s;
FdTLA = PI*G2;
rlocus(FdTLA)
% Para una respuesta criticamente amortiguada, se elige un punto donde las
% raices sean reales, negativas e iguales, por lo que segun el rlocus, este
% punto es:
s1 = -10;
G2PI = minreal(G2*PI);
Kp = 1/abs( (160/(s1^2 + 20*s1)) )  % Kp = 0.6250
PI = Kp*PI;
FdTLC = minreal(feedback(G2*PI, 1))
% Se verifican estos valores con:
pole(FdTLC)        % Se ven los polos dobles en s = -10
step(G2, FdTLC, 10)
