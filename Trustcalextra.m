%a=[0 2 0 5 0;
 %  0 2 3 4 0;
  % 5 0 0 1 3;
   %4 5 2 1 0;
   %0 1 5 2 4];

%b=[0 1 0 0 1;
 %  0 0 1 0 0;
  % 0 1 0 1 1;
   %1 0 1 0 0;
   %1 0 1 0 1];
%m=5;
%x=4;
%n=5;
%req=2;
[a]=Initialization();
load trustnetwork.mat;
for i=1:355754
    if(trustnetwork(i,2)<=7000 && trustnetwork(i,1)<=1000)
        b(trustnetwork(i,1),trustnetwork(i,2))=1;
    end
end
n=998;
m=6962;
x=2;
req=11;
noi=zeros(1,n);
c=0;
sumnoi=0;
for i=1:n
    c=0;
    for j=1:m
        if(a(i,j)>0)
            c=c+1;
        end
    end
    noi(i)=c;
    sumnoi=sumnoi+noi(i);
end
avgnoi=sumnoi/n;
av=zeros(1,n);
for i=1:n
    if(noi(i)<avgnoi)
        av(i)=noi(i)/avgnoi;
    else
        av(i)=1;
    end
end
%%%%Calculating Competence
COMP=zeros(1,n);
mini=0;
maxi=0;
for i=1:n
    recset=0;
    corset=0;
    for j=1:m
        if(i~=x && a(x,j)>0 && a(i,j)>0)
            recset=recset+1;
            if(abs(a(x,j)-a(i,j))==0)
                corset=corset+1;
            elseif(abs(a(x,j)-a(i,j))<=1)
                mini=min(a(x,j),a(i,j));
                maxi=max(a(x,j),a(i,j));
                corset=corset+mini/maxi;
            end
        end
    end
    COMP(i)=av(i)*(corset/recset);
end

%%%% Calculating Trustworthiness
 %%% Calculating Indegree - Directly Linked
 ind=zeros(1,n);
 TW=zeros(1,n);
 for i=1:n
     c=0;
     for j=1:n
         if(b(j,i)==1)
             c=c+1;
         end
     end
     ind(i)=c;
 end

 indw=0;
 for i=1:n
     if(x~=i && b(x,i)==1 )
     indw=indw+ind(i);
     end
 end
 
 for i=1:n
     if(x~=i)
     TW(i)=ind(i)/indw;
     end
 end

 %%%%% Final TRUST
 
 TRUST=zeros(1,n);
 
 for i=1:n
     TRUST(i)=(COMP(i)*2+TW(i))/3;
 end
     
     
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
 

    p=0;
    q=0;
    tio=0;
        for i=1:n
            if(a(i,req)>0 && i~=x)
            tio=(a(i,req)-avg(i));
           p=p+TRUST(i)*tio;
           %q=q+TRUST(i);
            end
         end 
    pred=avg(x) + (p) ; %%%%% Initial Rate Prediction
    
    pred
  
    %%%% TOP 3 RECOMMENDATIONS
TEST=zeros(1,m);

for given=1:m
    TEST(given)=a(x,given);
end

   [SV,SI]=sort(TEST(:),'descend'); %%% sorting in descending order on the basis of indices
   maxindex=SI(1:3);
        
   %%%%%%%%%% Finding SAI
   sai=zeros(1,3);
   prednew=zeros(1,5);
   
for j=1:3
   for i=1:n
        if( a(i,maxindex(j))>0 && i~=x )
           sai(j)=sai(j)+TRUST(i);
         end
   end 
   
    p=0;
    q=0;
    tio=0;
        for i=1:n
            if(a(i,maxindex(j))>0 && i~=x)
            tio=(a(i,maxindex(j))-avg(i));
           p=p+TRUST(i)*tio;
           %q=q+TRUST(i);
            end
         end 
    prednew(maxindex(j))=avg(x) + (p) ; %%%%% Initial Rate Prediction
    
 
%%%%%%% Finding VAI
er=0;
for i=1:n
    if(a(i,maxindex(j))>0 && i~=x)
        er=er+(TRUST(i)*(a(i,maxindex(j))-avg(i)-prednew(maxindex(j))+avg(x))*(a(i,maxindex(j))-avg(i)-prednew(maxindex(j))+avg(x)));
        
    end
    
end
q=0;

for i=1:n
    if(a(i,maxindex(j))>0 && i~=x)
        q=q+TRUST(i);
    end
end
vai(j)=er/q;
end
sair=sort(sai);
sbar=sair(2);
vair=sort(vai);
vbar=vair(2);

REL=check(a,TRUST,avg,req,x,n,m,pred,sbar,vbar);
REL
 