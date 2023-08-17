object formProducenti: TformProducenti
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Producenti'
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
    Left = 416
    Top = 72
    Width = 22
    Height = 13
    Caption = 'Sifra'
  end
  object Label2: TLabel
    Left = 416
    Top = 104
    Width = 18
    Height = 13
    Caption = 'Ime'
  end
  object Label3: TLabel
    Left = 408
    Top = 136
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label6: TLabel
    Left = 304
    Top = 224
    Width = 22
    Height = 13
    Caption = 'Sifra'
  end
  object Label7: TLabel
    Left = 344
    Top = 224
    Width = 18
    Height = 13
    Caption = 'Ime'
  end
  object Label9: TLabel
    Left = 496
    Top = 224
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object editSifra: TEdit
    Left = 448
    Top = 72
    Width = 89
    Height = 21
    TabOrder = 0
  end
  object editIme: TEdit
    Left = 448
    Top = 104
    Width = 185
    Height = 21
    TabOrder = 1
  end
  object editEmail: TEdit
    Left = 448
    Top = 136
    Width = 185
    Height = 21
    TabOrder = 2
  end
  object btnUpisi: TButton
    Left = 352
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Upisi'
    TabOrder = 3
    OnClick = btnUpisiClick
  end
  object btnObrisi: TButton
    Left = 432
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Obrisi'
    TabOrder = 4
    OnClick = btnObrisiClick
  end
  object btnIzmeni: TButton
    Left = 512
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Izmeni'
    TabOrder = 5
    OnClick = btnIzmeniClick
  end
  object btnIzadji: TButton
    Left = 592
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Izadji'
    TabOrder = 6
  end
  object StringGrid: TStringGrid
    Left = 304
    Top = 240
    Width = 433
    Height = 161
    DefaultColWidth = 80
    TabOrder = 7
  end
end
