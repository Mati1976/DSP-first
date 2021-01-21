% A script for the calculation of the peridogram of a signal built of two
% sinusoids and a noise 
% Input: vector x, Output: Spectrum estimate Ph

%% 0. A definition block for the different signals we try to detect
close all;
clear all;
size=1000;
phi1=0.2;
phi2=0.35;
fx1=0.2;
fx2=0.3;
N=1*rand(1,size);

%% 1.1 signal generation block (based on the former block)--------------
for k=1:size
    S(k)=cos(2*pi*fx1*k+phi1)+cos(2*pi*fx2*k+phi2);
end
x=N+1*S;
M = 20;
R = 512;

%% 1.2 calculation of autocorelation of the input signal 
rx = xcorr(x,x,M,'biased');

%% 2. Window selection Block
w = window('bartlett',2*M+1)';
% w = window('rectwin',2*M+1)';
% w = window('triang',2*M+1)';
% w = window('hamming',2*M+1)';

%% 3. Periodogram calculation
Ph = 20*log10(abs(fft(rx.*w,R)));

%% 4.-------------Plotting Block-------------
%% 4.1 autocorrelation graph
figure (1);
plot (rx);
title('The autocorrelation function  ') 
xlabel('n')
ylabel('');
grid on 

%% 4.2 The selected window plot 

figure (2);
plot (w);

title('The selected window ') 
xlabel('n')
ylabel('power');
grid on 

%% 4.3 The periodogram 

figure (3);
t=(0:1:R-1);
t=t./R;
plot (t,Ph);


title('The periodogram ') 
xlabel('Normalized frequency')
ylabel('power');
grid on 

grid on






