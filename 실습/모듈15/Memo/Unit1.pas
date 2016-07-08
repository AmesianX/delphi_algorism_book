unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmEx = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    memEx: TMemo;
    Button4: TButton;
    Button5: TButton;
    edtEx: TEdit;
    lblEx: TLabel;
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
  frmEx: TfrmEx;

implementation

{$R *.dfm}

procedure TfrmEx.Button1Click(Sender: TObject);
begin
  memEx.Lines.Clear;
end;

procedure TfrmEx.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  memEx.Lines.Clear;
  for I := 0 to 10 do
  begin
    memEx.Lines.Append(IntToStr(I));
  end;
end;

procedure TfrmEx.Button3Click(Sender: TObject);
begin
  memEx.Lines.Add('�� ������ ���ڿ� ����� ����Ѵ�.');
end;

procedure TfrmEx.Button4Click(Sender: TObject);
var
  b: Integer;
begin
  b := memEx.Lines.Add(edtEx.Text);
  lblEx.Caption := IntToStr(b);
end;

procedure TfrmEx.Button5Click(Sender: TObject);
begin
  memEx.Lines.Insert(2, ''); // 2�� �ٿ� ������ �ϳ� �����ִ´�. ���� �ִ� 2�� ���� �������� �ʰ� �ڷ� �и���.
end;

function PlMin(numStr: Integer): Integer;
var
  k, m: Integer;
begin
  m := NumStr; // �켱, �񱳸� ������ ���� �ּҰ� ���̶�� ����(�����ϴ� �� ��ȣ�� �ּҰ��� �� ��ȣ�� �ִ´�.)
  for k := m+1 to frmEx.memEx.Lines.Count - 1 do // NumStr ������ �����Ͽ� �� ������ ��� �ٸ��� �ݺ��Ѵ�.
    if frmEx.memEx.Lines[k] < frmEx.memEx.Lines[m] then // ���� ���� ���� �ּҰ� ���� ��ȣ�̸�
      m := k; // m��(�ּҰ� ���� ��ȣ)�� ���� �� ��ȣ�� �ٲ۴�.

  plMin := m; // ã�� �� �ּҰ��� �� ��ȣ�� �Լ��� ��ȯ ���� �ִ´�.
end;

procedure TfrmEx.Button6Click(Sender: TObject);
var
  i, j: Integer;
begin
  for i := 0 to memEx.Lines.Count - 1 do // TMemo ��ü �� �ݺ�
  begin
    j := plMin(i);  // i �� �ٿ��� ������ �ٱ��� �߿���, �ּҰ� ���� ��ȣ�� ã�Ƴ���.
    memEx.Lines.Exchange(i, j); // ���� �ڸ��� �¹ٲ۴�.
  end;

end;

end.
