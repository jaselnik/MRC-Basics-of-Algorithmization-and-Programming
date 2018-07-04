program qsort;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Var
    a:array[1..1000]of integer ;
    i,n:integer;
    f1,f2:text;  

procedure q_sort(l,r:longint);
var
    i,j:longint;
    tit,q:integer;
begin
  i := l;     //������� ����� �������
  j := r;     //������� ������ �������
  q := a[(l+r) div 2]; //�������� ��-� ����������
  repeat
    while (a[i] < q) do
      inc(i);          //������������� ����� ����� �������(����������� ��-�� ������� q)
    while (q < a[j]) do
      dec(j);          //������������� ����� ������ �������(����������� ��-�� ������� q)
    if (i <= j) then
    begin
          tit:=a[i];
          a[i]:=a[j];            //�����
          a[j]:=tit;
          inc(i);                //����� ������ 
          dec(j);
    end;
  until (i > j);
  if (l < j) then
                  q_sort(l,j);
  if (i < r) then
                  q_sort(i,r);
end;

begin
  { TODO -oUser -cConsole Main : Insert code here }

  assignfile(f1,'input_qSort.txt'); reset(f1);
  assignfile(f2,'output_qSort.txt'); rewrite(f2);
  read(f1,n);
  For i:=1 to n do
    read(f1,a[i]);                //�������� ������
  q_sort(1,n);                    //�������� ���������� ������� �� 1�� �� n-�� ��������
  For i:=1 to n do
    write(f2,a[i],' ');           //������� ��������������� ������
  closefile(f1);
  closefile(f2);

end.
