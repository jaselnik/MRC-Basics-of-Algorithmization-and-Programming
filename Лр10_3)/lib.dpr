//������������ ������ 10
//������� 27
//
//27. ��� ������ �, ��������� �� n ����������� �����.
//�������� ��������, ������������� ����� ������ ����.
//
//���������� : �������� �. �. , ��. 62492
library lib;

{ ��� ��������� ����� }

uses
  SysUtils,
  Classes;

{$R *.res}
type
    tmas = array[0..100] of integer;

Procedure polychit(fname:string; Var a:tmas; Var n:integer; Var out_message:string); stdcall; export;
Var
    i:integer;
    f:textfile;
Begin
    assignfile(f,fname);
    reset(f);
    //assignfile(t,'res.txt');
    //rewrite(t);
    readln(f,n);
    for i:=1 to n do
      read(f,a[i]);
    out_message:='������ ���������!';
    //writeln(t,n);
    //for i:=1 to n do
    //  write(t,a[i],' ');
    closefile(f);
    //closefile(t);
end;

Procedure analiz(a:tmas; Var b:tmas; Var c:tmas; n:integer; Var m:integer; Var out_message:string);  stdcall; export;
Var
    i,j:integer;
    f:boolean;
Begin
  m:=1;
  i:=1;
  f:=true;
  b[1]:=a[1];
  c[1]:=0;

  For i:=1 to n do
  begin
    f:=true;                //������������� ����
    For j:=1 to m do        //����������:���� �� ������� � ������� b
      if b[j]=a[i] then
      begin
        f:=false;           //����� �������� ����� , ���� ������ ������� ������� ��� ���
        c[j]:=c[j]+1;       //����������� ���-�� ���������� ����� ���������
        break;
      end;
    if f then               //���� ���� = TRUE , ������ �� �� ��������� ����� ������� ���
    begin
      m:=m+1;
      b[m]:=a[i];           //������� ����� ������� � ������ b
      c[m]:=1;
    end;
   end;
   out_message:='������ ������� �������!';
end;

Procedure vivod(b:tmas; c:tmas; m:integer; Var out_message:string);  stdcall; export;
var
    i:integer;
    f:textfile;
begin
  assignfile(f,'output.txt');
  rewrite(f);
  For i:=1 to m do
    if c[i]>1 then      //����� ��������� , ������� ����������� ����� ������ ����
    begin
      write(f,b[i],' ');
    end;
  out_message:='��������� ��������� � ����� ';
  closefile(f);
end;
exports   vivod, analiz, polychit;

begin
end.
 