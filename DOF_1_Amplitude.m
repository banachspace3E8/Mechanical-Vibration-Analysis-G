%Shishir Khanal
% ME 4440 
% Mechanical Vibrations Project 
% Group Members: 
% Sheeren Aljumah 
% Jose Nunez Torres
% Shishir Khanal
% Date: 12/07/2018 
% Purpose : Develop a simulation for the amplitude of the particular 
% solution of the vibration system of interest
%------------------------------------------------------------- 
clear; clc;
% Clears the screen and workspace for fresh start every time 
mu = 0.3; 
% Assume coefficient of kinetic friction between two aluminium surfaces
%is taken as 0.3
M = .065;
% Total mass of the load and the motor is taken as 0.065 kg 
m0 = 0.018; 
% mass of load is taken as 0.4 kg 
g = 9.81; 
% Acceleration due to gravity is 9.81 ms^-2
e = 0.023 ; 
% eccentricity of the rotating mass is 0.023 m
wf = 456*(2*pi/60);
% equation for limiting angular frequency that will give the real amplitude,
% Rpm used include: 426 at 45 degree position, 444 at 30 degrees, 462 at 0
% degrees from the vertical, and 456 at -30 degrees
k1 = 101 ; 
k2 = 58; 
% Spring constants
keq = k1+k2; 
% Assuming the two springs are in parallel and same value of spring constant. 
%Keq = k1+k2 
wn = (keq/(M+m0))^(1/2); 
% equation for natural frequency where Total Mass is used
F0 = m0*e*(wf^2); 
% equation for F0 
N = (M+m0)*g; 
% expression for Normal force 
Term1 = 1-((4*mu*N)/(pi*F0))^2;
Term2 = (1-(wf^2/wn^2)); 
X = (F0/keq)*(Term1/(Term2)^2)^(1/2); 
% Amplitude 
TermA = (4*mu*N)/(pi*keq*X); 
phi = atan(TermA/Term2); 
% phase lag
t = 0:0.01:5; 
Xp = X * sin(wf*t - phi); 
% expression for particular solution 
plot(t,Xp)
ylabel('Xp(t)->'); 
xlabel('t->'); 
