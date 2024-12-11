function [D,S,way_new,P,MIN_way] = Dijkstra(kvoXY,ves)
P = zeros(1,kvoXY);
P(:) = 1;
S = zeros(1,kvoXY);
D = zeros(1,kvoXY);
S(1,1) = 1;
%алгоритм Дейкстры
for j = 1:1:kvoXY
D(j) = ves(1,j);
end
w = 1;
for i=2:1:kvoXY
MINIM = inf;
for j=1:1:kvoXY
work = 1;
for iS=1:1:kvoXY
if S(iS) == j
% Если массив S содержит индекс текущего столбца, то не
% обрабатываем
work = 0;
break;
end
end
if (D(j) < MINIM) && (D(j) ~= 0) && (work == 1) 
MINIM = D(j);
w = j;
S(i) = j;
end
end
for j=1:1:kvoXY
if ves(w,j) ~= 0
work = 1;
for iS=1:1:kvoXY
if S(iS) == j
% Если массив S содержит индекс текущего столбца, то не
% обрабатываем
work = 0;
break;
end
end
if work == 1 
if (D(w) + ves(w,j)) < D(j)
P(j) = w;
end
D(j) = min(D(j),D(w) + ves(w,j)); 
end
end
end
end
%создание матрицы вершин кратчайшего пути
y = 1;
way(y) = size(P,2);
y = y + 1;
way(y) = P(size(P,2));
p = P(size(P,2));
while p > 1
y = y + 1;
way(y) = P(p);
p = P(p);
end
u = 1;
for y = size(way,2):-1:1
way_new(u) = way(y);
u = u + 1;
end 
MIN_way = zeros(1,size(way_new, 2)-1);
for u = 1:1:size(way_new,2) - 1
MIN_way(u) = ves(way_new(u),way_new(u + 1));
end
end