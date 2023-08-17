object formZanrovi: TformZanrovi
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Zanrovi i glumci'
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
    Left = 328
    Top = 80
    Width = 56
    Height = 13
    Caption = 'Naziv zanra'
  end
  object Label2: TLabel
    Left = 328
    Top = 112
    Width = 54
    Height = 13
    Caption = 'Ime glumca'
  end
  object Label3: TLabel
    Left = 312
    Top = 144
    Width = 73
    Height = 13
    Caption = 'Prezime glumca'
  end
  object cbZanr: TComboBox
    Left = 392
    Top = 80
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object editIme: TEdit
    Left = 392
    Top = 112
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object editPrezime: TEdit
    Left = 392
    Top = 144
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object btnPrikazi: TButton
    Left = 560
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Prikazi'
    TabOrder = 3
    OnClick = btnPrikaziClick
  end
  object btnIzadji: TButton
    Left = 560
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Izadji'
    TabOrder = 4
    OnClick = btnIzadjiClick
  end
  object StringGrid: TStringGrid
    Left = 328
    Top = 176
    Width = 300
    Height = 120
    TabOrder = 5
  end
end
