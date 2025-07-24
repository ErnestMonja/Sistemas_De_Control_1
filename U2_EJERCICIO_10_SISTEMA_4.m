close all; clear all; history -c; clc;
pkg load symbolic;
syms s real;

% SISTEMA 4:
% Y5/Y1
P1 = 1*(1/s)*(1/s)*30;
P2 = 1*5*30;
L1 = (1/s)*(-1);
L2 = (1/s)*(-1);
L3 = 5*(-1)*(-1);
L4 = 5*30*(-5*s);
L5 = (1/s)*(1/s)*30*(-5*s);
Delta = 1 - (L1 + L2 + L3 + L4 + L5);
D1 =  1;
D2 = 1;
M = simplify((P1*D1 + P2*D2)/Delta)

% Y4/Y1
P3 = 1*(1/s)*(1/s)*1;
P4 = 1*5*1;
D3 =  1;
D4 = 1;
M1 = simplify((P3*D3 + P4*D4)/Delta)

% Y2/Y1
P5 = 1*1;
D5 = 1 - L2;
M2 = simplify((P5*D5)/Delta)
