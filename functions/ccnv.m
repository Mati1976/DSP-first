function Res=ccnv(A ,B);
%The ccnv function calculate the circular concolution of two vectors
%The input will be two vectos A and B of the same size
    
    %Creating a new vector Br (The B(-n) vector)
    Br=B(1,length(B):-1:1);
    %creating the circular version of Br
    Br=[B(1) Br(1:1:length(Br)-1)];
    %Setting up the Result vector
    Res=zeros(1,length(A));
    %Calculating the circular convoultion vector for the length of both vectors  
    for i=1:length(Br)
        C=A.*Br;
        Res(1,i)=sum(C);
        Br=[Br(length(Br)) Br(1:1:length(Br)-1)];
    end
end
