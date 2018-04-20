load Meantill100r=0.5.mat;
MAES=0;
for i=1:100
    if(MAE(i)>0)
    MAES=MAES+MAE(i);
    end
end
MAES/100