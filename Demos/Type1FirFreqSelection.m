%% 0. setup 

clear all;
close all;
%% 1.1 The filter setup
% in this Part we define two vectors one for the abs values (aAbs) of the
% filters parameters and the other is for the frequency values (aFreq)
% in which we obtain the coefficients in.
% please pay attention to the fact those two vctors should be of the same 
% size and that the values of the aFreq vector should be between 0 and 0.5
% We will later create teh other half part of the frequency response
% between 0.5 and 1 based on the definitions of the type 1 FIR filter
% 
%
% aFreq=[0 0.2 0.4 0.45 0.48 ];
% aAbs=[1 1 0 0 0 ]

aFreq=[0 0.25 0.375 0.4 0.45 ];
aAbs=[1 1 0 0 0];

%% 1.2

Leng=length(aAbs);
M=(Leng-1)*2;% The order of the filter
N=M+1; % The length of the filter vector 
Fl=1024; %The FFT and IFFT length

%% 1.3 creating the linear phase part   

% We create here the vector p which will hold the coefficients angle
% values according to the rule that applying to each filetr family 
aPhase=exp(-i*2*pi*M/2*aFreq);

aFull=aAbs.*aPhase; % Multipling the two vectors in order to get the full sampled 
%coefficients vector

%% 1.3.1 Generating the full vector out of the given coefficients

aFreqFull=[aFreq 1-aFreq(Leng:-1:2)];
aAbsFull=[aAbs aAbs(Leng:-1:2)];

%% 1.4 generating the coefficients in the time domain
% We will do generate the coefficients by solving an system of linear equations

MatC=zeros(Leng,Leng); % Creating the matrix of the coefficients and initializing it

for l=0:(Leng-1)
    for m=1:(Leng-1)
        MatC(l+1,Leng-m)=2*exp(i*pi*M*aFreq(l+1))*cos(2*m*pi*aFreq(l+1));
    end
    MatC(l+1,Leng)=exp(i*pi*M*aFreq(l+1));
end

% Calculating the coefficints in the time domain of the frequency between 0
% to 0.5
aNs=linsolve(MatC,aFull')';

% Calculating the full set of  coefficints in the time domain of the full
% frequency range between 0 to 1
aN=[aNs aNs(Leng-1:-1:1)];

aFreqHr=fft(aN,Fl); % calculating the high resolution fft for the sampled coeffcients
aAng=unwrap(angle(aFreqHr)); % a checking phase for the angle
%% 2. graph generating 
%% 2.1 Graph :setting up the different X axis .
T=zeros(1,length(aN));
T=(0:1/N:M/N);
t=(0:1/Fl:(Fl-1)/Fl);

% we set here another 2 x axis that will show only half of the response
aFreqHrS=aFreqHr(1:1:Fl/2+1);
ts=t(1:1:Fl/2+1);

Ts=(0:1/N:1/2);
%as=a(1:1:(N+1)/2);
%% 2.2 Ploting up the graphs 
% Graph 1
figure ;
title('Type 1 FIR filter') 
subplot (1,3,1);
plot (ts,20*log10(abs(aFreqHrS)));
ylim([-30 5 ]);
xlim([0 0.5]);
title('Frequency response of the sampled signal in decible') 
xlabel('The normalized frequency')
ylabel('Power [dB]');
% plot (t,abs(aFreqHrS));
grid on

% Graph 2
subplot (1,3,2);
plot (ts,abs(aFreqHrS));
hold on ;
stem(aFreq,aAbs);
%ylim([0 1.3]);
xlim([0 0.5]);
title('Frequency response of the sampled signal ') 
xlabel('The normalized frequency')
ylabel('Power ');
grid on

% Graph 3
x=(0:1:M);
subplot (1,3,3);
stem (x,real(aN));
title('Impulse response of the filter ') 
xlabel('n')
ylabel('Power ');
grid on 

