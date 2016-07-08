unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    memEx: TMemo;
    Edit1: TEdit;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure Init;
begin
  Form1.memEx.Lines.Clear;
  Form1.memEx.Lines.Add('ù ��° ��');
  Form1.memEx.Lines.Add('�� ��° ��');
  Form1.memEx.Lines.Add('�� ��° ��');
  Form1.memEx.Lines.Add('�� ��° ��');
  Form1.memEx.Lines.Add('�ټ� ��° ��');
  Form1.memEx.Lines.Add('���� ��° ��');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  s: string;
begin
  Init;

  s := memEx.Lines[2];  // 3��° ���� ���� ���� s�� �Ҵ�
  memEx.Lines[3] := '�ȳ�'; // ���ڿ� ��� '�ȳ�'�� 4��° �ٿ� �Ҵ�
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  k: Integer;
begin
  Init;

  k := memEx.Lines.Count;

  Edit1.Text := IntToStr(k);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Init;

  memEx.Lines.Delete(0);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i, k: Integer;
begin
  k := memEx.Lines.Count;
  for i := k-1 downto 1 do
    if (i mod 2) <> 0 then
      memEx.Lines.Delete(i);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Init;
  memEx.Lines.Exchange(0, 1); // 0���� 1�� ���� �¹ٲ۴�.
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  memEx.Lines.Move(1, 5);
end;

end.
