% hw9pr2.m
close all

%% Part D

fp = 10;
wc = 2*pi*fp;
f = linspace(0, 20, 1000);
w = 2*pi*f;

t0 = 1j*w - wc*exp(1j*(5*pi/8));
t1 = 1j*w - wc*exp(1j*(7*pi/8));
t2 = 1j*w - wc*exp(1j*(9*pi/8));
t3 = 1j*w - wc*exp(1j*(11*pi/8));

H1 = wc^4./(t0.*t1.*t2.*t3);

figure(1)
loglog(f,abs(H1))
title('Ideal Resistor Value Gain')
xlabel('f (Hz)')
ylabel('|H(j2\pif)|')
xlim([0 20])

%% Part E

CI1  = 0.22e-6; CI2  = 0.1e-6;
CII1 = 1e-6;    CII2 = 0.1e-6;

% Calculate ideal resistor values.
[RI1i, RI2i]   = skdesign(wc, CI1,  CI2,  7*pi/8);
[RII1i, RII2i] = skdesign(wc, CII1, CII2, 5*pi/8);

% Use standard values.
RI1  = 47e3; RI2  = 270e3;
RII1 = 27e3; RII2 = 100e3;

s = 1j*w;
H2I  = 1./(RI1*CI1*RI2*CI2*s.^2     + (RI1+RI2)*CI2.*s    + 1);
H2II = 1./(RII1*CII1*RII2*CII2*s.^2 + (RII1+RII2)*CII2.*s + 1);
H2   = H2I.*H2II;


figure(2)
loglog(f,abs(H2))
title('Standard Resistor Value Gain')
xlabel('f (Hz)')
ylabel('|H(j2\pif)|')
xlim([0 20])
