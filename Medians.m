function [sbar,vbar,sai,vai] = Medians(a,avg,k,pred,n,m,x)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
     %%%%%%%%%% Finding SAI
   sai=zeros(1,m);
   vai=zeros(1,m);
   c=0;
for j=1:m  
   for i=1:n
        if( a(i,j)>0 && i~=x )
           sai(j)=sai(j)+k(i);  
         end
   end 
   
%%%%%%% Finding VAI
    er=0;
        for i=1:n 
              if(a(i,j)>0 && i~=x)
                    er=er+(k(i)*(a(i,j)-avg(i)-pred(j)+avg(x))*(a(i,j)-avg(i)-pred(j)+avg(x)));
              end   
        end
    q=0;

        for i=1:n
            if(a(i,j)>0 && i~=x)
                q=q+k(i);
            end
        end
        
        if(q~=0)
             vai(j)=er/q;
        else
            vai(j)=0;
        end
        
end
size=0;
co=0;
for j=1:m
    if(vai(j)>0)
        size=size+1;
        co=co+vai(j);
    end
end
vbar=co/size;
size=0;
co=0;
for j=1:m
    if(sai(j)>0)
        size=size+1;
        co=co+vai(j);
    end
end
sbar=co/size;
end

