function res=IdftM(A)
%This function calculate the inverse discrete DFT transform of a vector
%We are using  the IMdft function which creates the relevant inverse dft Matrix
%The input for the function is the vector .

res=1/length(A)*(IMdft(length(A))*A')';
    end