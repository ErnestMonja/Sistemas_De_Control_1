close all; clear all; clc; history -c;
pkg load symbolic;
syms G1 G2 G3 H1 H2 H3 real;

% Sistema 1:
P11 = G1*G2*G3;
L11 = -G1*H1;
L21 = -G2*H2;
L31 = -G3*H3;
Delta1 = 1 - (L11 + L21 + L31) + (L11*L21 + L21*L31 + L31*L11) - (L11*L21*L31);
D11 = 1;
M1 = P11*D11/Delta1

% Sistema 2:
P12 = G1*G2*G3;
L12 = -G1*H1;
L22 = -G2*H2;
L32 = -G3*H3;
Delta2 = 1 - (L12 + L22 + L32) + (L12*L32);
D22 = 1;
F2 = (P12*D22)/Delta2
