%Wireless Communication Network
%Homework2_20181105
%107064522

clc;
clear;

%% 1.(d)
%% Apply to 1. (a)
% v = 20km/hr, fc = 2 GHz
% Initial values
v = 20*5/18; % MS velocity(m/sec)
fc = 2*10^9; % frequency(Hz)
fm = v/(3*10^8/fc); %v/lambda_c(Hz)

% Uniformly distributed incidence angle
theta = makedist('Uniform', 'upper', pi, 'lower', -pi);

% Simulate million times of Doppler Shift
for i = 1:1000000
    fD(i) = fm*cos(random(theta));
end

%% Simulated pdf
figure
pdf = hist(fD, 1000)/1000000;
plot(linspace(-fm, fm, 1000), pdf*1000/(2*fm));
title('pdf simulation of Doppler shift')
xlabel('Doppler shift (Hz)')
ylabel('Probability Density')

%% 1. (d)
%% Theoretical pdf
hold on
y = linspace(-fm+0.01, fm-0.01, 1000);
k = 1./(pi*fm*sqrt(1-(y/fm).^2));
plot(y, k)
legend('Simulated pdf', 'Theoretical pdf')

%% Simulated cdf
figure
plot(linspace(-fm, fm, 1000), cumsum(pdf));
title('cdf simulation of Doppler shift')
xlabel('Doppler shift (Hz)')
ylabel('Probability')

%% 1. (d)
%% Theoretical cdf
hold on
y = linspace(-fm+0.01, fm-0.01, 1000);
k = 0.5 + asin(y./fm)./pi;
plot(y, k)
legend('Simulated cdf', 'Theoretical cdf')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Apply to 1. (b)
% v = 90km/hr, fc = 26 GHz
% Initial values
v = 90*5/18; % MS velocity(m/sec)
fc = 26*10^9; % frequency(Hz)
fm = v/(3*10^8/fc); %v/lambda_c(Hz)

% Simulate million times of Doppler Shift
for i = 1:1000000
    fD(i) = fm*cos(random(theta));
end

%% Simulated pdf
figure
pdf = hist(fD, 1000)/1000000;
plot(linspace(-fm, fm, 1000), pdf*1000/(2*fm));
title('pdf simulation of Doppler shift')
xlabel('Doppler shift (Hz)')
ylabel('Probability Density')
%% 1. (d)
%% Theoretical pdf
hold on
y = linspace(-fm+0.01, fm-0.01, 1000);
k = 1./(pi*fm*sqrt(1-(y/fm).^2));
plot(y, k)
legend('Simulated pdf', 'Theoretical pdf')

%% Simulated cdf
figure
plot(linspace(-fm, fm, 1000), cumsum(pdf));
title('cdf simulation of Doppler shift')
xlabel('Doppler shift (Hz)')
ylabel('Probability')
ylim([0 1])

%% 1. (d)
%% Theoretical cdf
hold on
y = linspace(-fm+0.01, fm-0.01, 1000);
k = 0.5 + asin(y./fm)./pi;
plot(y, k)
legend('Simulated cdf', 'Theoretical cdf')