close all; clear all; history -c; clc;
pkg load symbolic;

syms s K real;

R = 1/s + 5/s^2;
G = K*(2*s + 1)/(s*(4*s + 1)*(s + 1)^2);

E = factor(s*R/(1 + G),'s')
s = 0;
eval(E)
% 5/K >= 0.1 --> K >= 50
