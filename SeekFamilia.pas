unit SeekFamilia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TformseekFamilia = class(TForm)
    lblMensagem  : TLabel;
    mskFamilia   : TMaskEdit;
    btnOk        : TBitBtn;
    btnCancela   : TBitBtn;
    lblOu        : TLabel;
    llbMensagem2 : TLabel;
    edtFamilia   : TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formseekFamilia: TformseekFamilia;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformseekFamilia.btnOkClick(Sender: TObject);
begin
   if (not dmBaseDados.tblFamilias.FindKey([mskFamilia.Text])) then
   begin
      dmBaseDados.tblFamilias.IndexName := 'IndDescricao';
      if (not dmBaseDados.tblFamilias.FindKey([edtFamilia.Text])) then
      begin
         Mensagem('Regisrtro não encontrado !');
         dmBaseDados.tblFamilias.IndexName := '';
         dmBaseDados.tblFamilias.First;
     end;
   end;
end;

procedure TformseekFamilia.FormShow(Sender: TObject);
begin
   mskFamilia.Text := '';
   edtFamilia.Text := '';
   mskFamilia.SetFocus;
end;

end.
