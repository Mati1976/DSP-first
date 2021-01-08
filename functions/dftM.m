function res=dftM(A)
%This function calculate the discrete DFT transform of a vector
%We are using  the Mdft function which creates the relevant dft Matrix
%The input for the function is the vector .

res=(Mdft(length(A))*A')';
    end
    