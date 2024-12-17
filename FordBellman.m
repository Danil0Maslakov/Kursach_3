function [distances, predecessors] = FordBellman(ves)
    % Алгоритм Форда-Беллмана для поиска кратчайших путей от первой вершины
    % ves          - Матрица весов графа
    % distances    - Массив кратчайших расстояний от начальной вершины
    % predecessors - Одномерный вектор предшественников для восстановления пути

    % Количество вершин
    numNodes = size(ves, 1);

    % Инициализация
    distances = inf(1, numNodes); % Кратчайшие расстояния до всех вершин
    distances(1) = 0;             % Расстояние до начальной вершины
    predecessors = -1 * ones(1, numNodes); % Предыдущие вершины

    % Алгоритм Форда-Беллмана
    for i = 1:numNodes-1
        for u = 1:numNodes
            for v = 1:numNodes
                if ves(u, v) ~= 0 % Если есть ребро u -> v
                    if distances(u) + ves(u, v) < distances(v)
                        distances(v) = distances(u) + ves(u, v);
                        predecessors(v) = u;
                    end
                end
            end
        end
    end

    % Проверка на отрицательные циклы
    for u = 1:numNodes
        for v = 1:numNodes
            if ves(u, v) ~= 0 && distances(u) + ves(u, v) < distances(v)
                error('Граф содержит отрицательный цикл');
            end
        end
    end
    predecessors=unique(predecessors);
    predecessors(1) = [];
    predecessors(numNodes-1)=numNodes;
end