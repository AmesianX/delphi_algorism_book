unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmQuadEq = class(TForm)
    btnFind: TButton;
    lblX1: TLabel;
    lblX2: TLabel;
    lblNo: TLabel;
    edtA: TEdit;
    edtB: TEdit;
    edtC: TEdit;
    lblCoefs: TLabel;
    procedure btnFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQuadEq: TfrmQuadEq;

implementation

{$R *.dfm}

procedure Init;
begin
  frmQuadEq.lblX1.Visible := False;
  frmQuadEq.lblX2.Visible := False;
  frmQuadEq.lblNo.Visible := False;
end;

procedure CoefInput(var k1, k2, k3: Real);
begin
  k1 := StrToFloat(frmQuadEq.edtA.Text);
  k2 := StrToFloat(frmQuadEq.edtB.Text);
  k3 := StrToFloat(frmQuadEq.edtC.Text);
end;

procedure Prn(Xf, Xs: Real);
begin
  frmQuadEq.lblX1.Visible := True;
  frmQuadEq.lblX1.Caption := 'x1=' + FloatToStr(Xf);
  frmQuadEq.lblX2.Visible := True;
  frmQuadEq.lblX2.Caption := 'x2=' + FloatToStr(Xs);
end;

procedure Calc(k1, k2, dis: Real; var Xf, Xs: Real);
begin
  Xf := (-k2+Sqrt(dis))/(2*k1);
  Xf := (-k2-Sqrt(dis))/(2*k1);
end;

procedure TfrmQuadEq.btnFindClick(Sender: TObject);
var
  A, B, C, D, X1, X2: Real;
begin
  Init;
  CoefInput(A, B, C); // ��� A,B,C�� �д´�.
  D := Sqr(B) - 4*A*C;  // �Ǻ���D�� ����ϳ�.
  if D >= 0 then  // (D�� 0���� ũ�ų� ������)
  begin
    Calc(A, B, D, X1, X2);  // A,B,D�� �̿��� �� x1, x2�� ����Ѵ�.
    Prn(X1, X2); // �� x1, x2�� ����Ѵ�.
  end
  else
    lblNo.Visible := True; // ����ڿ��� �ع��� ���ٰ� �˸���.
end;

end.
