object formGlumci: TformGlumci
  Left = 192
  Top = 123
  Width = 1044
  Height = 542
  Caption = 'Glumci'
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
    Top = 48
    Width = 22
    Height = 13
    Caption = 'Sifra'
  end
  object Label2: TLabel
    Left = 416
    Top = 80
    Width = 18
    Height = 13
    Caption = 'Ime'
  end
  object Label3: TLabel
    Left = 400
    Top = 112
    Width = 37
    Height = 13
    Caption = 'Prezime'
  end
  object Label4: TLabel
    Left = 368
    Top = 144
    Width = 74
    Height = 13
    Caption = 'Datum rodjenja'
  end
  object Label5: TLabel
    Left = 368
    Top = 176
    Width = 72
    Height = 13
    Caption = 'Mesto rodjenja'
  end
  object Label6: TLabel
    Left = 304
    Top = 264
    Width = 22
    Height = 13
    Caption = 'Sifra'
  end
  object Label7: TLabel
    Left = 344
    Top = 264
    Width = 18
    Height = 13
    Caption = 'Ime'
  end
  object Label8: TLabel
    Left = 424
    Top = 264
    Width = 37
    Height = 13
    Caption = 'Prezime'
  end
  object Label9: TLabel
    Left = 504
    Top = 264
    Width = 74
    Height = 13
    Caption = 'Datum rodjenja'
  end
  object Label10: TLabel
    Left = 584
    Top = 264
    Width = 72
    Height = 13
    Caption = 'Mesto rodjenja'
  end
  object editSifra: TEdit
    Left = 448
    Top = 48
    Width = 89
    Height = 21
    TabOrder = 0
  end
  object editIme: TEdit
    Left = 448
    Top = 80
    Width = 185
    Height = 21
    TabOrder = 1
  end
  object editPrezime: TEdit
    Left = 448
    Top = 112
    Width = 185
    Height = 21
    TabOrder = 2
  end
  object editMesto: TEdit
    Left = 448
    Top = 176
    Width = 185
    Height = 21
    TabOrder = 3
  end
  object btnUpisi: TButton
    Left = 352
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Upisi'
    TabOrder = 4
    OnClick = btnUpisiClick
  end
  object btnObrisi: TButton
    Left = 432
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Obrisi'
    TabOrder = 5
    OnClick = btnObrisiClick
  end
  object btnIzmeni: TButton
    Left = 512
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Izmeni'
    TabOrder = 6
    OnClick = btnIzmeniClick
  end
  object btnIzadji: TButton
    Left = 592
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Izadji'
    TabOrder = 7
    OnClick = btnIzadjiClick
  end
  object editDatum: TEdit
    Left = 448
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object StringGrid: TStringGrid
    Left = 304
    Top = 280
    Width = 433
    Height = 161
    DefaultColWidth = 80
    TabOrder = 9
  end
end
