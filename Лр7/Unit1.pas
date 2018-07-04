//������������ ������ 7
//27. ���� ��� ������������������ ����� �1, �2, �, �n � b1, b2, �, bn.
//������� ���������� ��� �i, bi, (i = 1, n) �����, ��� ��� ����� � ���� ������.

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Button2: TButton;
    Label2: TLabel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  tmas=array[0..100] of integer;

var
  Form1: TForm1;
  a,b:tmas;
  n:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var
    i:integer;
    f:textfile;
begin
  if OpenDialog1.Execute then
  begin
    assignfile(f,OpenDialog1.FileName);
    reset(f);
    readln(f,n);
    Label2.Caption:='���-�� ��������� ������� = '+inttostr(n);
    StringGrid1.ColCount:=n+1;
    For i:=1 to StringGrid1.ColCount do
    begin
      StringGrid1.Cells[i,0]:=inttostr(i);        //�������� ������ �������
      read(f,a[i]);                               //�������� ������ ������
      StringGrid1.Cells[i,1]:=inttostr(a[i]);     //������� �������� ������� � ������
    end;
  closefile(f);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
Var
  i,kol:integer;
begin
  kol:=0;
  For i:=1 to n do
    if(a[i] mod 2 = 0)and(b[i] mod 2 = 0)then       //������� ���������� ������ ���
                                             kol:=kol+1;
  Label1.Caption:='���-�� ������ ��� = '+inttostr(kol);  //����� ����������
end;

procedure TForm1.Button3Click(Sender: TObject);
Var
    i,m:integer;
    f:textfile;
begin
  if OpenDialog1.Execute then
  begin
    assignfile(f,OpenDialog1.FileName);
    reset(f);
    readln(f,m);
    StringGrid1.ColCount:=m+1;
    For i:=1 to StringGrid1.ColCount do
    begin
      StringGrid1.Cells[i,0]:=inttostr(i);         //�������� ������ �������
      read(f,b[i]);                                //�������� ������ ������
      StringGrid1.Cells[i,2]:=inttostr(b[i]);      //������� �������� ������� � ������
    end;
  closefile(f);
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 StringGrid1.Cells[0,1]:='A';
 StringGrid1.Cells[0,2]:='B';
end;

end.

