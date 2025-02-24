unit RelRamoAtividade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TformRelRamo = class(TForm)
    qrpRelRamo: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRExpr2: TQRExpr;
    qrsDataEmissao: TQRSysData;
    qrlVendedor_Todos: TQRLabel;
    qrsNumeroPagina: TQRSysData;
    qrlFamilia: TQRLabel;
    qrlFam: TQRLabel;
    qrlPeriodo: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    procedure qrlVendedor_TodosPrint(sender: TObject; var Value: String);
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
    procedure qrlFamiliaPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelRamo: TformRelRamo;

implementation

uses ModuloDados, RamoAtividade;

{$R *.DFM}

procedure TformRelRamo.qrlVendedor_TodosPrint(sender: TObject;
  var Value: String);
begin
        if formRamoAtividade.edtV1.Text = '000' then
         begin
           Value := 'TODOS VENDEDORES'
         end
        else
         begin
           Value := 'Vendedor : '+dmBaseDados.tblLogMensalObservacao.AsString;
         end;
end;

procedure TformRelRamo.qrlPeriodoPrint(sender: TObject; var Value: String);
begin
     Value := 'Período de '+DateToStr(formRamoAtividade.Data1.Date)+' à '+DateToStr(formRamoAtividade.Data2.Date);
end;

procedure TformRelRamo.qrlFamiliaPrint(sender: TObject; var Value: String);
begin
         if formRamoAtividade.edtFamilia.Text = '000' then
         begin
           Value := 'Todas'
         end
        else
         begin
           Value := formRamoAtividade.edtFamilia.Text;
         end;
end;

end.
