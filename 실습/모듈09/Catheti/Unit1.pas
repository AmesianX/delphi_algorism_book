unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmCatheti = class(TForm)
    edtAlfa: TEdit;
    edtA: TEdit;
    lblB: TLabel;
    btnRun: TButton;
    procedure btnRunClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCatheti: TfrmCatheti;

implementation

{$R *.dfm}

function Tg(x: Real): Real;
var
  y: Real;
begin
  y := x/180*pi;
  Tg := sin(y)/cos(y); // �Լ� �̸�(Tg) ��� Result�� �ᵵ �ȴ�.
end;

procedure TfrmCatheti.btnRunClick(Sender: TObject);
var
  a, b, alfa: Real;
begin
  alfa := StrToFloat(edtAlfa.Text); // alfa ������ �д´�.
  a := StrToFloat(edtA.Text); // ������ �� a�� ���̸� �д´�.
  b := a*Tg(alfa);  // ������ �ƴ� �� �ٸ� �� b�� ���̸� ����Ѵ�.
  lblB.Caption := FloatToStr(b); // b�� ����Ѵ�.
end;

end.
