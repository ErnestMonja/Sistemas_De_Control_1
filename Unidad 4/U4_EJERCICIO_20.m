close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

G1 = 100/(s*(s + 5));
rlocus(G1); sgrid       % El sistema oscilará si k = 0

G2 = 100*(s^2 + 40*s + 800)/((s + 80)*(s + 50));
rlocus(G2); sgrid       % El sistema no oscilará

G3 = 100/((s + 80)*(s + 50)*(s - 10));
rlocusx(G3)             % El sistema oscilará si k = 3640

G4 = 100*(s + 40)/((s + 5)*(s^2 + 20*s + 1700))
rlocusx(G4)             % El sistema oscilará si k = 24.35

G5 = 100*(s + 40)/((s - 5)*(s^2 + 20*s + 1700))
rlocusx(G5)             % El sistema oscilará si k = 13

G6 = 100*(s - 40)/((s + 25)*(s^2 + 20*s + 1700))
rlocusx(G6)             % El sistema oscilará si k = 10.64
