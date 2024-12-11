function [XX] = hour(ves,way_new,i)
XX = fix(ves(way_new(i),way_new(i + 1)));
end 