function [ sim ] = Similarity( a,r,n,m,x )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
  %{ calculation of sim(a,u) %}

 s1=0;
q=0;
 q2=0;
 sim=zeros(1,n);
    for i=1:n
         for j=1:m
            if(x~=i && a(x,j)>0 && a(i,j)>0)  %%%%%% the set of items which are rated by both of the users a and u
            s1=s1+r(x,j)*r(i,j);
            end
         end
        for j=1:m
            if(x~=i && a(x,j)>0 && a(i,j)>0 )
                q=q+r(i,j)*r(i,j);
            end
         end
    q=sqrt(q);
     for j=1:m
        if(x~=i && a(x,j)>0 && a(i,j)>0)
                q2=q2+r(x,j)*r(x,j);
        end
    end
    q2=sqrt(q2);
        if(q~=0 && q2 ~=0)
    sim(i)=s1/(q*q2);
        end
    s1=0;
    q=0;
    q2=0;
    end

end

