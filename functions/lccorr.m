function Res=lccorr(A ,B);
%The lcnv function calculate the linear cross convolution of two vectors
%The input will be two vectos A and B

    %calculating the length of the resulting 
    Leng=length(A)+length(B)-1; 
    %Padding the A vector 
    An=[zeros(1,length(B)-1) A];
    %Padding the reversed B vector 
    Bn=[B zeros(1,length(A)-1)];
    %Setting up the Result vector
    Res=zeros(1,Leng);
    %Calculating the linear correlation vector for the Length calculated before  
    for i=1:Leng
        C=An.*Bn;
        Res(1,i)=sum(C);
        Bn=[0 Bn(1:1:Leng-1)];
    end
end