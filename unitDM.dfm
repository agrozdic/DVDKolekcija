object dm: Tdm
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 547
  Width = 294
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DVDkolekcija.mdb;Pe' +
      'rsist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 72
    Top = 32
  end
  object GLUMAC: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Glumac'
    Left = 72
    Top = 88
  end
  object FILM: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'FILM'
    Left = 72
    Top = 144
  end
  object ZANR: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'ZANR'
    Left = 72
    Top = 200
  end
  object PRODUCENT: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Producent'
    Left = 72
    Top = 256
  end
  object LISTA_FILM_PRODUCENT: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Producirao'
    Left = 72
    Top = 312
  end
  object ULOGA: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'ULOGA'
    Left = 72
    Top = 368
  end
  object TIP_ULOGE: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'TIP_ULOGE'
    Left = 72
    Top = 424
  end
  object DataSource1: TDataSource
    DataSet = GLUMAC
    Left = 176
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = FILM
    Left = 176
    Top = 144
  end
  object DataSource3: TDataSource
    DataSet = ZANR
    Left = 176
    Top = 200
  end
  object DataSource4: TDataSource
    DataSet = PRODUCENT
    Left = 176
    Top = 256
  end
  object DataSource5: TDataSource
    DataSet = LISTA_FILM_PRODUCENT
    Left = 176
    Top = 312
  end
  object DataSource6: TDataSource
    DataSet = ULOGA
    Left = 176
    Top = 368
  end
  object DataSource7: TDataSource
    DataSet = TIP_ULOGE
    Left = 176
    Top = 424
  end
end
