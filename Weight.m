function [ k] = Weight(TRUST,sim,rep,n,x)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
     %{ calculation of weight %}
w=zeros(1,n);
k=zeros(1,n);
for i=1:n
        if((TRUST(x,i)+sim(i)+rep(i))==0)
            w(i)=0;
        elseif(TRUST(x,i)==0 && sim(i)~=0 && rep(i)~=0)
        w(i)=((2*sim(i)*rep(i))/(sim(i)+rep(i)));
        
        elseif(TRUST(x,i)~=0 && sim(i)==0 && rep(i)~=0)
            w(i)=((2*rep(i)*TRUST(x,i))/(rep(i)+TRUST(x,i)));
            
            elseif(TRUST(x,i)~=0 && sim(i)~=0 && rep(i)==0)
            w(i)=((2*sim(i)*TRUST(x,i))/(sim(i)+TRUST(x,i)));
            
         elseif(TRUST(x,i)==0 && sim(i)==0 && rep(i)~=0)
            w(i)=rep(i);
            
            elseif(TRUST(x,i)==0 && sim(i)~=0 && rep(i)==0)
            w(i)=sim(i);
            
            elseif(TRUST(x,i)~=0 && sim(i)==0 && rep(i)==0)
            w(i)=TRUST(x,i);
            
        else
            w(i)=((3*rep(i)*TRUST(x,i)*sim(i))/(sim(i)+rep(i)+TRUST(x,i)));
            
        end
        if(w(i)>0)
        k(i)=w(i);
         else
        k(i)=0;
        end
    
end

end

