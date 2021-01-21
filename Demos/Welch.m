% a demo fr the welch spectral estimation method
% Input: vector x, Output: Spectrum estimate Ph
% % % % 

close all;
clear all;

size=256; %setting the size of the string
%% --------------------------------------------------------------------------------------------------
% Setting up the sinus deterministic part of the signal parameters :Frequency, amplitude and Phase
% and setting up the sinusidal waveform it self .
phi1=0.2;
phi2=0.2;
fx1=0.2;
fx2=0.35;
A1=1;
A2=2;

for k=1:size
    S(k)=A1*cos(2*pi*fx1*k+phi1)+A2*cos(2*pi*fx2*k+phi2);
end

%% ------------------------------------------------------------------
% Generating a noise signal and adding it to the  deterministic sinus stage
N=1*rand(1,size);
x=N+1*S;

%% ------------------Parameters selection-----------------------------------------------------------
 
R = 512;
L=32;

Ol=0.5; %The overlapping ratio
D=L*Ol; %The actual overlapping in samples
K=size/D-1;

%% choose one of the folowing windows below 
%------------windows selection start ---------------
%w = window('hamming',L)';
%w = window('bartlett',L)';
%w = window('blackman',L)';
w = window('chebwin',L)';
%w = window('tukeywin',L)';

%------------windows selection end  ---------------
%%---Calculation block----------

U = 1/L*sum(abs(w).^2);
Ph = 0;
for k=0:K-1
    xk = x(k*D+1:k*D+L);
    Xk = fft(xk.*w,R);
    Ph = Ph + 1/(K*L*U)*abs(Xk).^2;
end

%%  Plotting Block--------------------------------------------------------
t=(0:1:R-1);
t=t./R;
plot (t,20*log10(Ph));

title('Welch frequency method  ') 
xlabel('Normalized Frequency')
ylabel('Power [dB] ');
grid on 

grid on