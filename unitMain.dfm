object formMain: TformMain
  Left = 192
  Top = 125
  Width = 1044
  Height = 539
  Caption = 'DVD kolekcija'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 24
    Top = 16
    object Podaci1: TMenuItem
      Caption = 'Podaci'
      object Glumci1: TMenuItem
        Caption = 'Glumci'
        OnClick = Glumci1Click
      end
      object Peoducenti1: TMenuItem
        Caption = 'Producenti'
        OnClick = Peoducenti1Click
      end
    end
    object Upiti1: TMenuItem
      Caption = 'Upiti'
      object Pozanrovimaiglumcima1: TMenuItem
        Caption = 'Po zanrovima i glumcima'
        OnClick = Pozanrovimaiglumcima1Click
      end
      object Potipuulogeiproducentu1: TMenuItem
        Caption = 'Po tipu uloge i producentu'
        OnClick = Potipuulogeiproducentu1Click
      end
    end
    object Kraj1: TMenuItem
      Caption = 'Kraj'
      object Izlaz1: TMenuItem
        Caption = 'Izlaz'
        ShortCut = 32841
        OnClick = Izlaz1Click
      end
    end
  end
end
