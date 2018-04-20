function [ TRUST ] = TRUST( b,n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
d=sparse(b);
da=zeros(1,n);
ts=30057;
damax=log(n)/(log(ts/n)) ;

[ra]=graphallshortestpaths(d);

for i=1:n
    for j=1:n
        if((damax+1)>=ra(i,j))
    TRUST(i,j)=((damax-ra(i,j)+1)/damax);
        else
            TRUST(i,j)=0;
        end
    end
    TRUST(i,i)=0;
end
end


