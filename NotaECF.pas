unit NotaECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmNotaECF = class(TForm)
    edtPedido: TEdit;
    btnOK: TButton;
    lblPedido: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotaECF: TfrmNotaECF;

implementation

{$R *.dfm}

procedure TfrmNotaECF.btnOKClick(Sender: TObject);
begin
  if RenameFile( 'C:\00000001.ORC', 'C:\'+edtPedido.text+'.ORC' ) = true then
    begin
     ShowMessage( 'Pedido Pronto para Emissão de Nota ECF!!!' );
    end
  else
    begin
      ShowMessage('Pedido não Encontrado!!!');
    end;
  close;  
end;

procedure TfrmNotaECF.FormShow(Sender: TObject);
begin
edtPedido.Text := '';
end;

end.
