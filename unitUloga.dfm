object formUloga: TformUloga
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Vrsta uloge i producenti'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 312
    Top = 128
    Width = 76
    Height = 13
    Caption = 'Naziv tipa uloge'
  end
  object Label2: TLabel
    Left = 304
    Top = 160
    Width = 84
    Height = 13
    Caption = 'Naziv producenta'
  end
  object cbTipUloge: TComboBox
    Left = 392
    Top = 128
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object btnPrikazi: TButton
    Left = 560
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Prikazi'
    TabOrder = 1
    OnClick = btnPrikaziClick
  end
  object btnIzadji: TButton
    Left = 560
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Izadji'
    TabOrder = 2
    OnClick = btnIzadjiClick
  end
  object StringGrid: TStringGrid
    Left = 280
    Top = 200
    Width = 400
    Height = 120
    TabOrder = 3
  end
  object cbProducent: TComboBox
    Left = 392
    Top = 160
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
end
