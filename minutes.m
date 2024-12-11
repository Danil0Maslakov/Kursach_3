function [YY] = minutes(ves,way_new,i,XX)
YY = (ves(way_new(1,i),way_new(1,i + 1)) - XX) * 60;
end