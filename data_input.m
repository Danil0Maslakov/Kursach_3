function [speed, XY,masshtab,time_work_akum,time_zarad] = data_input()
% fid = fopen('Координаты заправок.txt','r');
% fid идентификатор
if exist('coord.txt','file') == 0
    fprintf('Файл не существует, был создан новый.');
    fid = fopen('coord.txt','w');
    fprintf(fid,'Исходные данные вариант 19:\r\n');
    speed = input('Введите скорость: ');
    fprintf(fid,'%d\r\n',speed);
    time_work_akum = input('Введите время работы аккумулятора: ');                  
    fprintf(fid,'%d\r\n',time_work_akum);
    time_zarad = input('Введите время зарядки: ');
    fprintf(fid,'%d\r\n',time_zarad);
    masshtab = input('Масштаб сетки: ');
    fprintf(fid,'%d\r\n',masshtab);
    s = input('Далее массив координат заправок X Y (координаты X Y через пробел, неограниченное количество.',"s");
    fprintf(fid,"%s\r\n",s);
    % s - вектор символов или массив строк. Тип синтезируемого текста совпадает с типом formatSpec.
    fclose(fid); 
    return;
end 

fid = fopen('coord.txt','r');
%первую строку не читаем
fgets(fid);
speed = fscanf(fid,'%d,\r\n');
fgets(fid);
time_work_akum = fscanf(fid,'%f,\r\n');
fgets(fid);
time_zarad = fscanf(fid,'%d,\r\n');
%переведем из минут в часы
time_zarad = time_zarad/60;
fgets(fid);
masshtab = fscanf(fid,'%d,\r\n');
time = input('Введите начальное время: ');
x0 = input('Введите начальное значение x: ');
y0 = input('Введите начальное значение y: ');
xEnd = input('Введите конечное значение x: ');
yEnd = input('Введите конечное значение y: ');
XY0(1,1) = x0;
XY0(1,2) = y0;
XYEnd(1,1) = xEnd;
XYEnd(1,2) = yEnd;
fgets(fid);
XY = fscanf(fid,'%d %d\n\r',[2,Inf]);
fclose(fid);
XY = XY.';
XY = [XY0(1,:);XY(:,:)];
XY = [XY(:,:);XYEnd(1,:)];
end 