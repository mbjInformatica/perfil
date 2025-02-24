object formSeekProduto: TformSeekProduto
  Left = 70
  Top = 175
  BorderStyle = bsDialog
  Caption = 'Localiza'#231#227'o de produto'
  ClientHeight = 355
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblMensagem: TLabel
    Left = 8
    Top = 104
    Width = 158
    Height = 13
    Caption = 'Digite o C'#243'digo do Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 111
    Height = 13
    Caption = 'o C'#243'digo de Barra :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 48
    Width = 15
    Height = 13
    Caption = 'ou'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 4
    Top = 5
    Width = 151
    Height = 13
    Caption = 'Referencia do Fabricante/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 60
    Top = 84
    Width = 15
    Height = 13
    Caption = 'ou'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 264
    Top = 3
    Width = 118
    Height = 13
    Caption = 'Pesquisar por Nome:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 21
    Width = 92
    Height = 13
    Caption = 'C'#243'digo Interno :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txtRefFabricante: TDBText
    Left = 155
    Top = 187
    Width = 103
    Height = 17
    DataField = 'ReferenciaFabricante'
    DataSource = dmBaseDados.dsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 6
    Top = 170
    Width = 100
    Height = 13
    Caption = 'C'#243'digo de Barra :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txtCodigoBarra: TDBText
    Left = 109
    Top = 170
    Width = 93
    Height = 17
    DataField = 'CodigoBarra'
    DataSource = dmBaseDados.dsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 3
    Top = 187
    Width = 149
    Height = 13
    Caption = 'Referencia do Fabricante:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object mskCodigo: TMaskEdit
    Left = 168
    Top = 112
    Width = 81
    Height = 21
    EditMask = '0000000000-0'
    MaxLength = 12
    TabOrder = 0
    Text = '          - '
    OnChange = mskCodigoChange
  end
  object btnOK: TBitBtn
    Left = 64
    Top = 272
    Width = 81
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 5
    OnClick = btnOKClick
    OnExit = btnOKExit
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnCancela: TBitBtn
    Left = 168
    Top = 272
    Width = 81
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Kind = bkCancel
  end
  object edtCodBarra: TEdit
    Left = 168
    Top = 64
    Width = 89
    Height = 21
    MaxLength = 13
    TabOrder = 1
    OnChange = edtCodBarraChange
  end
  object BitBtn1: TBitBtn
    Left = 464
    Top = 320
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 8
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
  end
  object DBGrid1: TDBGrid
    Left = 264
    Top = 46
    Width = 425
    Height = 268
    DataSource = dmBaseDados.dsProdutos
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DescricaoAbreviada'
        Width = 273
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ReferenciaFabricante'
        Width = 111
        Visible = True
      end>
  end
  object edtPesquisa: TEdit
    Left = 264
    Top = 20
    Width = 270
    Height = 21
    TabOrder = 4
    OnChange = edtPesquisaChange
    OnExit = edtPesquisaExit
  end
  object edtMemo: TEdit
    Left = 136
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 3
    Visible = False
  end
  object Button1: TButton
    Left = 56
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 9
    Visible = False
    OnClick = Button1Click
  end
  object edtReferencia: TEdit
    Left = 159
    Top = 19
    Width = 96
    Height = 21
    TabOrder = 2
    OnChange = edtReferenciaChange
  end
end
