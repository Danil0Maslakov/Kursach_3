function [MIN_way, way_new] = Floyd(ves)
    % ves - матрица весов
    % start - номер начальной вершины (строка)
    start=1;
    % Инициализация
    n = size(ves, 1);                % Количество вершин
    MIN_way = ves(start, :);         % Изначально берем строку стартовой вершины
    way_new = 1:n;                 % Индексы пути (по умолчанию конечные вершины)
    
    % Если вес 0 и вершины не совпадают, ставим бесконечность
    INF = 1e9;                       % Используем большое значение вместо бесконечности
    MIN_way(MIN_way == 0 & (1:n) ~= start) = INF;
    
    % Основной алгоритм
    for k = 1:n
        for j = 1:n
            if MIN_way(j) > MIN_way(k) + ves(k, j)
                MIN_way(j) = MIN_way(k) + ves(k, j);
                way_new(j) = k; % Сохраняем промежуточный индекс
            end
        end
    end
    way_new(j+1)=k;
    way_new = unique(way_new);
    
    % Заменяем бесконечность на 0 для недостижимых вершин
    MIN_way(MIN_way == INF) = 0;
end






% function [MIN_way,way_new] = Floyd(ves)
% n = size(ves);
% MIN_way = ves;
% way_new = NaN(n);
% 
% % матрца пути
% for i = 1:n
%     for j = 1:n
%         if ves(i,j)<Inf && i~=j
%             way_new(i,j) = i;
%         end
%     end
% end
% 
% for k = 1:1:10
%     for i=1:1:10
%         for j=1:1:10
%             node = min(ves(i,j), ves(i,k) + ves(k,j));
%             MIN_way(i,j) = node;
%         end
%     end
% end
% 
% 
% end