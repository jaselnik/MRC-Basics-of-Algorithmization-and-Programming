//������������ ������ 14
//������
//
//27. �������� � ����������� ���������:
//-	������� �����������;
//-	�������� ������;
//-	��� ��������;
//-	���� ������;
//-	���������;
//-	�����
//
//�������� � ���������� ������� ������ ����������� �����������
//�������� �� ����������� ���� � ��������� ����� ������ � ��������
//�����, ���������� � ������ X.
//
//� ��������� ������ ���� ����������� ��������� ����-���:
//  ���� �������;
//	������������� �������;
//	�������� �������;
//	�������� ������� �� ������.
//��������� ������� ���������� � ������� ����.
//
//���������� : �������� �. �. , ��. 62492

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    StringGrid1: TStringGrid;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label1: TLabel;
    N2: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Edit8: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N12Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
  tstuff=record
          fam:string[15];    //-	������� �����������;
          otd:string[15];    //-	�������� ������;
          year:integer;    //-	��� ��������;
          stag:integer;    //-	���� ������;
          work:string[15];   //-	���������;
          cash:integer;    //-	�����
          end;


var
  Form1: TForm1;
  inst_stuff: array[1..30]  of tstuff; //������ �����������
  a:array[1..100]of integer;
  n,m,age:integer;
  inst_name:string[5];
  x:string;
  v_rowcount,v_height:integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
//�������� ������� ����������
begin
  n:=0;
  with stringgrid1 do
  begin
    ColCount:=7;
    width:=600;
    rowcount:=1;
    height:=27*2;
    ColWidths[0]:=40;
    ColWidths[1]:=100;
    ColWidths[2]:=100;
    ColWidths[3]:=100;
    ColWidths[4]:=100;
    ColWidths[5]:=100;
    ColWidths[6]:=40;
    cells[0,0]:='�����';
    cells[1,0]:='�������';
    cells[2,0]:='�����';
    cells[3,0]:='��� ��������';
    cells[4,0]:='���� ������';
    cells[5,0]:='���������';
    cells[6,0]:='�����';
  end;
end;

procedure TForm1.N4Click(Sender: TObject);
// ����������/�����
begin
  close;
end;

procedure TForm1.N2Click(Sender: TObject);
//������ � �������������� ����
// ����������/����� �����
Var
  f:file of tstuff;
  fName:string;
  i:integer;
Begin
  fName:='output.dat';
  assignfile(f,fName);
  rewrite(f);
    for i:=1 to n do
    begin
      write(f,inst_stuff[i]);
    end;
  closefile(f);
End;

procedure TForm1.N3Click(Sender: TObject);
// ����������/����� ����������� �����������
var
  sred:integer;
  f:textfile;
  i:integer;
  fname:string;
begin
  fname:='old.txt';
  assignfile(f,fname);
  rewrite(f);
  writeln(f,'���������� ���������� � ������ ',x);
  sred:=0;
  write(f,'���������� ���������� � ���� ������ : ',m);
  For i:=1 to m do
    with inst_stuff[a[i]] do
    begin
      writeln(f);
      write(f,fam,' : ',stag);
      sred:=sred+stag;
    end;
  case m of
    0:sred:=0
    else
      sred:=sred div m ;
  end;
  writeln(f);
  write(f,'������� ���� ���������� : ',sred);
  closefile(f);
end;

procedure TForm1.N6Click(Sender: TObject);
// ��������/����� ������ �����������
var
    i,j,tit:integer;
    b:boolean;
begin
  b:=true;
  m:=0;
  if (Edit2.Text='') then begin
                               ShowMessage('�� ������ ������� �����!');
                               exit;
                          end;
  x:=Edit2.Text;             // �����
  age:=strtoint(Edit8.Text); // �������
  for i:=1 to n do     //�������� ������ ������� �����������
    with inst_stuff[i] do
      if otd=x then       //���������� ������
      begin
        b:=false;
        if (2018-year)>=age then //����������� ��������
        begin
          m:=m+1;
          a[m]:=i;
        end;
      end;
  if b then
  begin
    ShowMessage('��� ���������� ������!');
    exit;
  end;
            
  //��������� �� �������� ������ �����
  for i:=1 to m-1 do
    for j:=i+1 to m do
      if inst_stuff[i].fam<inst_stuff[j].fam then
      begin
        tit:=a[i];
        a[i]:=a[j];
        a[j]:=tit;
      end;
end;

procedure TForm1.N10Click(Sender: TObject);
// ��������/���������� ������
Var
  f:file of tstuff;
begin
  if (Edit1.Text = '')or
     (Edit2.Text = '')or
     (Edit3.Text = '')or
     (Edit4.Text = '')or
     (Edit5.Text = '')or
     (Edit6.Text = '')then
  begin
    ShowMessage('�� �� ����� ��� ��������������!');
    exit;
  end;
  n:=n+1;
  with inst_stuff[n] do
  begin
    fam:=Edit1.Text;
    otd:=Edit2.Text;
    year:=strtoint(Edit3.Text);
    stag:=strtoint(Edit4.Text);
    work:=Edit5.Text;
    cash:=strtoint(Edit6.Text);
  end;

end;

procedure TForm1.N9Click(Sender: TObject);
// ��������/�������� ������� �� ������
Var
  i:integer;
begin
  stringgrid1.RowCount:=n+1;
  stringgrid1.height:=27*(n+2);
  for i:=1 to n do
  begin
    with stringgrid1,inst_stuff[i] do
    begin
      cells[0,i]:=inttostr(i);
      cells[1,i]:=fam;
      cells[2,i]:=otd;
      cells[3,i]:=inttostr(year);
      cells[4,i]:=inttostr(stag);
      cells[5,i]:=work;
      cells[6,i]:=inttostr(cash);
    end;
  end;
end;

procedure TForm1.N8Click(Sender: TObject);
// ��������/�������� �������
Var
  i:integer;
begin
  if Edit7.Text = '' then
  begin
    ShowMessage('������� ����� ������ ��� ��������!');
    exit;
  end;
  for i:=strtoint(Edit7.Text) to n do
  begin
    inst_stuff[i].fam:=inst_stuff[i+1].fam;
    inst_stuff[i].otd:=inst_stuff[i+1].otd;
    inst_stuff[i].year:=inst_stuff[i+1].year;
    inst_stuff[i].stag:=inst_stuff[i+1].stag;
    inst_stuff[i].work:=inst_stuff[i+1].work;
    inst_stuff[i].cash:=inst_stuff[i+1].cash;
  end;
  n:=n-1;
end;

procedure TForm1.N11Click(Sender: TObject);
// ����������/�������
// ������ �� ��������������� ����� 
var
  f: file of tstuff;
  i: integer;
begin
  if OpenDialog1.Execute then
    try
      Assignfile(f,OpenDialog1.FileName);
      Reset(f);
      n:=0;
      while not(EOF(f)) do
        begin
          Inc(n);
          Read(f,inst_stuff[n]);
        end;
      closefile(f);
    except
      ShowMessage('������ ��� ������ �����!');
      closefile(f);
    end;
end;

procedure TForm1.N7Click(Sender: TObject);
// ��������/������������ �������
begin
  if (Edit1.Text = '')or
     (Edit2.Text = '')or
     (Edit3.Text = '')or
     (Edit4.Text = '')or
     (Edit5.Text = '')or
     (Edit6.Text = '')or
     (Edit7.Text = '')then
  begin
    ShowMessage('�� �� ����� ��� ��������������!');
    exit;
  end;
  with inst_stuff[strtoint(Edit7.Text)] do
  begin
    fam:=Edit1.Text;
    otd:=Edit2.Text;
    year:=strtoint(Edit3.Text);
    stag:=strtoint(Edit4.Text);
    work:=Edit5.Text;
    cash:=strtoint(Edit6.Text);
  end;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
  if Edit7.Text = '' then
  begin
    ShowMessage('������� �����!');
    exit;
  end;
  with inst_stuff[strtoint(Edit7.Text)] do
  begin
    Edit1.Text:=fam;
    Edit2.Text:=otd;
    Edit3.Text:=inttostr(year);
    Edit4.Text:=inttostr(stag);
    Edit5.Text:=work;
    Edit6.Text:=inttostr(cash);
  end;
end;

end.
