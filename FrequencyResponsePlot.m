% Shishir Khanal
% ME 4440
% Mechanical Vibrations Project
% Group Members:
% Sheeren Aljumah
% Jose Nunez Torres
% Shishir Khamal
% Date: 12/7/2018
% Purpose : Develop a simulation for the frequency response of the particular
% solution of the vibration system of interest
%-------------------------------------------------------------
clear; clc;
% Clears the screen and workspace for fresh start every time
mu = 1.1;
% Assume coefficient of kinetic friction between two aluminiums is taken as
% 1.1
M = 0.065;
% Total mass of the load and the motor is taken as 0.065kg
m0 = 0.018;
% mass odfload is taken as 0.18 kg
g = 9.81;
% Acceleration due to gravity is 9.81 ms^-2
e = 0.023 ;
% eccentricity of the rotating mass is 0.023 m
wf = ((4*mu*M*g)/(m0*e*pi))^(1/2);
% equation for limiting angular frequency
k1 = 3.45;
k2 = 6.75;
% Spring constant is taken as 10.2 N/m
keq = k1+k2;
%wn = (keq/(M+m0))^(1/2);
wn = (keq/0.15)^(1/2);
% equation for natural frequency
F0 = m0*e*wf^2;
% equation for F0
N = M*g;
% expression for Normal force
Term1 = 1-((4*mu*N)/(pi*F0))^2;
r = 0:0.01:5;
Term2 = (1-(r.^2)).^2;
X = (F0/keq)*((Term1./(Term2))).^(1/2) ;
Mag = abs(X/(F0/keq));
t = 0:0.01:5;
% expression for particular solution
plot(t,Mag);
title('Frequency Response Curve');
ylabel('Magnitude (X/(F0/keq))');
xlabel('Frequency ratio (wf/wn)');
