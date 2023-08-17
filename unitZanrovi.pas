unit unitZanrovi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  rezultat = record
    film, uloga, tipUloge: string;
    trajanje: integer;
  end;
  TformZanrovi = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbZanr: TComboBox;
    editIme: TEdit;
    editPrezime: TEdit;
    btnPrikazi: TButton;
    btnIzadji: TButton;
    StringGrid: TStringGrid;
    procedure btnIzadjiClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnPrikaziClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formZanrovi: TformZanrovi;

implementation

uses unitDM;

{$R *.dfm}

procedure TformZanrovi.btnIzadjiClick(Sender: TObject);
  begin
    Close;
  end;

procedure TformZanrovi.FormActivate(Sender: TObject);
  var
    i, j, br: integer;
    niz: array[1..100] of string;
    temp: string;
  begin
    cbZanr.Text:='';           //pocetne vrednosti
    cbZanr.ItemIndex:=-1;
    editIme.Text:='';
    editPrezime.Text:='';
    StringGrid.FixedCols:=0;            //podesavanje StringGrid-a da izgleda kao ListBox
    StringGrid.FixedRows:=0;
    StringGrid.GridLineWidth:=0;
    StringGrid.ColCount:=3;
    StringGrid.ColWidths[0]:=99;
    StringGrid.ColWidths[1]:=99;
    StringGrid.ColWidths[2]:=99;
    StringGrid.RowCount:=0;
    br:=0;
    dm.ZANR.Open;                     //popunjavanje combobox-a uz sortiranje u opadajucem redosledu
    dm.ZANR.First;
    while(not(dm.ZANR.Eof)) do
      begin
        br:=br+1;
        niz[br]:=dm.ZANR.FieldByName('NazivZanra').Value;
        dm.ZANR.Next;
      end;
    dm.ZANR.Close;
    for i:=1 to br-1 do
      for j:=i+1 to br do
        if(niz[i]<niz[j])
          then
            begin
              temp:=niz[i];
              niz[i]:=niz[j];
              niz[j]:=temp;
            end;
    for i:=1 to br do
      cbZanr.Items.Add(niz[i]);
  end;

procedure TformZanrovi.btnPrikaziClick(Sender: TObject);
  var
    rezultati: array[1..100] of rezultat;
    temp: rezultat;
    br, ind, i, j: integer;
  begin
    dm.ZANR.Open;
    dm.GLUMAC.Open;
    dm.FILM.Open;
    dm.ULOGA.Open;
    dm.TIP_ULOGE.Open;
    StringGrid.RowCount:=0;         //ciscenje StringGrid-a
    StringGrid.Cells[0, 0]:='';     //(ne bi trebalo da se cisti nulti red, ali meni
    StringGrid.Cells[1, 0]:='';     //nece da se izbrise samo)
    StringGrid.Cells[2, 0]:='';
    if((cbZanr.ItemIndex<>-1) and (editIme.Text<>'') and (editPrezime.Text<>'')) //proverava da li su obavezna polja uneta
      then
        begin
          ind:=0;
          dm.GLUMAC.First;
          while(not(dm.GLUMAC.Eof)) do
            begin
              if((dm.GLUMAC.FieldByName('Ime').Value=editIme.Text) and (dm.GLUMAC.FieldByName('Prezime').Value=editPrezime.Text)) //proverava da li glumac postoji
                then
                  begin
                    ind:=dm.GLUMAC.FieldByName('GlumacID').Value; //indikator govori da je nadjen glumac i kroz njega se prosledjuje GlumacID
                    break;
                  end;
              dm.GLUMAC.Next;
            end;
          if(ind<>0) //ako je glumac nadjen
            then
              begin
                dm.ZANR.Locate('NazivZanra', cbZanr.Text, []);
                dm.GLUMAC.Locate('GlumacID', ind, []);
                br:=0;
                dm.FILM.First;
                while(not(dm.FILM.Eof)) do
                  begin
                    if(dm.FILM.FieldByName('ZanrID').Value=dm.ZANR.FieldByName('ZanrID').Value) //proverava da li je trenutni film odabranog zanra
                      then
                        begin
                          dm.ULOGA.First;
                          while(not(dm.ULOGA.Eof)) do
                            begin
                              if((dm.ULOGA.FieldByName('FilmID').Value=dm.FILM.FieldByName('FilmID').Value) and (dm.ULOGA.FieldByName('GlumacID').Value=ind)) //proverava postoji li uloga koju izabrani glumac tumaci u trenutnom filmu
                                then
                                  begin
                                    br:=br+1;
                                    dm.TIP_ULOGE.Locate('TipUlogeID', dm.ULOGA.FieldByName('TipUlogeID').Value, []);
                                    rezultati[br].film:=dm.FILM.FieldByName('Naziv').Value;         //potrebne vrednosti se cuvaju u nizu tipa rezultat (vidi gore type)
                                    rezultati[br].uloga:=dm.ULOGA.FieldByName('ImeLika').Value;
                                    rezultati[br].tipUloge:=dm.TIP_ULOGE.FieldByName('Tip').Value;
                                    rezultati[br].trajanje:=dm.FILM.FieldByName('Trajanje').Value;
                                  end;
                              dm.ULOGA.Next;
                            end;
                        end;
                    dm.FILM.Next;
                  end;
                if(br<>0) //ukoliko su nadjeni rezultati pretrage
                  then
                    begin
                      for i:=0 to br-1 do                                 //sortiranje prema trajanju filma u opadajucem redosledu
                        for j:=i+1 to br do
                          if(rezultati[i].trajanje<rezultati[j].trajanje)
                            then
                              begin
                                temp:=rezultati[j];
                                rezultati[j]:=rezultati[i];
                                rezultati[i]:=temp;
                              end;
                      for i:=0 to br do                                   //ispis rezultsta
                        begin
                          StringGrid.Cells[0, i]:=rezultati[i+1].film;
                          StringGrid.Cells[1, i]:=rezultati[i+1].uloga;
                          StringGrid.Cells[2, i]:=rezultati[i+1].tipUloge;
                        end;
                      StringGrid.RowCount:=br;
                    end
                  else
                    showmessage('Nema rezultata za unete parametre!');
              end
            else
                showmessage('Ne postoji takav glumac!');
        end
      else
        showmessage('Polja Naziv zanra i Ime glumca (ili) Prezime glumca su obavezna!');
    dm.ZANR.Close;
    dm.GLUMAC.Close;
    dm.FILM.Close;
    dm.ULOGA.Close;
    dm.TIP_ULOGE.Close;
  end;

end.
