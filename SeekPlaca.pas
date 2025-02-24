unit SeekPlaca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
    TformseekPlaca = class(TForm)
    lblMensagem : TLabel;
    mskPlaca    : TMaskEdit;
    btnOk       : TBitBtn;
    btnCancela  : TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formseekPlaca: TformseekPlaca;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformseekPlaca.btnOkClick(Sender: TObject);
begin
   if (not dmBaseDados.tblClientesOficina.FindKey([mskPlaca.Text])) then
   begin
      Mensagem('Regisrtro não encontrado !');
      dmBaseDados.tblClientesOficina.First;
   end;
end;

procedure TformseekPlaca.FormShow(Sender: TObject);
begin
   mskPlaca.Text := '';
   mskPlaca.SetFocus;
end;

end.
