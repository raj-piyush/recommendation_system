function [ max ] = maxrate( a,p,q )
max=0;
    for i=1:p
        for j=1:q
            if(a(i,j)>max)
                max=a(i,j);
            end
        end
    end
end

