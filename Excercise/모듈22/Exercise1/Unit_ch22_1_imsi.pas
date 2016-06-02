unit Unit_ch22_1_imsi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
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
VAR
  Save_Names:array of string;
  i:integer;
  t:TDate;
  idx:integer;
  cnt:integer;
  Names:string;
begin
   cnt := 1;
   SetLength(Save_Names,cnt);

   t := StrToDate(StringGrid1.Cells[1,1]);
   for i := 2 to StringGrid1.RowCount - 1 do
   begin
     try
        if t >= StrToDate(StringGrid1.cells[1,i]) then
        begin
          if  t =  StrToDate(StringGrid1.cells[1,i]) then  //��������� ���� ����� �����ϱ� ���� �迭�� ���
          begin
             cnt := cnt +  1;
             SetLength(Save_Names, cnt);
          end;
        Save_Names[cnt - 1] := StringGrid1.cells[0,i];
        idx := i;
        t := StrToDate(StringGrid1.Cells[1,i]);
        end;
     except
        raise exception.Create('���� ������ Ʋ���ϴ�');
     end;
   end;
   for I := 0 to cnt - 1 do
     Names := Names + Save_Names[i];

   ShowMessage('�ֿ��� �����ڴ� = ' + Names);
 end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
  t:TDateTime;
  Year,Month,Day:word;
begin
  StringGrid1.ColCount := 3;
  StringGrid1.RowCount := 10;
  StringGrid1.Cells[0,0] := '����';
  StringGrid1.Cells[1,0] := '����';
  StringGrid1.Cells[2,0] := '��������';
  for i := 0 to StringGrid1.RowCount - 1 do
  begin
     StringGrid1.Cells[0,i] := '�ƹ���' + IntToStr(i+1);
     DecodeDate(now, Year, Month, Day);
     Year := Year - (i*1);
     t := EncodeDate(Year,Month,Day);
     StringGrid1.Cells[1,i] := DateToStr(t);
     StringGrid1.Cells[2,i] := DateToStr(Date - (i+1)*10);
  end;
end;

end.
