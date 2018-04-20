function [ min ] = minrate( a,p,q )

	min=100000;
	for i=1:p
		for j=1:q
			if(a(i,j)>0&&a(i,j)<min)
                min=a(i,j);
            end
        end
    end
end