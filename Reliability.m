function [rel] = Reliability(a,avg,k,pred,n,m,x,sai,vai,sbar,vbar)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
%{ finding reliability %}

for j=1:m
    fsai=sai(j)/(sai(j)+sbar);

    %min=minrate(a,n,m);
    %max=maxrate(a,n,m);
    min=1;
    max=5;
    gh=(max-min+vbar)/(max-min);
    la=log(0.5)/log(gh);
    fvai=((max-min+vai(j))/(max-min))^la  ; %{ negative factor %}
    forpow=1/(1+fsai);
    rel(j) = (fsai*(fvai^fsai))^forpow;
end

end

