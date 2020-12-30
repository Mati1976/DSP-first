function Res=lconv(A ,B);
%The lconv function calculate the linear concolution of two vectors
%The input will be two vectos A and B

    %calculating the length of the resulting 
    Leng=length(A)+length(B)-1; 
    %Padding the A vector 
    An=[zeros(1,length(B)-1) A];
    %Creating a new vector Br (The B(-n) vector)
    Br=B(1,length(B):-1:1);
    %Padding the reversed B vector 
    Bn=[Br  zeros(1,length(A)-1)];
    %Setting up the Result vector
    Res=zeros(1,Leng);
    %Calculating the linear convoultion vector for the Length calculated before  
    for i=1:Leng
        C=An.*Bn;
        Res(1,i)=sum(C);
        Bn=[0 Bn(1:1:Leng-1)];
    end
end