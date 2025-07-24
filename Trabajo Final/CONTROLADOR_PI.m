close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
FdS = (4.492310*10^5)/(s^2 + s*9.6336*10^3 + 1.7159*10^6)
Kt = 3.4384;

% Requerimientos: ess = 0 ; Ts minimo ; Mp = 0 (respuesta criticamente amort.)
% Se utiliza un compensador PI para cancelar el polo dominante, esto es:
Ti = 1/181.54;
PI = (s + 1/Ti)/s;
rlocus(minreal(PI*FdS*Kt))

% Para una respuesta criticamente amortiguada, se elige un punto donde las
% raices sean reales, negativas e iguales, por lo que segun el rlocus, este
% punto es:
s1 = -4726;
Kp = 1/abs((s1+1/Ti)/s1*Kt*(4.492310*10^5)/(s1^2 + s1*9.6336*10^3 + 1.7159*10^6))
PI = Kp*PI;
FdTLC = minreal(feedback(FdS*PI, Kt))

% Se verifican estos valores con:
pole(FdTLC)        % Se ven los polos dobles en s = -4726
step(12*FdS, 12*FdTLC)
legend("Sistema sin compensar", "Sistema compensado")
