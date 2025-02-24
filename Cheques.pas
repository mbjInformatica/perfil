unit Cheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls;

type
  TFormCheques = class(TForm)
    btbProsseguir : TBitBtn;
    btbSair       : TBitBtn;
    ckbEmissao    : TCheckBox;
    lblDtI        : TLabel;
    lblDtF        : TLabel;
    Data1         : TDateTimePicker;
    Data2         : TDateTimePicker;
    edtCliente: TEdit;
    Label1: TLabel;
    ckbTodos: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btbSairClick(Sender: TObject);
    procedure btbProsseguirClick(Sender: TObject);
    procedure ckbTodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCheques: TFormCheques;

implementation

uses
        ModuloDados,RelCheques;

{$R *.DFM}

procedure TFormCheques.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormRelCheques.qrlBonificacao.Enabled  := True;
  FormRelCheques.qrlNomeCliente.Enabled  := True;
  FormRelCheques.qrdbNumReq.Enabled      := True;
  FormRelCheques.qrdbNomeCliente.Enabled := True;
end;

procedure TFormCheques.FormShow(Sender: TObject);
begin
  Screen.Cursor                          := CrHourGlass;
  Data1.Date                             := Date;
  Data2.Date                             := Date;
  Screen.Cursor                          := CrDefault;
  edtCliente.Text                        := '0000';
  ckbEmissao.Checked                     := False;
  ckbTodos.Checked                       := False;
  FormRelCheques.QRBand1.HasChild        := True;
  FormRelCheques.qrlBonificacao.Enabled  := False;
  FormRelCheques.qrlNomeCliente.Enabled  := False;
  FormRelCheques.qrdbNumReq.Enabled      := False;
  FormRelCheques.qrdbNomeCliente.Enabled := False;
  Data1.SetFocus;
end;

procedure TFormCheques.btbSairClick(Sender: TObject);
begin
        Close;
end;

procedure TFormCheques.btbProsseguirClick(Sender: TObject);
begin
     dmBaseDados.tblCheques.Open;
     //dmBaseDados.tblClientes.Open;
     //dmBaseDados.tblContasReceber.Open;
  if ckbTodos.Checked = True then
   begin
      if ckbEmissao.Checked=False then
        begin
         dmBaseDados.tblCheques.IndexName := 'IndDataVen';
         dmBaseDados.tblCheques.Filter    := '('+'DataVencimento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataVencimento <='+QuotedStr(DateToStr(Data2.Date))+')'
        end
      else
         begin
         dmBaseDados.tblCheques.IndexName := 'IndDataEms';
         dmBaseDados.tblCheques.Filter    := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
      end;
   end;
 if ckbTodos.Checked = False then
   begin
      if ckbEmissao.Checked=False then
        begin
         dmBaseDados.tblCheques.IndexName := 'IndDataVen';
         dmBaseDados.tblCheques.Filter    := '('+'DataVencimento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataVencimento <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'CodCli ='+QuotedStr(edtCliente.Text)+')'
        end
      else
         begin
         dmBaseDados.tblCheques.IndexName := 'IndDataEms';
         dmBaseDados.tblCheques.Filter    := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'CodCli ='+QuotedStr(edtCliente.Text)+')';
      end;
   end;
     dmBaseDados.tblCheques.Filtered  := True;
     FormRelCheques.qrpCheques.Preview;
     dmBaseDados.tblCheques.IndexName := '';
     dmBaseDados.tblCheques.Filter    := '';
     dmBaseDados.tblCheques.Filtered  := False;
     dmBaseDados.tblCheques.Close;
     Close;
     //dmBaseDados.tblClientes.Close;
     //dmBaseDados.tblContasReceber.Close;
end;

procedure TFormCheques.ckbTodosClick(Sender: TObject);
begin
 if ckbTodos.Checked = True then
   begin
    edtCliente.Enabled := False;
   end
 else
   begin
    edtCliente.Enabled := True;
   end;
end;

end.
