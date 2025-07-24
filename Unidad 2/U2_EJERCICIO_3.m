close all; clear all; clc; history -c;
pkg load control;

s = tf('s');
L = 1*10^-6;
R = 2;
J = 10^6;
B = 0.3*10^-5;
Kb = 0.042;
Ka = 0.042;

G1 = 1/(L*s + R);
G2 = 1/(J*s + B);

% W(s)/E(s) con Tl(s) = 0
W_E = feedback(G1*Ka*G2, Kb)

% I(s)/E(s) con Tl(s) = 0
I_E = feedback(G1, Ka*G2*Kb)

% W(s)/Tl(s) con E(s) = 0
W_Tl = -feedback(G2, -Kb*G1*Ka)

% I(s)/Tl(s) con E(s) = 0
I_Tl = -feedback(G2*(-Kb)*G1, Ka)

t = 0:0.001:0.05;
u1 = 24*ones(length(t),1);
u2 = 0.01*ones(length(t-2),1);

lsim(W_E, u1, t)
lsim(I_E, u1, t)
lsim(W_Tl, u2, t)
lsim(I_Tl, u2, t)
