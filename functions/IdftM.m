function res=IdftM(A)
%This function calculate the inverse discrete DFT transform of a vector
%The input for the function is the vector .

res=1/length(A)*(IMdft(length(A))*A')';
    end