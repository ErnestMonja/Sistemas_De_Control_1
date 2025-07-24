close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% Utilizando la resolucion del ejercicio 4 de la Unidad 3, se obtuvo que:
% Ma = 500; Ms = 50; Kr = 10; Kc = 50; Ba = 80;
% Xa_W = simplify((Kc*(Ba*s + Kr))/((Ma*Ms)*s^4 + (Ba*(Ma + Ms))*s^3 +
%        + (Ma*(Kc+Kr)+Kr*Ms)*s^2 + (Ba*Kc)*s + (Kc*Kr)))

G = (8*s + 1)/(s^4*50 + s^3*88 + s^2*61 + s*8 + 1)

% Veamos como responde este sistema a un impulso y veamos donde estan sus ceros
% y polos:

step(G); pole(G)
% Se trata de un sistema con cierto sobrepasamiento, se observa tambien que sus
% 4 polos son complejos conjugados de modo donde:
s1 = -0.0641 + j*0.1268;
s2 = -0.0641 - j*0.1268;
s3 = -0.8159 + j*0.5700;
s4 = -0.8159 - j*0.5700;

%% DISEÑO DEL CONTROLADOR PID:
% Se tiene que utilizaremos los ceros del PID para cancelar los polos complejos
% conjugados mas cerca del origen, estos son s1 y s2, por lo tanto diremos que:
% (s + s1)*(s + s2) = s^2 + 0.1282*s + 0.02018705
Greal = ((8*s + 1))/(s^2 + 0.1282*s + 0.02018705)

% Ahora, dado que el PID cancelara estos dos polos, se tendra que:
% s^2 + 0.1282*s + 0.02018705 = s^2 + s/Td + 1/Ti*Td
Td = 1/0.1282               % Td = 7.8003
Ti = 1/(0.02018705*Td)      % Ti = 6.3506
PID = (s^2 + s/Td + 1/(Ti*Td))/(Td*Ti*s)
FdTLA = minreal(PID*Greal);
rlocus(FdTLA); sgrid(0.707, [20 40 60 80])

% Se escoge un Kp arbitrario igual a 1, por lo tanto:
FdTLC = minreal(feedback(FdTLA, 1));
step(FdTLC, G)
