close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G1 = 10/((s + 10)*(s + 100));

% Requerimientos: ess = 0 ; Ts minimo ; Mp = 0 (respuesta criticamente amort.)
% Se utiliza un compensador PI para cancelar el polo dominante, esto es:
Ti = 1/10;
PI = (s + 1/Ti)/s;
FdTLA = PI*G1;
rlocus(FdTLA)
% Para una respuesta criticamente amortiguada, se elige un punto donde las
% raices sean reales, negativas e iguales, por lo que segun el rlocus, este
% punto es:
s1 = -50;
Kp = 1/abs((s1 + 1/Ti)/s1 * 10/((s1 + 10)*(s1 + 100)))   % Kp = 250
PI = Kp*PI;
FdTLC = minreal(feedback(G1*PI, 1))
% Se verifican estos valores con:
pole(FdTLC)        % Se ven los polos dobles en s = -50
step(G1, FdTLC)
