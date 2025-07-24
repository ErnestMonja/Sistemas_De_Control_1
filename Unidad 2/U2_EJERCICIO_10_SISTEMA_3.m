close all; clear all; history -c; clc;
pkg load symbolic;
syms s real;

% SISTEMA 3:
% Y5/Y1
P1 = 10*(1/s)*(1/s)*1;
P2 = 10*5*1;
L1 = (1/s)*(-5);
L2 = (1/s)*(1/s)*(-1);
L3 = 5*(-1);
L4 = 5*1*(-10*s)*(-5);
L5 = (1/s)*1*(-10*s);
Delta = 1 - (L1 + L2 + L3 + L4 + L5);
D1 =  1;
D2 = 1;
M = simplify((P1*D1 + P2*D2)/Delta)

% Y4/Y1
P3 = 10*(1/s)*(1/s)*1;
P4 = 10*5*1;
D3 =  1;
D4 = 1;
M1 = simplify((P3*D3 + P4*D4)/Delta)

% Y2/Y1
P5 = 10*1;
D5 = 1;
M2 = simplify((P5*D5)/Delta)
