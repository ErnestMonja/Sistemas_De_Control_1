close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% Sistema 1: Se observa que K = 1, luego el 63% de K es 0.63, por lo que
% T es aproximadamente 0.1ms por lo que la función de transferencia es:
Gs1 = 1/((0.1*10^-3)*s + 1); step(Gs1)

% Sistema 2: Se observa que K = 0.9, luego el 98% de K es 0.882, por lo que
% 3T es aproximadamente 1ms entonces T = 0.33ms tal que la función de
% transferencia es:
Gs2 = 0.9/((0.33*10^-3)*s + 1); step(Gs2)

% Sistema 3: Se observa que K = 8500, luego el 63% de K es 5355, por lo que
% T es aproximadamente 10s por lo que la función de transferencia es:
Gs3 = 8500/(10*s + 1); step(Gs3)

% Sistema 4: Se observa que K = 95, luego el 98% de K es 93.1, por lo que
% 3T es aproximadamente 300s entonces T = 100s. Ademas se tiene un retardo de
% 100 s tal que la funcion de transferencia es:
Gs4 = 95/(100*s + 1); step(Gs4) % Gs4*e^-100s

% Sistema 5: Se observa que K = 0.75, luego el 98% de K es 0.735, por lo que
% 3T es aproximadamente 1us entonces T = 0.33 us tal que la funcion de
% transferencia es:
Gs5 = 0.75/((0.33*10^-6)*s + 1); step(Gs5)

% Sistema 6: Se observa que K = 0.8, luego el 98% de K es 0.784, por lo que
% 3T es aproximadamente 4ms entonces T = 1.33ms. Ademas se tiene un retardo de
% 1ms tal que la funcion de transferencia es:
Gs6 = 0.8/((1.33*10^-6)*s + 1); step(Gs6) % Gs2*e^-1*10^-3*s
