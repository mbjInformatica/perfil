unit RelSAT;

interface                            

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TformRelSAT = class(TForm)
    qrpSAT: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand4: TQRBand;
    QRLabel6: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    lblInicio: TQRLabel;
    QRBand3: TQRBand;
    exprValorTotal: TQRExpr;                         
    exprTotalReceber: TQRExpr;
    lblTotalItens: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
  private                                                       
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelSAT: TformRelSAT;

implementation

uses ModuloDados;

{$R *.dfm}

end.
