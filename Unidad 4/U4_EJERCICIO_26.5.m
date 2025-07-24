close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G5 = 20*(s + 60)/((s + 10)*(s + 20));
pole(G5)    % Se tiene que los polos estan en -10 y -20

% Requerimientos: ess = 0 ; Ts minimo ; Mp = 0 (respuesta criticamente amort.)
% Se utiliza un compensador PI para cancelar el polo dominante, esto es:
Ti = 1/10;
PI = (s + 1/Ti)/s;
FdTLA = PI*G5;
rlocus(FdTLA)
% Para una respuesta criticamente amortiguada, se elige un punto donde las
% raices sean reales, negativas e iguales, por lo que segun el rlocus, este
% punto es:
s1 = -109;
G5PI = minreal(G5*PI)
Kp = 1/abs((20*s1 + 1200)/(s1^2 + 20*s1))        % Kp = 9.8990
rlocusx(FdTLA)                                   % Kp = 9.9 aproximadamente
PI = 9.8990*PI;
FdTLC = minreal(feedback(G5*PI, 1))
% Se verifican estos valores con:
pole(FdTLC)               % se observan polos dobles casi iguales uno del otro
step(G5, FdTLC, 30)
