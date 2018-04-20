function [ rep ] = Reputation(a,b,TRUST,n,m,x)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    %%%% Calculating reputation and experience
     v=0;
     c=0;
     Tavg=zeros(1,n);
     for i=1:n
         v=0;
         c=0;
         for j=1:n
            if(b(j,i)==1)
                 v=v+TRUST(j,i);
                 c=c+1;
            end
         end
          Tavg(i)=v/c;
          if(c==0)
              Tavg(i)=0;
          end
     end
    
     noi=zeros(1,n);
     for i=1:n
         c=0;
         for j=1:m
             if( a(i,j)>0)
                 c=c+1;
             end
         end
         noi(i)=c;
     end
     
     maxnoi=max(noi);
     
     exp=zeros(1,n);
     rep=zeros(1,n);
     for i=1:n
        exp(i)=noi(i)/maxnoi;
        
        if(exp(i)==0 && Tavg(i)~=0)
            rep(i)=Tavg(i);
        elseif(exp(i)~=0 && Tavg(i)==0)
            rep(i)=exp(i);
        elseif((exp(i) + Tavg(i))==0)
            rep(i)=0;
        else
        rep(i)=(2*exp(i)*Tavg(i))/(exp(i)+Tavg(i));
        end
     end
end

