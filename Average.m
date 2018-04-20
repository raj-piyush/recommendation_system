function [ avg,r ] = Average(a,n,m )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
avg=zeros(1,n);
    for i=1:n
    sum=0;
    count=0;
        for j=1:m
        sum=sum+a(i,j);
            if(a(i,j)>0)
                count=count+1;
            end
        end
    avg(i)=sum/count;
    sum=0;
    count=0;
    end

r=zeros(1,n);
    for i=1:n
        for j=1:m
            if(a(i,j)>0)  %%%%%% Taking persons into account who actually matters
                r(i,j)=a(i,j)-avg(i);
            end
        end
    end
end

