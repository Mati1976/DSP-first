function ResMat=Mdft(N)
%This function calculate te Nth order discrete DFT transform matrix
%The input for the function is the order of the matrix needed .

    %calculating the basic exponent that appears in every matrix component
    E=exp(-i*2*pi/N);
    
    %Setting up a null Matrix in the right size
    ResMat=zeros(N,N);
    
    %Calculating the values of the matrix by raising the exponential to the
    %right order
    for k=0:(N-1)
        for n=0:(N-1)
            ResMat(k+1,n+1)=E^(k*n);
        end
    end
    