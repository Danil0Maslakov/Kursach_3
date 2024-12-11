function NMEA(way_new,ves,masshtab,XY)
%формирование NMEA сообщений
file = fopen('NMEA.txt','w');
for i = 1:size(way_new,2) - 1
[XX] = hour(ves,way_new,i); 
[YY] = minutes(ves,way_new,i,XX);
[DD] = distancefunc(XY,way_new,i,masshtab);
[ZZ] = azimut(XY,way_new,i);
if ((i == 1) && (ZZ ~= 0))
S1 = 'T';
else
if (ZZ ~= ZZ2)
S1 = 'T';
else 
S1 = 'N';
end
end
if (i ~= size(way_new,2) - 1)
S2 = 'N';
else
S2 = 'E';
end
fprintf(file,'$UTHDG,%d,%.1f,%.2f,%c,%.1f,%c\r\n',XX,YY,DD,S1,ZZ,S2);
fprintf('$UTHDG,%d,%.1f,%.2f,%c,%.1f,%c\n',XX,YY,DD,S1,ZZ,S2);
ZZ2 = ZZ;
end