function grafic(kvoXY,XY,ves,way_new)
hold on
%Построение графика графа перемещений
for i=1:1:kvoXY
for j=i+1:1:kvoXY
if ves(i,j)~=inf
X(1,1)=XY(i,1);
X(1,2)=XY(j,1);
Y(1,1)=XY(i,2);
Y(1,2)=XY(j,2);
plot(X(1,:), Y(1,:), 'g');
end
end
end
%прорисовка кратчайшего пути
u = 1;
X = zeros(1,size(way_new,2));
Y = zeros(1,size(way_new,2));
while u < size(way_new,2) + 1
X(u) = XY(way_new(u), 1);
Y(u) = XY(way_new(u), 2);
u = u + 1;
end
plot(X,Y,'o-'); grid on; 
%прорисовка всех вершин 
for q = 1:size(XY,1)
h = plot(XY(q,1),XY(q,2));
text(XY(q,1),XY(q,2), num2str(q));
set(h, 'Marker', '.', 'Color', [1 0 0]);
end 
hold off 
end