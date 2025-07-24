close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% Planteo la función de transferencia la cual voy a compensar como:
G1 = 100/(s + 100);
G2 = 2340/(s + 212.8);
Gtot = minreal(feedback(G1*G2, 1))

% Vemos el valor de los polos de esta funcion Gtot:
pole(Gtot)     % Se observan polos en: s = -156.4 +- j*480.44

% Luego, dado que se nos pide utilizar un compensador PID, este tiene una
% función de transferencia como la que se muestra a continuación:
% PID = Kp*(Ti*Td*s^2 + Ti*s + 1)/(Ti*s) = Kp*(s^2 + s/Td + 1/(Ti*Td))/Td*Ti*s

% Donde se tendra que los ceros dobles de este PID cancelaran a los polos
% dominantes de la función Gtot, por lo tanto se tendra que:
% s^2 + s/Td + 1/(Ti*Td) = s^2 + 312.8*s + 2553e+05
% De aquí se pueden deducir los valores de las constantes Td y Ti como:
Td = 1/312.8              % Td = 3.1969e-03
Ti = 1/(2.553e+05*Td)     % Ti = 1.2252e-03

% Por lo tanto resulta que el controlador PID tiene la siguiente forma:
PID = (Ti*Td*s^2 + Ti*s + 1)/(Ti*s)

% Resta solo calcular el valor de Kp, por lo que asumiendo un sobrepasamiento
% maximo del 4% (psita = 0.707) se tiene que:
FdTLA = minreal(PID*Gtot);
rlocus(FdTLA); sgrid(0.707, [20 40 60 80])

% Se escoge arbitrariamente un Kp = 1 de modo tal que la función de transferencia
% a lazo cerrado sea la siguiente:
FdTLC = minreal(feedback(FdTLA, 1));
step(FdTLC, Gtot)
