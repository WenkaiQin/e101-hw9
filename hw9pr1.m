%% Part A
close all
load('E101_HW9.mat')

Ts = 10/1000;
Fs = 1/Ts;
L = 1000;
t = (0:L-1)*Ts;

figure(1)
plot(t(1:100),x(1:100))
ylim([-10 10])
title('Signal')
xlabel('t (seconds)')
ylabel('x(t)')

X = 1/L*fft(x,L);
P1 = abs(X(1:L/2));

figure(2)
f = Fs*(0:L/2-1)/L;
plot(0:1:499, P1)
title('One-Sided DFT Magnitude')
xlabel('m = 0...499')
ylabel('|X(m)|')

%% Part B
M = 500;
n = -M:M-1;

w=0.5*(1+cos(pi*n/M));
xw = x(1:L).*w.';
XW = 1/L*fft(xw);
Pw = abs(XW(1:L/2));

figure(3)
plot(0:1:499, P1)
title('One-Sided DFT Magnitude')
xlabel('m = 0...499')
ylabel('|X_{Hann}(f)|')

%% Part C
A = max(x);
a0 = sum(x)/size(x,1);
d = a0/A;
k = 1:4;

ak = abs((A*sin(k*pi*d)) ./ (N*sin(k*pi/N)));

kN = N*k;