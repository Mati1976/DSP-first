% In this demo we will show the properties of DFT by using example vectors
% which could be switched to any selected values
%the properties are 
% 1) The parseval relation
% 2) The general parseval relation 
% 3) Convolution in the time domain is multiplication in the frequency domain
% 4) Multiplication in the time domain is convolution in the frequency
% domain

clc;

A=[1 2 3 4 ];
% A=[1 0 0 0];
% A=[1 1 1 1];

% B=[1 3 2 1];
B=[0 1 2 0];

% Parseval Identity 
%----------------------------------------------------------------------------------------------------
%Calculating the square of A vector 
AS=A.*conj(A);
%Summing the squared vector 
SumAS=sum(AS);
%Transforming the A(n) vector to A(f) using dft
Af=dftM(A);
%Calculating the square of the transformed A vector
AfS=Af.*conj(Af);
%Summing the squared of the transformed A vector 
SumAfS=sum(AfS);

fprintf('Parseval Identity demo\n')
fprintf('-------------------------------------------------------------------------------------------\n')
fprintf('The sum of the squared components of the A(n) vector is :%.2f \n',SumAS);
fprintf('The sum of the squared components of the transformed A(n) vector devided by the length of the vector is :%.2f \n',SumAfS/length(Af));
fprintf('\n');
% Parseval Identity for two different vectors
%----------------------------------------------------------------------------------------------------
%Calculating the square of A vector 
ABc=A.*conj(B);
%Summing the squared vector 
SumABc=sum(ABc);
%Transforming the B(n) vector to B(f) using dft
Bf=dftM(B);

%Calculating the square of the transformed A vector
ABcf=Af.*conj(Bf);
%Summing the squared of the transformed A vector 
SumABcf=sum(ABcf);
fprintf('Parseval Identity for two different vectors demo\n')
fprintf('-------------------------------------------------------------------------------------------\n')
fprintf('The sum of the components of the A(n)*conj(B(n)) vector is :%.2f \n',SumABc);
fprintf('The sum of the squared components of the  A(f)*conj(B(f)) vector devided by the length of the vector is :%.2f \n',SumABcf/length(ABcf));
fprintf('\n');

% Convolution in time
%----------------------------------------------------------------------------------------------------

% Calculating the circular convolution of the vectors A with B
ABcnv=ccnv(A,B);
% Transforming the result of the circular convoltion above (ABcnv) 
ABcnvf=dftM(ABcnv);
ABf=Af.*Bf;

fprintf('Convolution in time demo\n')
fprintf('-------------------------------------------------------------------------------------------\n')
fprintf('The Transformation of the circular convolution in time to the frequency domain result is :\n');
ABcnvf
fprintf('The vector Multifplication of the transformed vectors Af and Bf is:\n');
ABf
fprintf('\n');

% Multiplication in time 
%----------------------------------------------------------------------------------------------------

% Calculating the circular convolution of the vectors A with B
AB=A.*B;
% Transforming the result of the circular convoltion above (AB) 
ABf=dftM(AB);
AfBfccnv=ccnv(Af,Bf);

fprintf('Multiplication in time\n')
fprintf('----------------------------------------------------------------------------------------------\n')
fprintf('The transformation of multipliction of the vectors in the time domain result is :\n');
ABf
fprintf('The circular convolution of the transformed vectors Af and Bf devided by the length of the vectors is:\n');
AfBfccnv/length(Afbfccnv)

fprintf('\n');

