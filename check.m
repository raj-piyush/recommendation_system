function [ rel] = check(a,k,avg,req,x,n,m,pred,sbar,vbar)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%{ initial rate prdiction %}


%{ finding reliability %}

for j=1:m
    q=0;
        for i=1:n
            if( a(i,j)>0 && i~=x )
                q=q+k(i);
            end
        end 

    sai=q;
    fsai=sai/(sai+sbar);

    min=minrate(a,n,m);
    max=maxrate(a,n,m);

    gh=(max-min-vbar)/(max-min);

    la=log(0.5)/log(gh);

    er=0;
    for i=1:n
        if(a(i,j)>0 && i~=x)
             er=k(i)*(a(i,j)-avg(i)-pred(j)+avg(x))*(a(i,j)-avg(i)-pred(j)+avg(x));
        end
    end 
    vai=er/q;
    fvai=((max-min-vai)/(max-min))^la  ; %{ negative factor %}
    forpow=1/(1+fsai);
    rel(j) = (fsai*(fvai^fsai))^forpow;
end
end

