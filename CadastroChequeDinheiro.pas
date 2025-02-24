unit CadastroChequeDinheiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Buttons, StdCtrls, DBCtrls;

type
  TFormCadastroChequesDinheiro = class(TForm)
    dbgCheques    : TDBGrid;
    dbtNumPedido  : TDBText;
    lblData       : TLabel;
    btnNovo       : TSpeedButton;
    btnExcluir    : TSpeedButton;
    btnGrava      : TSpeedButton;
    btnRetornar   : TSpeedButton;
    btnImprime    : TSpeedButton;
    lblValorTotal : TLabel;
    dbtParcela    : TDBText;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroChequesDinheiro: TFormCadastroChequesDinheiro;
  strNPedChq,strParcela:String;
implementation

uses
        ModuloDados,Clientes,RelCheques;

{$R *.DFM}

procedure TFormCadastroChequesDinheiro.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
       if Key = #13 then
                begin
                Key := #0;
                if (Sender is TDBGrid) then
                        TDBGrid(Sender).Perform(WM_KeyDown,VK_Tab,0)
                else
                        Perform(Wm_NextDlgCtl,0,0);
                end;
end;

procedure TFormCadastroChequesDinheiro.btnNovoClick(Sender: TObject);
begin
   dmBaseDados.tblCheques.Append;
   dbgCheques.Enabled:=True;
   dmBaseDados.tblChequesNumeroPedido.AsString:=
   dmBaseDados.tblContasReceberNumeroDocumento.AsString;
   dmBaseDados.tblChequesParcelas.AsString:=
   dmBaseDados.tblContasReceberParcelas.AsString;
   dmBaseDados.tblChequesCodCli.AsString := dmBaseDados.tblClientesCodigoCliente.AsString;
   dmBaseDados.tblChequesNomeCliente.AsString:=
   FloatToStr(dmBaseDados.tblClientesCodigoCliente.AsFloat)+' - '+
   dmBaseDados.tblClientesNomeCliente.AsString;
   btnExcluir.Enabled := True;
   btnGrava.Enabled   := True;
   btnNovo.Enabled    := False;
   btnImprime.Enabled := False;
   dbgCheques.SetFocus;
end;

procedure TFormCadastroChequesDinheiro.btnExcluirClick(Sender: TObject);
var
        dblValor:Double;
begin
        dblValor := 0;
        dmBaseDados.tblCheques.Delete;
        dmBaseDados.tblCheques.First;
        while (not dmBaseDados.tblCheques.Eof) do
                begin
                dblValor:=dblValor+dmBaseDados.tblChequesValorCheque.AsCurrency;
                dmBaseDados.tblCheques.Next;
                end;
        dmBaseDados.tblContasReceber.Edit;
        dmBaseDados.tblContasReceberValorCheque.AsFloat := dblValor;
        lblValorTotal.Caption := 'Total : '+FloatToStrF(dblValor,ffCurrency,10,2);
end;

procedure TFormCadastroChequesDinheiro.btnRetornarClick(Sender: TObject);
begin
        Close;
end;

procedure TFormCadastroChequesDinheiro.btnGravaClick(Sender: TObject);
var
        dblValor:Double;
begin
        dmBaseDados.tblCheques.Post;
        dmBaseDados.tblCheques.First;
        while (not dmBaseDados.tblCheques.Eof) do
                begin
                dblValor:=dblValor+dmBaseDados.tblChequesValorCheque.AsCurrency;
                dmBaseDados.tblCheques.Next;
                end;
        dmBaseDados.tblContasReceber.Edit;
        dmBaseDados.tblContasReceberValorCheque.AsCurrency:=dblValor;
        lblValorTotal.Caption := 'Total : '+FloatToStrF(dblValor,ffCurrency,10,2);
        btnGrava.Enabled   := False;
        btnImprime.Enabled := True;
        btnNovo.Enabled    := True;
        btnExcluir.Enabled := True;
        dbgCheques.SetFocus;
end;

procedure TFormCadastroChequesDinheiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmBaseDados.tblCheques.IndexName := '';
        dmBaseDados.tblCheques.Filter    := '';
        dmBaseDados.tblCheques.Filtered  := False;
        dmBaseDados.tblCheques.Close;
end;

procedure TFormCadastroChequesDinheiro.FormShow(Sender: TObject);
var
        dblValor:Double;
begin
        dmBaseDados.tblCheques.Open;
        dmBaseDados.tblCheques.IndexName := 'IndNPedido';
        dmBaseDados.tblCheques.Filter    := '('+'NumeroPedido ='+QuotedStr(strNPedChq)+')and('+'Parcelas ='+QuotedStr(strParcela)+')';
        dmBaseDados.tblCheques.Filtered  := True;
        dmBaseDados.tblCheques.First;
        while (not dmBaseDados.tblCheques.Eof) do
                begin
                dblValor:=dblValor+dmBaseDados.tblChequesValorCheque.AsCurrency;
                dmBaseDados.tblCheques.Next;
                end;
        dmBaseDados.tblContasReceber.Edit;
        dmBaseDados.tblContasReceberValorCheque.AsCurrency:=dblValor;
        lblValorTotal.Caption := 'Total : '+FloatToStrF(dblValor,ffCurrency,10,2);
        lblData.Caption       := DateToStr(Date);
        dbgCheques.Enabled    := False;
        btnGrava.Enabled      := False;
        btnExcluir.Enabled    := False;
        btnNovo.Enabled       := True;
end;

procedure TFormCadastroChequesDinheiro.btnImprimeClick(Sender: TObject);
begin
        FormRelCheques.QRBand1.HasChild := False;
        FormRelCheques.qrpCheques.Preview;
end;

end.
