%Рассчитаем вес и создадим матрицу смежности
function [mat_sme,ves,kvoXY] = weights(XY,masshtab,speed,time_work_akum, time_zarad)
kvoXY = length(XY);
ves = zeros(kvoXY); %нулевая матрица размера kvoXY
mat_sme = zeros(kvoXY);
ves(:,:) = inf;
for ii = 1:kvoXY
Xn = XY(ii,1)*masshtab;
Yn = XY(ii,2)*masshtab;
for t = ii : kvoXY
distance = sqrt((XY(t,1)*masshtab - Xn)^2 + (XY(t,2)*masshtab-Yn)^2)/speed;
if (distance < time_work_akum) && (distance > 0)
mat_sme(ii,t) = 1; %на пересечении ставим 1 => ребро существует
ves(ii,t) = distance + time_zarad;
elseif distance == 0
ves(ii,t) = 0;
mat_sme(ii,t) = 0;
else
ves(ii,t) = inf;
mat_sme(ii,t) = 0;
end
end
end 
end