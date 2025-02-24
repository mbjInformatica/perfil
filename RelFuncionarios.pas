unit RelFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelFuncionario = class(TForm)
    rptFuncionarios      : TQuickRep;
    bndCabecalho         : TQRBand;
    bndFuncionarios      : TQRBand;
    bndColunas           : TQRBand;
    lblTitulo            : TQRLabel;
    lblOrdem             : TQRLabel;
    sysdata              : TQRSysData;
    sysPagina            : TQRSysData;
    lblCodigoFuncionario : TQRLabel;
    lblNomeFuncionario   : TQRLabel;
    lblEndereco          : TQRLabel;
    lblBairro            : TQRLabel;
    lblCidade            : TQRLabel;
    lblEstado            : TQRLabel;
    lblTelefone          : TQRLabel;
    fldCodigoFuncionario : TQRDBText;
    fldNomeFuncionario   : TQRDBText;
    fldEndereco          : TQRDBText;
    fldBairro            : TQRDBText;
    fldCidade            : TQRDBText;
    fldEstado            : TQRDBText;
    fldNumero            : TQRDBText;
    qrlNumero            : TQRLabel;
    qrdTel               : TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelFuncionario: TformRelFuncionario;

implementation

uses ModuloDados;

{$R *.DFM}

end.
