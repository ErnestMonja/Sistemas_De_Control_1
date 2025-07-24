close all; clear all; history -c; clc;
pkg load symbolic;
syms Ra La Jeff Bm Ki Kb s real;

% Paso 1: Se tiene un solo camino directo, esto es: N = 1

% Paso 2: Se define al camino directo P1:
P1 = (1/La)*(1/s)*(Ki/Jeff)*(1/s);

% Paso 3: Se definen a los 3 lazos:
L1 = (1/s)*(-Ra/La);
L2 = (1/s)*(-Bm/Jeff);
L3 = (1/s)*(Ki/Jeff)*(1/s)*(-Kb/La);

% Paso 4: Se calcula el determinante:
D = 1 - (L1 + L2 + L3) + (L11*L21);

% Paso 5: Se calcula el Delta Lazo:
D1 = 1 - 0;

% Paso 6: Se Obtiene la función de transferencia:
Wm_V = simplify(P1*D1/D)
