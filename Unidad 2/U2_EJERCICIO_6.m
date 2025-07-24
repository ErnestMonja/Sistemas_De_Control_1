close all; clear all; history -c; clc;
pkg load symbolic;
syms G H real;

% Sistema 1
P11 = G;
L11 = -G*H;
D1 = 1 - L11;
D11 = 1;
F1 = (P11*D11)/D1

% Sistema 2
P21 = G;
L21 = -G*H;
D2 = 1 - L21;
D21 = 1;
F2 = (P21*D21)/D2
