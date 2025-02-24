unit Desconto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormDesconto = class(TForm)
    ckb10: TCheckBox;
    ckb20: TCheckBox;
    ckb15: TCheckBox;
    ckb5: TCheckBox;
    Label1: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtDesconto: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckb5Click(Sender: TObject);
    procedure ckb10Click(Sender: TObject);
    procedure ckb15Click(Sender: TObject);
    procedure ckb20Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDesconto: TFormDesconto;
  AcessStatus,NA: Integer;

implementation

uses ModuloDados,AlteraValor, Venda, SenhaDesconto, DB;

{$R *.dfm}

procedure TFormDesconto.btnOKClick(Sender: TObject);
var fltQtdeTotal, fltValorTotal, fltDesconto, fltMultiplicador, strDescValor : Double;
begin
NA               := 0;
fltQtdeTotal     := 0;
fltValorTotal    := 0;
fltDesconto      := 0;
fltMultiplicador := 0;
strVBruto        := 0;
strDesconto      := 0;
strDescValor     := 0;
  dmBaseDados.tblSaida.First;
  while (not dmBaseDados.tblSaida.Eof) do
   begin
    strVBruto   := strVBruto + dmBaseDados.tblSaidaValorTotal.AsFloat;
    dmBaseDados.tblSaida.Next;
   end;

 // *** Desconto 5% ***
 if ckb5.Checked = True then
  begin
   fltDesconto      := 5/100;
  end;

 // *** Desconto 10% ***
 if ckb10.Checked = True then
  begin
   fltDesconto      := 10/100;
  end;

 // *** Desconto 15% ***
 if ckb15.Checked = True then
  begin
     AcessStatus:=0;
     NA:=0;
     while (NA<3)and(AcessStatus=0) do
      begin
       formSenhaDesconto.ShowModal;
       NA:=NA+1;
      end;
     if NA = 3 then close;
     if AcessStatus = 1 then
      begin
       fltDesconto := 15/100
      end
     else
      begin
       close;
      end;
  end;

 // *** Desconto 20% ***
 if ckb20.Checked = True then
  begin
     AcessStatus:=0;
     NA:=0;
     while (NA<3)and(AcessStatus=0) do
      begin
       formSenhaDesconto.ShowModal;
       NA:=NA+1;
      end;
     if AcessStatus = 1 then
      begin
       fltDesconto      := 20/100;
      end
     else
      begin
       close;
      end;
  end;

 // *** Desconto Em Valor ***
 if edtDesconto.Text <> '' then
  begin
     AcessStatus:=0;
     NA:=0;
     while (NA<3)and(AcessStatus=0) do
      begin
       formSenhaDesconto.ShowModal;
       NA:=NA+1;
      end;
     if AcessStatus = 1 then
      begin
       strDescValor := StrToFloat(edtDesconto.Text);
       fltDesconto  := strDescValor/strVBruto;
      end
     else
      begin
       close;
      end;
  end;

if NA <> 3 then
BEGIN
 fltMultiplicador := 1- fltDesconto;
 if(Application.MessageBox('Confirma Desconto ?','Tem Certeza??',MB_YESNO)) = IDYES then
  begin
   dmBaseDados.tblSaida.First;
   while (not dmBaseDados.tblSaida.Eof) do
    begin
     dmBaseDados.tblSaida.Edit;
     dmBaseDados.tblSaidaValorUnitario.AsFloat := dmBaseDados.tblSaidaValorUnitario.AsFloat * fltMultiplicador;
     dmBaseDados.tblSaidaValorTotal.AsFloat    := dmBaseDados.tblSaidaValorUnitario.AsFloat * dmBaseDados.tblSaidaQuantidade.AsFloat;
     dmBaseDados.tblSaida.Post;

     fltValorTotal := fltValorTotal + dmBaseDados.tblSaidaValorTotal.AsFloat;
     dmBaseDados.tblSaida.Next;
    end;
   dmBaseDados.tblSaida.EnableControls;
   formVendasBalcao.lblValorTotalVenda.Caption := FloatToStrF(fltValorTotal,ffCurrency,10,2);
  end;
END;
//btnDescNota.Default := False;

strDesconto := strVBruto - fltValorTotal;
//ShowMessage(FloatToStr(strDesconto));
end;

procedure TFormDesconto.FormShow(Sender: TObject);
begin
edtDesconto.Text := '';
ckb5.Checked  := False;
ckb10.Checked := False;
ckb15.Checked := False;
ckb20.Checked := False;
end;

procedure TFormDesconto.ckb5Click(Sender: TObject);
begin
if ckb5.Checked = true then
 begin
 ckb10.Checked := false;
 ckb15.Checked := false;
 ckb20.Checked := false;
 end;

end;

procedure TFormDesconto.ckb10Click(Sender: TObject);
begin
if ckb10.Checked = true then
 begin
 ckb5.Checked  := false;
 ckb15.Checked := false;
 ckb20.Checked := false;
 end;
end;

procedure TFormDesconto.ckb15Click(Sender: TObject);
begin
if ckb15.Checked = true then
 begin
 ckb5.Checked  := false;
 ckb10.Checked := false;
 ckb20.Checked := false;
 end;
end;

procedure TFormDesconto.ckb20Click(Sender: TObject);
begin
if ckb20.Checked = true then
 begin
 ckb5.Checked  := false;
 ckb10.Checked := false;
 ckb15.Checked := false;
 end;
end;

procedure TFormDesconto.btnCancelClick(Sender: TObject);
begin
strVBruto := 0;
  dmBaseDados.tblSaida.First;
  while (not dmBaseDados.tblSaida.Eof) do
   begin
    strVBruto   := strVBruto + dmBaseDados.tblSaidaValorTotal.AsFloat;
    dmBaseDados.tblSaida.Next;
   end;
end;

procedure TFormDesconto.edtDescontoChange(Sender: TObject);
begin
ckb5.Checked  := False;
ckb10.Checked := False;
ckb15.Checked := False;
ckb20.Checked := False;
btnOK.Default := True;
end;

procedure TFormDesconto.edtDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key:= #0;
end;

end.
