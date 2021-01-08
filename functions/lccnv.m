function Res=lccnv(A ,B);
%The lccnv function calculate the circular convolution of two correctly
%zero padded vectors
%The vectors will be paddedwith zeros in the end so that thier total length
%will be length(A)+length(B)-1, by doing so the circular convolution will
%give us the same result as the linear one
%The input will be two vectos A and B

    %calculating the length of the resulting 
    %Padding wih zeros the A vector so that the totall length will be
    %length(A)+length(B)-1
    An=[A zeros(1,length(B)-1)];
    %Padding with zeros the B vector so that the totall length will be
    %length(A)+length(B)-1
    Bn=[B zeros(1,length(A)-1)];
    %calculating the circular convolution of the zero-padded vectors 
    Res=ccnv(An,Bn);
    
end