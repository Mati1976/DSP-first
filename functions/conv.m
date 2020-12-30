function res=conv(a , b);

    Leng=length(a)+length(b)-1;
    an=[zeros(1,length(b)-1) a];
    br=b(1,length(b):-1:1);
    bn=[br  zeros(1,length(a)-1)];
    res=zeros(1,Leng);
    for i=1:Leng
        c=an.*bn;
        res(1,i)=sum(c);
        bn=[0 bn(1:1:Leng-1)];
    end
end