//������������ ������ 11
//
//���������, ������
//27. ���������, ������� �� � �������� ������ ������ ����������� � ����������� ������,
//���� � ����, ��� ��������, ��������, ����� ���������� (�),
//� �� ����� ��� ���������� )..(..)..( �������� �� ��������.
//
//���������� : �������� �.�. , ��. 62492

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
    Label2: TLabel;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  s:string;
  c:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
//���� ������ �� ����� 
Var
    f:textfile;
begin
  if OpenDialog1.Execute then
  begin
    assignfile(f,OpenDialog1.FileName);
    reset(f);
    readln(f,s);
    Edit1.text:=s;
  closefile(f);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
//�������� ������
Var
    i:integer;
begin
  c:=0;
  For i:=1 to length(s) do
    if s[i]='(' then
                    c:=c+1 //����������� ���������� ������������� ��������
                else
    if c>0 then
                c:=c-1     //���� ����������� ������ , �� ��������� ���-�� �������������
           else begin
                      c:=-1; //���� ������ ����������� � ������ ��� �������������
                      break; //�� ����������� �������� � ������������� �������� �����������
                end;         //�������� c=-1
  Edit2.Text:='������ ���������!';
end;

procedure TForm1.Button3Click(Sender: TObject);
//����� ����������
var
    f:textfile;
begin
  assignfile(f,'output.txt');
  rewrite(f);
  writeln(f,'������ = ' , s);
  if c=0 then //�� �������� ������������ � ������������� ������ ������� �����
              write(f,'������ ��������������')
         else
              write(f,'������ �� ��������������');
  Edit3.Text:='����� �������� � �����!';
  closefile(f);
end;

end.
