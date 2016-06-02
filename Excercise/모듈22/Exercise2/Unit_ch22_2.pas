unit Unit_ch22_2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit_Start: TEdit;
    Label2: TLabel;
    Edit_During: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit_Break: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Edit_Cnt: TEdit;
     procedure Button1Click(Sender: TObject);
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
  Start_Time,T:TTime;
  During:integer;
  Break:integer;
  Count:integer;
  idx,i: Integer;
  SetTime:string;
  begin
  try
     Start_Time := StrtoTime(Edit_Start.text);
  except
     raise Exception.Create('��ȿ�� �ð��� �ƴմϴ�');
  end;
  try
     During := StrtoInt(Edit_During.text);
  except
     raise Exception.Create('��ȿ�� �����ð����� �ƴմϴ�');
  end;
  if During > 60  then
     raise Exception.Create('���� �ð��� �� �ð��� �ʰ��� �� �����ϴ�');
  try
     Break := StrtoInt(Edit_Break.text);
  except
     raise Exception.Create('��ȿ�� ���� �ð���  �ƴմϴ�');
  end;
  if Break > During  then
     raise Exception.Create('���� �ð��� �����ð����� �� �� �����ϴ�');
  try
     Count := StrtoInt(Edit_Cnt.text);
  except
     raise Exception.Create('��ȿ�� Ƚ���� �ƴմϴ�');
  end;
  if Count <= 0 then
     raise Exception.Create('���� Ƚ���� �ּ��� 1ȸ �̻��̾�� �մϴ�');

  StringGrid1.ColCount := 3;
  StringGrid1.RowCount := (Count*2)+1;
  StringGrid1.Cells[0,0] := ' ';
  StringGrid1.Cells[1,0] := '���� �ð�';
  StringGrid1.Cells[2,0] := '���� �ð�';
  idx := 1;
  for i := 1 to Count do
  begin
     StringGrid1.Cells[0,idx] := IntToStr(i)+'����';
     T := Start_Time;
     StringGrid1.Cells[1,idx] := FormatDateTime('hh:nn',T);
     SetTime := '00:'+ Edit_During.Text;
     T  := T +  StrtoTime(SetTime);
     StringGrid1.Cells[2,idx] := FormatDateTime('hh:nn',T);
     idx := idx + 1;
     StringGrid1.Cells[0,idx] := '�޽�';
     StringGrid1.Cells[1,idx] := FormatDateTime('hh:nn',T);
     SetTime := '00:'+ Edit_Break.Text;
     T  := T +  StrtoTime(SetTime);
     StringGrid1.Cells[2,idx] := FormatDateTime('hh:nn',T);
     idx := idx + 1;
     Start_Time := t;
  end;

end;

end.
