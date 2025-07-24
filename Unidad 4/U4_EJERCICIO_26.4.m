close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
G4 = 1.24/(s + 1)^3;
pole(G4)    % Se tiene que los polos estan en -1

% Requerimientos: ess = 0 ; Ts minimo ; Mp = 0 (respuesta criticamente amort.)
% Se utiliza un compensador PI para cancelar el polo dominante, esto es:
Ti = 1/1;
PI = (s + 1/Ti)/s;
FdTLA = PI*G4;
rlocus(FdTLA)
% Para una respuesta criticamente amortiguada, se elige un punto donde las
% raices sean reales, negativas e iguales, por lo que segun el rlocus, este
% punto es:
s1 = -0.3333;
G4PI = minreal(G4*PI)
Kp = 1/abs(1.24/(s1^3 + 2*s1^2 + s1))        % Kp = 0.1195
rlocusx(FdTLA)                               % Kp = 0.12 aproximadamente
PI = 0.1195*PI;
FdTLC = minreal(feedback(G4*PI, 1))
% Se verifican estos valores con:
pole(FdTLC)               % Se cancelo uno de los polos y los otros tienen parte
                          % real igual a -0.33
step(G4, FdTLC, 30)
