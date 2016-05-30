unit Unit_ch6_3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
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
  i,j:integer;
  r:real;
  Array_real:array [0..2] of real;
begin

  Array_real[0] := StrToFloat(Edit1.Text);
  Array_real[1] := StrToFloat(Edit2.Text);
  Array_real[2] := StrToFloat(Edit3.Text);

  for I := 0 to 2 do
    for j := i+1 to 2 do
      if array_real[i] > array_real[j] then
      begin
       r := array_real[i];
       array_real[i] := array_real[j];
       array_real[j] := r;
      end;

  label1.Caption := '�ּҰ� =' + FloatToStr(Array_real[0]);
  label2.Caption := '�ִ밪 =' + FloatToStr(Array_real[2]);
end;





end.
