##
procedure m_print(m: array [,] of integer; msize: integer);
  begin
    for var i:= 0 to msize-1 do
      begin
      for var j:=0 to msize-1 do
        $'{m[i,j], 4:d}'.Print;
      Writeln;
      end
  end;
  
  procedure m_swap(m: array [,] of integer; msize:integer; imin: integer; imax: integer);
  begin
   var temp : integer;
   for var i:= 0 to msize-1 do
     begin
     temp:= m[i, imin];
     m[i, imin] := m[i, imax];
     m[i, imax] := temp;
     end;
  end;
  
var (msize, emin, emax, imin, imax) := (7, 0, 0, 0, 0);
var m: array [,] of integer := new integer [msize, msize];
for var i:= 0 to msize-1 do
  for var j:= 0 to msize-1 do
  begin
    m[i,j]:=Random(-50, 50);
    if (i + j = msize-1) and (emin > m[i,j])then
      begin
        emin:= m[i,j];
        imin:= j;
        end;
     if (i + j = msize-1) and (emax < m[i,j]) then
      begin
        emax:= m[i,j];
        imax:= j;
      end;
  end;
  
  m_print(m, msize);
  Writeln;
  Println('Минимальный элемент побочной диагонали: ', emin);
  Println('Он находится в столбце номер: ', imin + 1);
  Println('Максимальный элемент побочной диагонали: ', emax);
  Println('Он находится в столбце номер: ', imax + 1);
  Writeln;
  
  m_swap(m, msize, imin, imax);
  (imin, imax) := (imax, imin);
  
  m_print(m, msize);
  Writeln;
  Println('Минимальный элемент побочной диагонали: ', emin);
  Println('Он находится в столбце номер: ', imin + 1);
  Println('Максимальный элемент побочной диагонали: ', emax);
  Println('Он находится в столбце номер: ', imax + 1);
  
