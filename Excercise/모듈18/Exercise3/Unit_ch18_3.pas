unit Unit_ch18_3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

const
  n = 20;
type
  array_r_elements = array[1..n] of real;

  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo2: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
     procedure SetArrayRange(var ch1, ch2:real);
     procedure FillArray(var a:array_r_elements; rMin, rMAX:real);
     procedure OutPutArray(a:array_r_elements; n:integer);
     procedure OutPutArray2(a:array_r_elements; n:integer);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
 chB, chE: real;
 A:array_r_elements;
 i,j,k:integer;
 temp:real;
begin
  k := n div 2;
  SetArrayRange(chB, chE); //�迭�� ���� chB �� chE�� �Է��Ѵ�
  FillArray(a, chB, chE); // chB�� chE ���� (chB, chE�� //�����Ͽ�)�� ������ ������ �迭 A�� ä���
  OutputArray(a, n);      // �迭 A�� ù ��° Tmemo1�� ǥ���Ѵ�
  for i := 1 to k do
  begin
      temp := a[i];
      a[i] := a[i+k];
      a[i+k] := temp;
  end;
  OutputArray2(a, n);
end;


procedure TForm1.FillArray(var a: array_r_elements; rMin, rMAX: real);
var
  i:integer;
begin
  randomize;
  for i := 1 to n do
      a[i] := random;
end;

procedure TForm1.OutPutArray(a: array_r_elements; n: integer);
var
  i:integer;
begin
  Memo1.Lines.Clear;
  for i := 0 to n-1  do
      Memo1.Lines.Append(FloatToStr(a[i+1]));
end;

procedure TForm1.OutPutArray2(a: array_r_elements; n: integer);
var
  i:integer;
begin
  Memo2.Lines.Clear;
  for I := 1 to n  do
      Memo2.Lines.Append(FloatToStr(a[i]));
end;

procedure TForm1.SetArrayRange(var ch1, ch2: real);
begin
   ch1 := StrToFloat(Edit1.text);
   ch2 := StrToFloat(Edit2.text);
end;

end.
