close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
% Se trata de un sistema sobreamortiguado donde psita > 1 tal que usaremos
% una aproximación donde:
yss = 3.5;
K = yss;

% Se mide el tiempo de establecimiento y con ello se calcula Tau
Td = 0.005
Ts = 0.01;
Tau = Ts/5;

F = K/((Tau/2)*s + 1)^2 % F.inputdelay = 0.005;
step(F, 0.02)
