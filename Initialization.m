function [ a ] = Initialization()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
load rating.mat ;
edit rating.mat ;
for i=1:284086
    if(rating(i,1)<=999 && rating(i,2)<=3500)
        a(rating(i,1),rating(i,2))=rating(i,4);
    end
end

end

