%Wireless Communication Network
%Homework2_20181105
%107064522

clc;
clear;

%% 1. (c)
% fc = 2 GHz, v is uniformly distributed between 20 and 90(km/hr)
% Initial value
fc = 2*10^9; % frequency(Hz)

% Uniformly distributed incidence angle
theta = makedist('Uniform', 'upper', pi, 'lower', -pi);
% Uniformly distributed MS velocity(m/sec)
v = makedist('Uniform', 'upper', 90*5/18, 'lower', 20*5/18);

% Simulate million times of Doppler Shift
for i = 1:1000000
    fm(i) = random(v)/(3*10^8/fc); %v/lambda_c(Hz)
    fD(i) = fm(i)*cos(random(theta));
end

%% Simulated pdf
figure
pdf = hist(fD, 1000)/1000000;
plot(linspace(-max(fm), max(fm), 1000), pdf*1000/(2*max(fm)));
title('pdf simulation of Doppler shift')
xlabel('Doppler shift (Hz)')
ylabel('Probability Density')

%% Simulated cdf
figure
plot(linspace(-max(fm), max(fm), 1000), cumsum(pdf));
title('cdf simulation of Doppler shift')
xlabel('Doppler shift (Hz)')
ylabel('Probability')