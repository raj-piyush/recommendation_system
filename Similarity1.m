function [ sim ] = Similarity1( a,r,n,m,x )
sim=zeros(1,n);
sim1=zeros(1,n);
sim2=zeros(1,n);
%{
for i=1:n
    common=0;
    union=0;
    for j=1:m
        if(a(1,j)~=0 && a(i,j)~=0)
            common=common+1;
            union=union+1;
        elseif(a(1,j)==0 && a(i,j)==0)
            continue;
        else
            union=union+1;
        end
    end
    if(common==0)
        sim1(1,i)=0;
    else
        sim_curr=common/union;
        sim1(1,i)=sim_curr;
    end
        
    
end
%}


for i=1:n
    temp=0;
    common1=0;
    for j=1:m
        if(a(1,j)~=0 && a(i,j)~=0)
            mins=min(a(1,j),a(i,j));
            maxs=max(a(1,j),a(i,j));
            temp1=mins/maxs;
            temp=temp+temp1;
            common1=common1+1;
        end
    end
    if(common1==0)
        sim2(1,i)=0;
    else
        sim_curr1=temp/common1;
        sim2(1,i)=sim_curr1;
    
    
    end
end

for i=1:n
    sim(1,i)=sim2(1,i);
end


end
            

                
        
        
                

