%% 0. setup 

clear all;
close all;
%% 1.1 The filter selection 
% Those are the sampled values from the absolute values of the ideal filter
% 
%a=[0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0];
%a=[0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 ];
a=[0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0];
%a=[1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];

%% 1.2 
N=length(a); % Reading the length of the vector 
M=N-1; % The order of the filter
Fl=1024; %The FFT and IFFT length

%% 1.2.1 checking if the filter is of type 3
Test=false;
if or(mod(M,2)==1, a((1)~=0))
    sprintf('This is not a type 3 filter please choose another vector ')
    Test=true;
end;

if Test 
    return;
end
    
for j=1:(M-1)/2
    
    if a(j+1)~=a(M+1-j+1)
        sprintf('This is not a type 3 filter please choose another vector ')
        Test =true;
        break
    end
end

if Test 
    return;
end
    
    



%% 1.3 creating the linear phase part   

% We create here the vector p which will hold the coefficients angle
% values according to the rule that applying to each filetr family 
for j=1:(M/2)
   p(j+1)=exp(i*2*pi*(0.25-(j)*M/(2*(M+1))));
end
for j=M/2:M
   p(j+1)=exp(i*2*pi*(-0.25-(j)*M/(2*(M+1))));
end

a=a.*p; % Multipling the two vectors in order to get the full sampled 
%coefficients vector

%% 1.4
ainv=ifft(a,N); % Calculating the coefficints in the time domain
b=fft(ainv,Fl); % calculating the high resolution fft for the sampled coeffcients
Bang=unwrap(angle(b)); % a checking phase for the angle
%% 2. graph generating 
%% 2.1 Graph :setting up the different X axis .
T=zeros(1,length(a));
T=(0:1/N:M/N);
t=(0:1/Fl:(Fl-1)/Fl);

% we set here another 2 x axis that will show only half of the response
bs=b(1:1:Fl/2+1);
ts=t(1:1:Fl/2+1);

Ts=(0:1/N:1/2);
as=a(1:1:(N+1)/2);
%% 2.2 Ploting up the graphs 
% Graph 1
figure ;
title('Type 2 FIR filter') 
subplot (1,3,1);
plot (ts,20*log10(abs(bs)));
ylim([-50 5 ]);
xlim([0 0.5]);
title('Frequency response of the sampled signal in decible') 
xlabel('The normalized frequency')
ylabel('Power [dB]');
% plot (t,abs(b));
grid on

% Graph 2
subplot (1,3,2);
plot (ts,abs(bs));
hold on ;
stem(Ts,abs(as));
%ylim([0 1.3]);
xlim([0 0.5]);
title('Frequency response of the sampled signal ') 
xlabel('The normalized frequency')
ylabel('Power ');
grid on

% Graph 3
x=(0:1:M);
subplot (1,3,3);
stem (x,real(ainv));
title('Impulse response of the filter ') 
xlabel('n')
ylabel('Power ');
grid on 

