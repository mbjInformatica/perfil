object FormAlterarValor: TFormAlterarValor
  Left = 262
  Top = 90
  BorderStyle = bsSingle
  Caption = 'Alterar Valor'
  ClientHeight = 251
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gpbOutrasDatas: TGroupBox
    Left = 32
    Top = 24
    Width = 217
    Height = 89
    Caption = 'Forma de Pagamento'
    TabOrder = 0
    object ckbData2: TCheckBox
      Left = 16
      Top = 16
      Width = 57
      Height = 17
      Caption = '2'#186' Data'
      TabOrder = 0
      OnClick = ckbData2Click
    end
    object ckbData3: TCheckBox
      Left = 16
      Top = 40
      Width = 57
      Height = 17
      Caption = '3'#186' Data'
      TabOrder = 2
      OnClick = ckbData3Click
    end
    object ckbData4: TCheckBox
      Left = 16
      Top = 64
      Width = 57
      Height = 17
      Caption = '4'#186' Data'
      TabOrder = 4
      OnClick = ckbData4Click
    end
    object mskData2: TMaskEdit
      Left = 120
      Top = 14
      Width = 80
      Height = 21
      EditMask = '!90/90/0000;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnExit = mskData2Exit
    end
    object mskData3: TMaskEdit
      Left = 120
      Top = 38
      Width = 80
      Height = 21
      EditMask = '!90/90/0000;1; '
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
      OnExit = mskData3Exit
    end
    object mskData4: TMaskEdit
      Left = 120
      Top = 62
      Width = 80
      Height = 21
      EditMask = '!90/90/0000;1; '
      MaxLength = 10
      TabOrder = 5
      Text = '  /  /    '
    end
  end
  object btnPross: TButton
    Left = 88
    Top = 184
    Width = 99
    Height = 49
    Caption = '&Prosseguir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnProssClick
  end
  object GpDesconto: TGroupBox
    Left = 8
    Top = 24
    Width = 265
    Height = 89
    Caption = 'Desconto:'
    TabOrder = 2
    object lblEmpresa: TLabel
      Left = 192
      Top = 20
      Width = 7
      Height = 13
      Caption = 'B'
    end
    object lblVendedor: TLabel
      Left = 192
      Top = 60
      Width = 8
      Height = 13
      Caption = 'G'
    end
    object edtEmpresa: TEdit
      Left = 208
      Top = 16
      Width = 40
      Height = 21
      Enabled = False
      MaxLength = 2
      TabOrder = 0
      Text = '0'
      OnExit = edtEmpresaExit
      OnKeyPress = edtEmpresaKeyPress
    end
    object edtRepresentante: TEdit
      Left = 208
      Top = 56
      Width = 40
      Height = 21
      Enabled = False
      MaxLength = 2
      TabOrder = 1
      Text = '0'
      OnExit = edtRepresentanteExit
      OnKeyPress = edtRepresentanteKeyPress
    end
    object ckbComDesconto: TCheckBox
      Left = 8
      Top = 38
      Width = 177
      Height = 17
      Caption = 'Pedido com &Desconto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ckbComDescontoClick
    end
  end
  object edtCliente: TEdit
    Left = 40
    Top = 136
    Width = 209
    Height = 21
    TabOrder = 3
    Visible = False
  end
end
