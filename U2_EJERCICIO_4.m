close all; clear all; history -c; clc;
pkg load control;

s = tf('s');
L = 1*10^-6;
R = 2;
J = 10^6;
B = 0.3*10^-5;
Kb = 0.042;
Ka = 0.042;
Kp = 1;


G1 = 1/(L*s+R);
G2 = 1/(J*s+B);

% F1 = W(s)/Wr(s)
F1 = feedback(feedback(G1*Ka*G2, Kb)*Kp, 1)
% F2 = W(s)/Tl(s)
F2 = -feedback(G2/(Ka*G1*(Kb + Kp)))

p = 0.0001
t = 0:p:0.02-p;
u = 300*ones(length(t),1);
lsim(F1,u,t)
lsim(F2,u,t)
