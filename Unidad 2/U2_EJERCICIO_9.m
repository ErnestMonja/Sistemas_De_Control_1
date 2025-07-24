close all; clear all; history -c; clc;
pkg load control;
pkg load symbolic;

s = tf('s');
L = 1*10^-6;
R = 2;
J = 10^6;
B = 0.3*10^-5;
Kb = 0.042;
Ka = 0.042;
G1 = 1/(L*s+R);
G2 = 1/(J*s+B);

%% PARTE A:
% F1 = W(s)/E(s) para T=0
P1 = G1*Ka*G2;
L1 = -G1*Ka*G2*Kb;
D = 1 - L1;
D1 = 1;
F1 = minreal((P1*D1)/D)

% F2 = I(s)/E(s) para T=0
P2 = G2;
F2 = minreal((P2*D1)/D)

% F3 = W(s)/T(s) para E=0
P3 = -G2;
F3 = minreal((P3*D1)/D)

% F3 = I(s)/T(s) para E=0
P4 = -G2*(-Kb)*G1;
F4 = minreal((P4*D1)/D)

%% PARTE B:
Kp = 1;
% W(s)/Wr(s) para T=0
P5 = Kp*G1*Ka*G2;
L5 = -Kp*G1*Ka*G2;
DD = 1 - (L1 + L5);
F5 = minreal((P5*D1)/DD)

% W(s)/T(S) para Wr=0
P6 = -G2;
F6 = minreal((P6*D1)/DD)
