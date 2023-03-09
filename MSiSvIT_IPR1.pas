##
procedure m_print(m: array [,] of integer; msize: integer);
begin
  for var i := 0 to msize - 1 do
  begin
    for var j := 0 to msize - 1 do
      $'{m[i,j], 4:d}'.Print;
    Writeln;
  end
end;

procedure m_swap(m: array [,] of integer; msize: integer; imin: integer; imax: integer);
begin
  var temp: integer;
  for var i := 0 to msize - 1 do
  begin
    temp := m[i, imin];
    m[i, imin] := m[i, imax];
    m[i, imax] := temp;
  end;
end;

var (msize, emin, emax, imin, imax) := (7, 0, 0, 0, 0);
var m: array [,] of integer := new integer[msize, msize];
for var i := 0 to msize - 1 do
  for var j := 0 to msize - 1 do
  begin
    m[i, j] := Random(-50, 50);
    if (i + j = msize - 1) then
      if (emin > m[i, j]) then
      begin
        emin := m[i, j];
        imin := j;
      end
      else if (emax < m[i, j]) then
      begin
        emax := m[i, j];
        imax := j;
      end;
  end;
$'Исходный массив: '.Println;
m_print(m, msize);
Writeln;
$'Минимальный: {emin} в стобце {imin + 1}, максимальный: {emax} в столбце {imax + 1}.'.Println;
Writeln;
m_swap(m, msize, imin, imax);
$'Результирующий массив: '.Println;
m_print(m, msize); 
