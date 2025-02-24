unit FormaPagamento;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, StdCtrls, Buttons, TISButton, TIGradient,
  TIGradientCaption;

type
  TformFormaPagamento = class(TForm)
    Edpagamento: TComboBox;
    Label2: TLabel;
    TIGradientCaption1: TTIGradientCaption;
    TIGradient1: TTIGradient;
    btnOK: TTISButton;
    cmbPgtoSAT: TComboBox;
    ckbPgMistoSAT: TTISCheckBox;
    lblDH: TLabel;
    lblCH: TLabel;
    lblCL: TLabel;
    lblCC: TLabel;
    lblCD: TLabel;
    lblVP: TLabel;
    lblOT: TLabel;
    lblValorRestante: TLabel;
    lblVlRest: TLabel;
    lblValorTotal: TLabel;
    lblVlTot: TLabel;
    edtDinheiro: TEdit;
    edtCheque: TEdit;
    edtCredLoja: TEdit;
    edtCartaoCredito: TEdit;
    edtCartaoDebito: TEdit;
    edtValePresente: TEdit;
    edtOutros: TEdit;
    lblVA: TLabel;
    lblVR: TLabel;
    lblVC: TLabel;
    edtVlAlim: TEdit;
    edtVlRefeicao: TEdit;
    edtVlComb: TEdit;
    edtPIX: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbPgMistoSATClick(Sender: TObject);
    procedure edtDinheiroExit(Sender: TObject);
    procedure edtCartaoCreditoExit(Sender: TObject);
    procedure edtCartaoDebitoExit(Sender: TObject);
    procedure edtChequeExit(Sender: TObject);
    procedure edtCredLojaExit(Sender: TObject);
    procedure edtValePresenteExit(Sender: TObject);
    procedure edtOutrosExit(Sender: TObject);
    procedure edtVlAlimExit(Sender: TObject);
    procedure edtVlRefeicaoExit(Sender: TObject);
    procedure edtVlCombExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formFormaPagamento : TformFormaPagamento;
    strFormaPgto : String;
    restante, fltpgto, diferenca,
    fltDH, fltCH, fltCL, fltCC, fltCD,
    fltVP, fltOT, fltVA, fltVR, fltVC, fltPX : Double;
    
implementation

uses AlteraValor, Venda, ModuloDados;     


{$R *.dfm}


procedure TformFormaPagamento.btnOKClick(Sender: TObject);
var strConfirma : String;
begin

if (ckbPgMistoSAT.Checked = True) then
  Begin
   fltpgto := StrToFloat(edtDinheiro.Text)+StrToFloat(edtCheque.Text)+StrToFloat(edtCredLoja.Text)+StrToFloat(edtCartaoCredito.Text)+StrToFloat(edtCartaoDebito.Text)+StrToFloat(edtValePresente.Text)+StrToFloat(edtOutros.Text)+StrToFloat(edtVlAlim.Text)+StrToFloat(edtVlRefeicao.Text)+StrToFloat(edtVlComb.Text);
   if( (restante = 0)or(fltpgto = fltValorTotal) )then
    Begin
     Close;
    End
   else
    Begin
     diferenca := fltValorTotal - fltpgto;
     if (diferenca > 0.02) then
      begin
       ShowMessage('Valor dos pagamentos não confere com o valor total do pedido. Pedido: '+FloatToStr(fltValorTotal)+' Pgto: '+FloatToStr(fltpgto));
       Abort;
       //Close;
      end
     else
      begin
       Close;
      end;
    End;
  End
else
  Begin
   strConfirma := 'Confirma Forma de Pagamento:  "' +cmbPgtoSAT.Text+ '" ?'; // Edpagamento.Text+ '" ?';
   if (Application.MessageBox(pChar(strConfirma),'ATENÇÃO!',MB_YESNO) = IDYES) then
    begin
     strFormaPgto := Copy(Edpagamento.Text,1,2);
     Close;
    end;
  End;
end;

procedure TformFormaPagamento.FormShow(Sender: TObject);
begin
cmbPgtoSAT.SetFocus;
edtDinheiro.Text      := '0';
edtCheque.Text        := '0';
edtCredLoja.Text      := '0';
edtCartaoCredito.Text := '0';         
edtCartaoDebito.Text  := '0';
edtValePresente.Text  := '0';
edtOutros.Text        := '0';
edtVlAlim.Text        := '0';
edtVlRefeicao.Text    := '0';
edtVlComb.Text        := '0';
edtPIX.Text           := '0';
edtDinheiro.Visible      := False;
edtCheque.Visible        := False;
edtCredLoja.Visible      := False;
edtCartaoCredito.Visible := False;
edtCartaoDebito.Visible  := False;
edtValePresente.Visible  := False;
edtOutros.Visible        := False;
edtVlAlim.Visible        := False;
edtVlRefeicao.Visible    := False;
edtVlComb.Visible        := False;
lblValorRestante.Visible := False;
lblValorTotal.Visible    := False;
lblVlRest.Visible        := False;
lblVlTot.Visible         := False;
lblDH.Visible := False;
lblCH.Visible := False;
lblCL.Visible := False;
lblCC.Visible := False;
lblCD.Visible := False;
lblVP.Visible := False;
lblOT.Visible := False;
lblVA.Visible := False;
lblVR.Visible := False;
lblVC.Visible := False;
//
restante      := 0;
fltValorTotal := 0;
dmBaseDados.tblSaida.First;
while (not dmBaseDados.tblSaida.Eof) do
 begin
  fltValorTotal := fltValorTotal + dmBaseDados.tblSaidaValorTotal.AsFloat;
  dmBaseDados.tblSaida.Next;
 end;
fltValorTotal := fltValorTotal - strDesconto;
//fltValorTotal := fltValorTotal + strAcrescimo;
restante      := fltValorTotal;
lblVlTot.Caption  := FormatFloat('R$ 0.00',fltValorTotal);
lblVlRest.Caption := FormatFloat('R$ 0.00',fltValorTotal);
//Edpagamento.SetFocus;
end;                                                        
                                                
procedure TformFormaPagamento.ckbPgMistoSATClick(Sender: TObject);
begin
if (ckbPgMistoSAT.Checked = True) then
  Begin                                         
   edtDinheiro.Visible      := True;
   edtCheque.Visible        := True;
   edtCredLoja.Visible      := True;                                     
   edtCartaoCredito.Visible := True;
   edtCartaoDebito.Visible  := True;
   edtValePresente.Visible  := True;
   edtOutros.Visible        := True;
   edtVlAlim.Visible        := True;
   edtVlRefeicao.Visible    := True;
   edtVlComb.Visible        := True;
   lblValorRestante.Visible := True;
   lblValorTotal.Visible    := True;
   lblVlRest.Visible        := True;
   lblVlTot.Visible         := True;
   lblDH.Visible := True;
   lblCH.Visible := True;
   lblCL.Visible := True;
   lblCC.Visible := True;
   lblCD.Visible := True;
   lblVP.Visible := True;
   lblOT.Visible := True;
   lblVA.Visible := True;
   lblVR.Visible := True;
   lblVC.Visible := True;
  End
Else
  Begin
   edtDinheiro.Visible      := False;
   edtCheque.Visible        := False;
   edtCredLoja.Visible      := False;
   edtCartaoCredito.Visible := False;
   edtCartaoDebito.Visible  := False;
   edtValePresente.Visible  := False;
   edtOutros.Visible        := False;
   edtVlAlim.Visible        := False;
   edtVlRefeicao.Visible    := False;
   edtVlComb.Visible        := False;
   lblValorRestante.Visible := False;
   lblValorTotal.Visible    := False;
   lblVlRest.Visible        := False;
   lblVlTot.Visible         := False;
   lblDH.Visible := False;
   lblCH.Visible := False;
   lblCL.Visible := False;
   lblCC.Visible := False;
   lblCD.Visible := False;
   lblVP.Visible := False;
   lblOT.Visible := False;
   lblVA.Visible := False;
   lblVR.Visible := False;
   lblVC.Visible := False;
  End;
end;

procedure TformFormaPagamento.edtDinheiroExit(Sender: TObject);
begin
if (edtDinheiro.Text <> '') then
 Begin
  fltpgto  := StrToFloat(edtDinheiro.Text)+StrToFloat(edtCheque.Text)+StrToFloat(edtCredLoja.Text)+StrToFloat(edtCartaoCredito.Text)+StrToFloat(edtCartaoDebito.Text)+StrToFloat(edtValePresente.Text)+StrToFloat(edtOutros.Text)+StrToFloat(edtVlAlim.Text)+StrToFloat(edtVlRefeicao.Text)+StrToFloat(edtVlComb.Text);
  restante := fltValorTotal - fltpgto;
  lblVlRest.Caption := 'R$ '+FormatCurr('0.00',StrToCurr(FloatToStr(restante)));
  edtDinheiro.Text  := FormatCurr('0.00',StrToCurr(edtDinheiro.Text));
  if (fltpgto=fltValorTotal) then
   begin
    btnOK.SetFocus;
   end;
 End
else
 Begin
  edtDinheiro.Text := '0';
 End;
end;

procedure TformFormaPagamento.edtCartaoCreditoExit(Sender: TObject);
begin
if (edtCartaoCredito.Text <> '') then
 Begin
  fltpgto  := StrToFloat(edtDinheiro.Text)+StrToFloat(edtCheque.Text)+StrToFloat(edtCredLoja.Text)+StrToFloat(edtCartaoCredito.Text)+StrToFloat(edtCartaoDebito.Text)+StrToFloat(edtValePresente.Text)+StrToFloat(edtOutros.Text)+StrToFloat(edtVlAlim.Text)+StrToFloat(edtVlRefeicao.Text)+StrToFloat(edtVlComb.Text);
  restante := fltValorTotal - fltpgto;
  lblVlRest.Caption := 'R$ '+FormatCurr('0.00',StrToCurr(FloatToStr(restante)));
  edtCartaoCredito.Text  := FormatCurr('0.00',StrToCurr(edtCartaoCredito.Text));
  if (fltpgto=fltValorTotal) then
   begin
    btnOK.SetFocus;
   end;
 End
else
 Begin
  edtCartaoCredito.Text := '0';
 End;
end;

procedure TformFormaPagamento.edtCartaoDebitoExit(Sender: TObject);
begin
if (edtCartaoDebito.Text <> '') then
 Begin
  fltpgto  := StrToFloat(edtDinheiro.Text)+StrToFloat(edtCheque.Text)+StrToFloat(edtCredLoja.Text)+StrToFloat(edtCartaoCredito.Text)+StrToFloat(edtCartaoDebito.Text)+StrToFloat(edtValePresente.Text)+StrToFloat(edtOutros.Text)+StrToFloat(edtVlAlim.Text)+StrToFloat(edtVlRefeicao.Text)+StrToFloat(edtVlComb.Text);
  restante := fltValorTotal - fltpgto;
  lblVlRest.Caption := 'R$ '+FormatCurr('0.00',StrToCurr(FloatToStr(restante)));
  edtCartaoDebito.Text  := FormatCurr('0.00',StrToCurr(edtCartaoDebito.Text));
  if (fltpgto=fltValorTotal) then
   begin
    btnOK.SetFocus;
   end;
 End
else
 Begin
  edtCartaoDebito.Text := '0';
 End;
end;

procedure TformFormaPagamento.edtChequeExit(Sender: TObject);
begin
if (edtCheque.Text <> '') then
 Begin
  fltpgto  := StrToFloat(edtDinheiro.Text)+StrToFloat(edtCheque.Text)+StrToFloat(edtCredLoja.Text)+StrToFloat(edtCartaoCredito.Text)+StrToFloat(edtCartaoDebito.Text)+StrToFloat(edtValePresente.Text)+StrToFloat(edtOutros.Text)+StrToFloat(edtVlAlim.Text)+StrToFloat(edtVlRefeicao.Text)+StrToFloat(edtVlComb.Text);
  restante := fltValorTotal - fltpgto;
  lblVlRest.Caption := 'R$ '+FormatCurr('0.00',StrToCurr(FloatToStr(restante)));
  edtCheque.Text    := FormatCurr('0.00',StrToCurr(edtCheque.Text));
  if (fltpgto=fltValorTotal) then
   begin
    btnOK.SetFocus;
   end;
 End
else
 Begin
  edtCheque.Text := '0';
 End;
end;

procedure TformFormaPagamento.edtCredLojaExit(Sender: TObject);
begin
if (edtCredLoja.Text <> '') then
 Begin
  fltpgto  := StrToFloat(edtDinheiro.Text)+StrToFloat(edtCheque.Text)+StrToFloat(edtCredLoja.Text)+StrToFloat(edtCartaoCredito.Text)+StrToFloat(edtCartaoDebito.Text)+StrToFloat(edtValePresente.Text)+StrToFloat(edtOutros.Text)+StrToFloat(edtVlAlim.Text)+StrToFloat(edtVlRefeicao.Text)+StrToFloat(edtVlComb.Text);
  restante := fltValorTotal - fltpgto;
  lblVlRest.Caption := 'R$ '+FormatCurr('0.00',StrToCurr(FloatToStr(restante)));
  edtCredLoja.Text  := FormatCurr('0.00',StrToCurr(edtCredLoja.Text));
  if (fltpgto=fltValorTotal) then
   begin
    btnOK.SetFocus;
   end;
 End
else
 Begin
  edtCredLoja.Text := '0';
 End;
end;

procedure TformFormaPagamento.edtValePresenteExit(Sender: TObject);
begin
if (edtValePresente.Text <> '') then
 Begin
  fltpgto  := StrToFloat(edtDinheiro.Text)+StrToFloat(edtCheque.Text)+StrToFloat(edtCredLoja.Text)+StrToFloat(edtCartaoCredito.Text)+StrToFloat(edtCartaoDebito.Text)+StrToFloat(edtValePresente.Text)+StrToFloat(edtOutros.Text)+StrToFloat(edtVlAlim.Text)+StrToFloat(edtVlRefeicao.Text)+StrToFloat(edtVlComb.Text);
  restante := fltValorTotal - fltpgto;
  lblVlRest.Caption := 'R$ '+FormatCurr('0.00',StrToCurr(FloatToStr(restante)));
  edtValePresente.Text  := FormatCurr('0.00',StrToCurr(edtValePresente.Text));
  if (fltpgto=fltValorTotal) then
   begin
    btnOK.SetFocus;
   end;
 End
else
 Begin
  edtValePresente.Text := '0';
 End;
end;

procedure TformFormaPagamento.edtOutrosExit(Sender: TObject);
begin
if (edtOutros.Text <> '') then
 Begin
  fltpgto  := StrToFloat(edtDinheiro.Text)+StrToFloat(edtCheque.Text)+StrToFloat(edtCredLoja.Text)+StrToFloat(edtCartaoCredito.Text)+StrToFloat(edtCartaoDebito.Text)+StrToFloat(edtValePresente.Text)+StrToFloat(edtOutros.Text)+StrToFloat(edtVlAlim.Text)+StrToFloat(edtVlRefeicao.Text)+StrToFloat(edtVlComb.Text);
  restante := fltValorTotal - fltpgto;
  lblVlRest.Caption := 'R$ '+FormatCurr('0.00',StrToCurr(FloatToStr(restante)));
  edtOutros.Text  := FormatCurr('0.00',StrToCurr(edtOutros.Text));
  if (fltpgto=fltValorTotal) then
   begin
    btnOK.SetFocus;
   end;
 End
else
 Begin
  edtOutros.Text := '0';
 End;
end;

procedure TformFormaPagamento.edtVlAlimExit(Sender: TObject);
begin
if (edtVlAlim.Text <> '') then
 Begin
  fltpgto  := StrToFloat(edtDinheiro.Text)+StrToFloat(edtCheque.Text)+StrToFloat(edtCredLoja.Text)+StrToFloat(edtCartaoCredito.Text)+StrToFloat(edtCartaoDebito.Text)+StrToFloat(edtValePresente.Text)+StrToFloat(edtOutros.Text)+StrToFloat(edtVlAlim.Text)+StrToFloat(edtVlRefeicao.Text)+StrToFloat(edtVlComb.Text);
  restante := fltValorTotal - fltpgto;
  lblVlRest.Caption := 'R$ '+FormatCurr('0.00',StrToCurr(FloatToStr(restante)));
  edtVlAlim.Text  := FormatCurr('0.00',StrToCurr(edtVlAlim.Text));
  if (fltpgto=fltValorTotal) then
   begin
    btnOK.SetFocus;
   end;
 End
else
 Begin
  edtVlAlim.Text := '0';
 End;
end;

procedure TformFormaPagamento.edtVlRefeicaoExit(Sender: TObject);
begin
if (edtVlRefeicao.Text <> '') then
 Begin
  fltpgto  := StrToFloat(edtDinheiro.Text)+StrToFloat(edtCheque.Text)+StrToFloat(edtCredLoja.Text)+StrToFloat(edtCartaoCredito.Text)+StrToFloat(edtCartaoDebito.Text)+StrToFloat(edtValePresente.Text)+StrToFloat(edtOutros.Text)+StrToFloat(edtVlAlim.Text)+StrToFloat(edtVlRefeicao.Text)+StrToFloat(edtVlComb.Text);
  restante := fltValorTotal - fltpgto;
  lblVlRest.Caption := 'R$ '+FormatCurr('0.00',StrToCurr(FloatToStr(restante)));
  edtVlRefeicao.Text  := FormatCurr('0.00',StrToCurr(edtVlRefeicao.Text));
  if (fltpgto=fltValorTotal) then
   begin
    btnOK.SetFocus;
   end;
 End
else
 Begin
  edtVlRefeicao.Text := '0';
 End;
end;

procedure TformFormaPagamento.edtVlCombExit(Sender: TObject);
begin
if (edtVlComb.Text <> '') then
 Begin
  fltpgto  := StrToFloat(edtDinheiro.Text)+StrToFloat(edtCheque.Text)+StrToFloat(edtCredLoja.Text)+StrToFloat(edtCartaoCredito.Text)+StrToFloat(edtCartaoDebito.Text)+StrToFloat(edtValePresente.Text)+StrToFloat(edtOutros.Text)+StrToFloat(edtVlAlim.Text)+StrToFloat(edtVlRefeicao.Text)+StrToFloat(edtVlComb.Text);
  restante := fltValorTotal - fltpgto;
  lblVlRest.Caption := 'R$ '+FormatCurr('0.00',StrToCurr(FloatToStr(restante)));
  edtVlComb.Text  := FormatCurr('0.00',StrToCurr(edtVlComb.Text));
  if (fltpgto=fltValorTotal) then
   begin
    btnOK.SetFocus;
   end;
 End
else
 Begin
  edtVlComb.Text := '0';
 End;
end;

end.
