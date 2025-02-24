unit NovaPasta;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TformNovapasta = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    NewDir: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formNovapasta: TformNovapasta;

implementation

{$R *.DFM}

end.
