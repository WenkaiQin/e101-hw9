% hw9pr3.m
close all

%% Part G

w = linspace(0, 2*pi, 1000);
z = exp(-1j*w);
H1 = (1-z.^-10);

figure(1)
plot(w, abs(H1));
xlim([0 pi]);
title('Standard Comb Filter Gain')
xlabel('w (rad/s)')
ylabel('|H(z)|')

%% Part H

% H2 = H1./((1-exp(1j*-pi/5)*z.^-1).*...
%         (1-exp(1j*pi/5)*z.^-1).*...
%         (1-exp(1j*0).*z.^-1));
% H2 = H2/(abs(H2(2)));
% H2(1) = 1;
    
H2 = (1-exp(1j*-2*pi/5)*z.^-1).*(1-exp(1j*2*pi/5)*z.^-1).* ...
     (1-exp(1j*-3*pi/5)*z.^-1).*(1-exp(1j*3*pi/5)*z.^-1).* ...
     (1-exp(1j*-4*pi/5)*z.^-1).*(1-exp(1j*4*pi/5)*z.^-1).* ...
     (1-exp(1j*-5*pi/5)*z.^-1);

H2 = H2/(abs(H2(1)));

figure(2)
plot(w, abs(H2));
xlim([0 pi]);
title('Modified Comb Filter Gain')
xlabel('w (rad/s)')
ylabel('|H(z)|')

%% Part I

v1 = [1 -2*cos(2*pi/5) 1];
v2 = [1 -2*cos(3*pi/5) 1];
v3 = [1 -2*cos(4*pi/5) 1];
v4 = [1 1];

h = conv(conv(v1,v2), conv(v3, v4));

figure(3)
stem(h)
xlim([0 9])