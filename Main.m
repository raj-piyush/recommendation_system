load Initialization-a.mat
load Initialization-b.mat
load average.mat;
load netrate.mat;

z=1;
n=10;
m=40;


            
            


l=0;
MAE=zeros(1,100);
x=1;
%[avg,r]=Average(a,n,m);
[TRUST]=Trust(b,n);
[rep]=Reputation(a,b,TRUST,n,m,x);
[sim]=Similarity(a,r,n,m,x);    
[k]=Weight(TRUST,sim,rep,n,x); 
[pred]=Initialpred(a,avg,k,n,m,x);
[sbar,vbar,sai,vai]=Medians(a,avg,k,pred,n,m,x);
[rel]=Reliability(a,avg,k,pred,n,m,x,sai,vai,sbar,vbar);
you=0;
c=0;

for i=1:m
    if(a(x,i)>0 && rel(i)>0)
        you=you+abs(a(x,i)-pred(i));
        c=c+1;
    end
end
MAE=you/c;
