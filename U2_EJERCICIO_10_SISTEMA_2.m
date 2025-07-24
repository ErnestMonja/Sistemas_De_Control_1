close all; clear all; history -c; clc;
pkg load symbolic;
syms G1 G2 G3 G4 H1 H2 H3 H4 real;

% SISTEMA 2:
% Y5/Y1
P1 = 1*G1*G2*G3;
P2 = 1*G4*G3;
L1 = -G1*H1;
L2 = -G3*H2;
L3 = -G1*G2*G3*H3;
L4 = -G4*G3*H3;
L5 = -H4;
Delta = 1 - (L1 + L2 + L3 + L4 + L5) + (L1*L2 + L1*L5);
D1 =  1;
D2 = 1;
M = (P1*D1 + P2*D2)/Delta

% Y4/Y1
P3 = 1*G1*G2*1;
P4 = 1*G4*1
D3 = 1 - L5;
D4 = 1 - L5;
M2 = (P3*D3 + P4*D4)/Delta

% Y2/Y1
P5 = 1;
D5 = 1 - (L2 + L5);
M3 = (P5*D5)/Delta
