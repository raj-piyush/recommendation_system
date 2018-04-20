function [k] = Faltunew(t,sim,rep,n)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
     %{ calculation of weight %}
w=zeros(1,n);
k=zeros(1,n);
rep(1)=0;
for i=1:n
        if(t(1,i)==0 && sim(i)~=0)
        w(i)=sim(i);
        
         elseif(sim(i)==0 && t(1,i)~=0)
            w(i)=t(1,i);
            
         elseif((t(1,i)+sim(i))~=0)
          w(i)=((2*sim(i)*t(1,i))/(sim(i)+t(1,i)));
 
         else
             w(i)=0;
        end
        if(w(i)>0)
        k(i)=w(i);
         else
        k(i)=0;
        end
    
end

end

