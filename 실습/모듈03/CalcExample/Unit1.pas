unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmCalc = class(TForm)
    edtA: TEdit;
    edtB: TEdit;
    btnAdd: TButton;
    lblResult: TLabel;
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalc: TfrmCalc;

implementation

{$R *.dfm}

procedure TfrmCalc.btnAddClick(Sender: TObject);
var
  a, b, c: Single;
begin
  a := StrToFloat(edtA.Text); // ���� A�� ���� �ִ´�.
  b := StrToFloat(edtB.Text); // ���� B�� ���� �ִ´�.
  c := a + b;

  lblResult.Visible := True;  // ���̺��� ���̵��� �Ѵ�
  lblResult.Caption := FloatToStr(c); // ������� ���̺� �ִ´�.(�ֱ� ���� �켱 String���� ��ȯ�ؾ� �Ѵ�)
end;

end.
