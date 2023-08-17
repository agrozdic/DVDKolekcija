program DVDkolekcija;

uses
  Forms,
  unitMain in 'unitMain.pas' {formMain},
  unitGlumci in 'unitGlumci.pas' {formGlumci},
  unitProducenti in 'unitProducenti.pas' {formProducenti},
  unitZanrovi in 'unitZanrovi.pas' {formZanrovi},
  unitUloga in 'unitUloga.pas' {formUloga},
  unitDM in 'unitDM.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TformGlumci, formGlumci);
  Application.CreateForm(TformProducenti, formProducenti);
  Application.CreateForm(TformZanrovi, formZanrovi);
  Application.CreateForm(TformUloga, formUloga);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
