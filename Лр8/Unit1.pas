//������������ ������ 8
//������������ (��������� � �������)
//������� 27
//27. �������� ��������� �������� ���� ������������ ������������ ������
// �  ��������� ����������� � ���� ������������ �����.
//���������� �������� �.�.

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  m,n,p,q:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var
    f:textfile;
begin
  if OpenDialog1.Execute then
  begin
    assignfile(f,OpenDialog1.FileName);
    reset(f);
    read(f,m,n,p,q);
    Label1.Caption:='������ ����� = '+inttostr(m)+'/'+inttostr(n);   //�������� �����
    Label2.Caption:='������ ����� = '+inttostr(p)+'/'+inttostr(q);
  closefile(f);
  end;
end;

Function NOD(x,y:integer):integer;
Begin
  if x<>0 then NOD:=NOD(y mod x,x) else NOD:=y;
end;

Function NOK(x,y:integer):integer;
Begin
  NOK:=(x div NOD (x,y))*y;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  a,b,c,d:integer;    
begin
  a:= NOK(n,q); //�������� ����������� ����� ������(������� ��� ������������ ���� ������)
  b:= a div n ;
  c:= a div q ;
  d:=b*m+c*p;  //�������� ��������� ����� ������
  Label3.Caption:='��������� �������� = '+inttostr(d)+'/'+inttostr(a);  //������� ��������� �������� ������
end;

end.
