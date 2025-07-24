close all; clear all; history -c; clc;
pkg load symbolic;
syms G1 G2 G3 G4 H1 H2 H3 H4 real;

% SISTEMA 1:
% Y5/Y1
P1 = 1*G1*G2*G3;
P2 = 1*G4*G3;
L1 = -G1*H1;
L2 = -G3*H2;
L3 = -G1*G2*G3*H3;
L4 = -G4*G3*H3;
D = 1 - (L1 + L2 + L3 + L4) + (L1*L2);
D1 = 1;
D2 = 1;
F1 = (P1*D1 + P2*D2)/D

% Y4/Y1
P3 = G1*G2;
P4 = G4;
D3 = 1;
D4 = 1;
F2 = (P3*D3 + P4*D4)/D

% Y2/Y1
P5 = 1;
D5 = 1 - L2;
F3 = (P5*D5)/D
