unit SeekMarcas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TformSeekMarca = class(TForm)
    lblMensagem  : TLabel;
    mskMarca     : TMaskEdit;
    btnOK        : TBitBtn;
    btnCancela   : TBitBtn;
    lblMensagem2 : TLabel;
    edtNomeMarca : TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSeekMarca: TformSeekMarca;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformSeekMarca.FormShow(Sender: TObject);
begin
   mskMarca.Text     := '';
   edtNomeMarca.Text := '';
   mskMarca.SetFocus;
end;

procedure TformSeekMarca.btnOKClick(Sender: TObject);
begin
   if (not dmBaseDados.tblMarcas.FindKey([mskMarca.Text])) then
   begin
      dmBaseDados.tblMarcas.IndexName := 'IndMarca';
      if (not dmBaseDados.tblMarcas.FindKey([edtNomeMarca.Text])) then
      begin
         Mensagem('Registro não encontrado !');
         dmBaseDados.tblMarcas.IndexName := '';
         dmBaseDados.tblMarcas.First;
      end;
   end;
end;

end.
