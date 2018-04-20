function [ TRUST ] = TRUST( b,x,n )
%load Initialization-b.mat

end
function [ TRUST ] = TRUST( b,x,n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
load Initialization-b.mat
d=sparse(b);
da=zeros(1,n);
ts=30057;
damax=log(n)/(log(ts/n)) ;

for u=1:n
    
    [dist1,path1,pred1]=graphshortestpath(d,x,u,'directed',true);
    [dist2,path2,pred2]=graphshortestpath(d,u,x,'directed',true);
    if(dist2<dist1)
        dist=dist2;
    else
        dist=dist1;
    end
    da(1,u)=dist;
    if(da(1,u)==Inf)
        da(1,u)=0;
    end
end
%{calculation of t(a,u)
TRUST=zeros(1,n);
for i=1:n
    if(da(1,i)~=0)
        TRUST(1,i)=((damax-da(1,i)+1)/damax);
    else
        TRUST(1,i)=0;
    end
end
end


