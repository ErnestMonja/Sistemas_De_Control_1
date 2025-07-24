close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
% Se trata de un sistema sobreamortiguado donde psita > 1 tal que usaremos
% una aproximación donde:
yss = 2.2;
K = yss;

% Se mide el tiempo de establecimiento y con ello se calcula Tau
Ts = 0.25;
Tau = Ts/5;

F = K/((Tau/2)*s + 1)^2
step(F, 0.3)
