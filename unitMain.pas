unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TformMain = class(TForm)
    MainMenu1: TMainMenu;
    Podaci1: TMenuItem;
    Glumci1: TMenuItem;
    Peoducenti1: TMenuItem;
    Upiti1: TMenuItem;
    Pozanrovimaiglumcima1: TMenuItem;
    Potipuulogeiproducentu1: TMenuItem;
    Kraj1: TMenuItem;
    Izlaz1: TMenuItem;
    procedure Izlaz1Click(Sender: TObject);
    procedure Glumci1Click(Sender: TObject);
    procedure Peoducenti1Click(Sender: TObject);
    procedure Pozanrovimaiglumcima1Click(Sender: TObject);
    procedure Potipuulogeiproducentu1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

uses unitGlumci, unitProducenti, unitUloga, unitZanrovi;

{$R *.dfm}

procedure TformMain.Izlaz1Click(Sender: TObject);
  begin
    Close;
  end;

procedure TformMain.Glumci1Click(Sender: TObject);
  begin
    formGlumci.ShowModal;
  end;

procedure TformMain.Peoducenti1Click(Sender: TObject);
  begin
    formProducenti.ShowModal;
  end;

procedure TformMain.Pozanrovimaiglumcima1Click(Sender: TObject);
  begin
    formZanrovi.ShowModal;
  end;

procedure TformMain.Potipuulogeiproducentu1Click(Sender: TObject);
  begin
    formUloga.ShowModal;
  end;

end.
