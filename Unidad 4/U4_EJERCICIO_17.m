close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% Inciso a)
rlocus(zpk([-8], [0], 1)); sgrid
% Inciso b)
rlocus(zpk([-4], [0 -2], 1)); sgrid
% Inciso c)
rlocus(zpk([0], [-1 -1 -1], 1)); sgrid
% Inciso d)
rlocus(zpk([-4 -6], [0 -1], 1)); sgrid
% Inciso e)
rlocus(zpk([-4], [0 -2], 1)); sgrid
% Inciso f)
rlocus(zpk([-8 -10], [3 -4], 1)); sgrid
% Inciso g)
rlocus(zpk([], [1 -1 -3 -4], 1)); sgrid
% Inciso h)
rlocus(zpk([], [-2+j -2-j], 1)); sgrid
% Inciso i)
rlocus(zpk([], [-2+j -2-j -10], 1)); sgrid
% Inciso j)
rlocus(zpk([], [-2+j -2-j -1], 1)); sgrid
% Inciso k)
rlocus(zpk([-10], [-2+j -2-j], 1)); sgrid
% Inciso l)
rlocus(zpk([-1 -4], [-2+j -2-j], 1)); sgrid
% Inciso m)
rlocus(zpk([1 -4], [-2+j -2-j], 1)); sgrid
% Inciso n)
rlocus(zpk([1+3j 1-3j], [-8+j -8-j], 1)); sgrid
% Inciso o)
rlocus(zpk([1+3j 1-3j], [-8.1], 1)); sgrid
