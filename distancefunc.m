function [DD] = distancefunc(XY,way_new,i,masshtab)
DD = sqrt(((XY(way_new(i+1),1))*masshtab - (XY(way_new(i),1))*masshtab)^2 + ((XY(way_new(i+1),2))*masshtab - (XY(way_new(i),2)*masshtab))^2);
end