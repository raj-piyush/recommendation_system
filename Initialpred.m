function [ pred ] = Initialpred(a,avg,k,n,m,x)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
pred=zeros(1,m);

for j=1:m
p=0;
q=0;
tio=0;
    for i=1:n
        if(a(i,j)>0 && i~=x)
             tio=(a(i,j)-avg(i));
             p=p+k(i)*tio;
             q=q+k(i);
         end
    end
pred(j)=avg(x) + (p/q) ; %%%%% Initial Rate Prediction
    if(q==0)
        pred(j)=avg(x);
    end
    if(pred(j)>5)
        pred(j)=5;
    elseif(pred(j)<0)
        pred(j)=0;
    end
end 
end

