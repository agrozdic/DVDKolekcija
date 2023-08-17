unit unitDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    GLUMAC: TADOTable;
    FILM: TADOTable;
    ZANR: TADOTable;
    PRODUCENT: TADOTable;
    LISTA_FILM_PRODUCENT: TADOTable;
    ULOGA: TADOTable;
    TIP_ULOGE: TADOTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
