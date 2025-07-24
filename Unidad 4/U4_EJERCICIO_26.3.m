close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G3 = 125/(s^2 + 33*s + 200);
pole(G3)    % Se tiene que los polos estan en -8 y -25

% Requerimientos: ess = 0 ; Ts minimo ; Mp = 0 (respuesta criticamente amort.)
% Se utiliza un compensador PI para cancelar el polo dominante, esto es:
Ti = 1/8;
PI = (s + 1/Ti)/s;
FdTLA = PI*G3;
rlocus(FdTLA)
% Para una respuesta criticamente amortiguada, se elige un punto donde las
% raices sean reales, negativas e iguales, por lo que segun el rlocus, este
% punto es:
s1 = -12.5;
G3PI = minreal(G3*PI);
Kp = 1/abs(125/(s1^2 + 25*s1))        % Kp = 1.25
rlocusx(FdTLA)
PI = Kp*PI;
FdTLC = minreal(feedback(G3*PI, 1))
% Se verifican estos valores con:
pole(FdTLC)                           % Se ven los polos dobles en s = -12.5
step(G3, FdTLC, 10)
