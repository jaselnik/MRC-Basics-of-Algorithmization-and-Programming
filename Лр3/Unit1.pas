// ������������ ������ 3
// ������� 27

//  ���� ���������� ����� �(�, �).
// ����������, ����������� �� ������ ����� ���������� ��������� D .
// �������� ��������� � "�����.docx"

// ����������: �������� �����, ��. 62492

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject); 
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject); 
var 
  x,y,a,b,c1,c2,s,s1,s2,p1,p2:real;
begin
if (Edit1.Text='')or(Edit2.Text='') then begin
                               ShowMessage('�� ������ ������ ��������� ��������!');
                               exit;
                          end;
  x:=strtofloat(Edit1.Text);
  y:=strtofloat(Edit2.Text);
  if(x>=-1)and(x<=1)and(y>=-1)and(y<=0) then Label3.Caption:= '����� � '
                                        else
  if(abs(x)>1)or(abs(y)>1)then Label3.Caption:= '����� �  ��   '
                                else begin
  b:=1;
  s:=0.5;
  a:=sqrt(x*x+y*y);
  c1:=sqrt((x+1)*(x+1)+y*y);
  c2:=sqrt(x*x+(y-1)*(y-1));
  p1:=(a+b+c1)/2;
  p2:=(a+b+c2)/2;
  s1:=sqrt(p1*(p1-a)*(p1-c1)*(p1-b));
  s2:=sqrt(p2*(p2-a)*(p2-c2)*(p2-b));
  if s<(s1+s2) then Label3.Caption:= '����� �  ��   '
               else Label3.Caption:= '����� � ';
                                      end;
end;

procedure TForm1.Button2Click(Sender: TObject); 
begin
  close;
end;


procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8,'-',','])then begin
  Key:=#0;
                                 end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8,'-',','])then begin
  Key:=#0;
                                 end;
end;

end.



