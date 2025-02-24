unit AlteraValor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFormAlterarValor = class(TForm)
    gpbOutrasDatas   : TGroupBox;
    ckbData2         : TCheckBox;
    ckbData3         : TCheckBox;
    ckbData4         : TCheckBox;
    mskData2         : TMaskEdit;
    mskData3         : TMaskEdit;
    mskData4         : TMaskEdit;
    btnPross: TButton;
    GpDesconto: TGroupBox;
    lblEmpresa: TLabel;
    lblVendedor: TLabel;
    edtEmpresa: TEdit;
    edtRepresentante: TEdit;
    ckbComDesconto: TCheckBox;
    edtCliente: TEdit;
    procedure btnProsseguirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure edtRepresentanteKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mskData2Exit(Sender: TObject);
    procedure mskData3Exit(Sender: TObject);
    procedure ckbData2Click(Sender: TObject);
    procedure ckbData3Click(Sender: TObject);
    procedure ckbData4Click(Sender: TObject);
    procedure btnProssClick(Sender: TObject);
    procedure ckbComDescontoClick(Sender: TObject);
    procedure edtRepresentanteExit(Sender: TObject);
    procedure edtEmpresaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAlterarValor: TFormAlterarValor;
  AcessStatus,NA: Integer;
implementation
uses
        Venda, senhavenda, SenhadoGerente, DigitacaoPedido, FormaPagamento;

{$R *.DFM}

procedure TFormAlterarValor.btnProsseguirClick(Sender: TObject);
begin
        if (ckbComDesconto.Checked = True) and (edtEmpresa.Text<>'0') then
                fltEmpresa := 1-(StrToInt(edtEmpresa.Text)/100);
        if (ckbComDesconto.Checked = True) and (edtRepresentante.Text<>'0') then
                fltRepresentante := 1-(StrToInt(edtRepresentante.Text)/100);
{        if (rdgAlterarValor.ItemIndex=2) and (edtEmpresa.Text<>'0') then
                fltEmpresa := 1+(StrToInt(edtEmpresa.Text)/100);
        if (rdgAlterarValor.ItemIndex=2) and (edtRepresentante.Text<>'0') then
                fltRepresentante := 1+(StrToInt(edtRepresentante.Text)/100);}
        if (ckbData2.State=cbChecked)and(mskData2.Text<>'  /  /    ')then
                intParcelas := intParcelas+1;
        if (ckbData3.State=cbChecked)and(mskData3.Text<>'  /  /    ')then
                intParcelas := intParcelas+1;
        if (ckbData4.State=cbChecked)and(mskData4.Text<>'  /  /    ')then
                intParcelas := intParcelas+1;
        Close;
end;

procedure TFormAlterarValor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Close;
end;

procedure TFormAlterarValor.FormShow(Sender: TObject);
begin
//         ckbComDesconto.Checked    := False;
//         edtEmpresa.Text           := '0';
         //edtEmpresa.SetFocus;
         edtRepresentante.Text     := '0';
         mskData2.Enabled          := False;
         mskData3.Enabled          := False;
         mskData4.Enabled          := False;
         ckbData2.State            := cbUnChecked;
         ckbData3.Enabled          := False;
         ckbData4.Enabled          := False;

end;

procedure TFormAlterarValor.edtEmpresaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if (key <#48) or (key>#57) then
                begin
                Application.MessageBox('Digitar Somente Números','Redigitar',MB_OK);
                edtEmpresa.Clear;
                edtEmpresa.SetFocus;
                end;
end;

procedure TFormAlterarValor.edtRepresentanteKeyPress(Sender: TObject;
  var Key: Char);
begin
        if (key <#48) or (key>#57) then
                begin
                Application.MessageBox('Digitar Somente Números','Redigitar',MB_OK);
                edtRepresentante.Clear;
                edtRepresentante.SetFocus;
                end;
end;

procedure TFormAlterarValor.FormKeyPress(Sender: TObject; var Key: Char);
begin
       if Key = #13 then
                begin
                Key := #0;
                Perform(Wm_NextDlgCtl,0,0);
                end;
end;

procedure TFormAlterarValor.mskData2Exit(Sender: TObject);
begin
        ckbData3.Enabled := True;
        ckbData3.SetFocus;
end;

procedure TFormAlterarValor.mskData3Exit(Sender: TObject);
begin
        ckbData4.Enabled := True;
        ckbData4.SetFocus;
end;

procedure TFormAlterarValor.ckbData2Click(Sender: TObject);
begin
        if ckbData2.State=cbChecked then
                mskData2.Enabled := True
        else
                begin
                mskData2.Text    := '  /  /    ';
                mskData2.Enabled := False;
                ckbData3.State   := cbUnChecked;
                ckbData3.Enabled := False;
        end;
end;

procedure TFormAlterarValor.ckbData3Click(Sender: TObject);
begin
        if (ckbData3.State=cbChecked)and(mskData2.Text<>'  /  /    ') then
                mskData3.Enabled:=True
        else
                Begin
                mskData3.Text    := '  /  /    ';
                mskData3.Enabled := False;
                ckbData4.State   := cbUnChecked;
                ckbData4.Enabled := False;
        end;
end;

procedure TFormAlterarValor.ckbData4Click(Sender: TObject);
begin
        if (ckbData4.State=cbChecked) and (mskData3.Text<>'  /  /    ') then
                mskData4.Enabled := True
        else
        begin
                mskData4.Text    := '  /  /    ';
                mskData4.Enabled := False;
        end;
end;

procedure TFormAlterarValor.btnProssClick(Sender: TObject);
var strDesc : Double;
begin
 strDesc := StrToInt(edtEmpresa.Text);

        if strDesc < 15 then
        begin
        if (ckbComDesconto.Checked = True) and (edtEmpresa.Text<>'0') then
                fltEmpresa := 1-(StrToInt(edtEmpresa.Text)/100);
        end
        else
        begin
         ShowMessage('O ');
        end;

       if (ckbComDesconto.Checked = True) and (edtRepresentante.Text<>'0') then
                fltRepresentante := 1-(StrToInt(edtRepresentante.Text)/100);
       {if (rdgAlterarValor.ItemIndex=2) and (edtEmpresa.Text<>'0') then
                fltEmpresa := 1+(StrToInt(edtEmpresa.Text)/100);
        if (rdgAlterarValor.ItemIndex=2) and (edtRepresentante.Text<>'0') then
                fltRepresentante := 1+(StrToInt(edtRepresentante.Text)/100);}
        if (ckbData2.State=cbChecked)and(mskData2.Text<>'  /  /    ')then
                intParcelas := intParcelas+1;
        if (ckbData3.State=cbChecked)and(mskData3.Text<>'  /  /    ')then
                intParcelas := intParcelas+1;
        if (ckbData4.State=cbChecked)and(mskData4.Text<>'  /  /    ')then
                intParcelas := intParcelas+1;
        strDigiteCliente := edtCliente.Text;
      {if frmDigitacaoPedido.ckbFiscal.Checked = true then
        begin
         //formformaPagamento.showModal;
        end
      else
        begin }
        close;
       // end;
end;

procedure TFormAlterarValor.ckbComDescontoClick(Sender: TObject);
begin
        if ckbComDesconto.Checked = False then
           begin
             edtEmpresa.Enabled       := False;
             edtRepresentante.Enabled := False;
           end
        else
           begin
             edtEmpresa.Enabled       := True;
             edtRepresentante.Enabled := True;
           end;
end;

procedure TFormAlterarValor.edtRepresentanteExit(Sender: TObject);
begin
  if edtRepresentante.Text <> '0' then
    begin
      AcessStatus:=0;
      NA:=0;
        while (NA<3)and(AcessStatus=0) do
          begin
            formSenhaGerente.ShowModal;
            NA:=NA+1;
          end;
        if AcessStatus=0  then
          begin
              if (ckbComDesconto.Checked = True) and (edtEmpresa.Text<>'0') then
                fltEmpresa := 1-(StrToInt(edtEmpresa.Text)/100);
        //if (ckbComDesconto.Checked = True) and (edtRepresentante.Text<>'0') then
          //      fltRepresentante := 1-(StrToInt(edtRepresentante.Text)/100);

            close;
            //formvendasbalcao.close;
          end;
        if AcessStatus=1 then
          begin
            if (ckbComDesconto.Checked = True) and (edtEmpresa.Text<>'0') then
                 fltEmpresa := 1-(StrToInt(edtEmpresa.Text)/100);
            if (ckbComDesconto.Checked = True) and (edtRepresentante.Text<>'0') then
                 fltRepresentante := 1-(StrToInt(edtRepresentante.Text)/100);


            close;
          end;
    end
  else
    begin
      close;

    end;
end;

procedure TFormAlterarValor.edtEmpresaExit(Sender: TObject);
begin
  if edtEmpresa.Text > '14' then
    begin
      AcessStatus:=0;
      NA:=0;
        while (NA<3)and(AcessStatus=0) do
          begin
            formSenhaGerente.ShowModal;
            NA:=NA+1;
          end;
        if AcessStatus=0  then
          begin
            //  if (ckbComDesconto.Checked = True) and (edtEmpresa.Text<>'0') then
              //  fltEmpresa := 1-(StrToInt(edtEmpresa.Text)/100);
        //if (ckbComDesconto.Checked = True) and (edtRepresentante.Text<>'0') then
          //      fltRepresentante := 1-(StrToInt(edtRepresentante.Text)/100);

            close;
            //formvendasbalcao.close;
          end;
        if AcessStatus=1 then
          begin
            if (ckbComDesconto.Checked = True) and (edtEmpresa.Text<>'0') then
                 fltEmpresa := 1-(StrToInt(edtEmpresa.Text)/100);
          //  if (ckbComDesconto.Checked = True) and (edtRepresentante.Text<>'0') then
            //     fltRepresentante := 1-(StrToInt(edtRepresentante.Text)/100);


            close;
          end;
    end
  else
    begin
      close;

    end;
end;

end.
