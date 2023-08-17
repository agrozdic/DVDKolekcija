unit unitUloga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  rezultat = record
    film, zanr, ime, prezime: string;
  end;
  TformUloga = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    cbTipUloge: TComboBox;
    btnPrikazi: TButton;
    btnIzadji: TButton;
    StringGrid: TStringGrid;
    cbProducent: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure btnIzadjiClick(Sender: TObject);
    procedure btnPrikaziClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formUloga: TformUloga;

implementation

uses unitDM;

{$R *.dfm}

procedure TformUloga.FormActivate(Sender: TObject);
  begin
    cbTipUloge.Text:='';           //pocetne vrednosti
    cbTipUloge.ItemIndex:=-1;
    cbProducent.Text:='';
    cbProducent.ItemIndex:=-1;
    StringGrid.FixedCols:=0;            //podesavanje StringGrid-a da izgleda kao ListBox
    StringGrid.FixedRows:=0;
    StringGrid.GridLineWidth:=0;
    StringGrid.ColCount:=4;
    StringGrid.ColWidths[0]:=99;
    StringGrid.ColWidths[1]:=99;
    StringGrid.ColWidths[2]:=99;
    StringGrid.ColWidths[3]:=99;
    StringGrid.RowCount:=0;
    dm.TIP_ULOGE.Open;                     //popunjavanje combobox-a uz sortiranje u rastucem redosledu
    dm.TIP_ULOGE.First;
    while(not(dm.TIP_ULOGE.Eof)) do
      begin
        cbTipUloge.Items.Add(dm.TIP_ULOGE.FieldByName('Tip').Value);
        dm.TIP_ULOGE.Next;
      end;
    dm.TIP_ULOGE.Close;
    cbTipUloge.Sorted:=true;
    dm.PRODUCENT.Open;
    dm.PRODUCENT.First;
    while(not(dm.PRODUCENT.Eof)) do
      begin
        cbProducent.Items.Add(dm.PRODUCENT.FieldByName('Ime').Value);
        dm.PRODUCENT.Next;
      end;
    dm.PRODUCENT.Close;
    cbProducent.Sorted:=true;
  end;

procedure TformUloga.btnIzadjiClick(Sender: TObject);
  begin
    Close;
  end;

procedure TformUloga.btnPrikaziClick(Sender: TObject);
  var
    rezultati: array[1..100] of rezultat;
    temp: rezultat;
    br, ind, i, j: integer;
  begin
    dm.ZANR.Open;
    dm.GLUMAC.Open;
    dm.PRODUCENT.Open;
    dm.FILM.Open;
    dm.ULOGA.Open;
    dm.TIP_ULOGE.Open;
    dm.LISTA_FILM_PRODUCENT.Open;
    StringGrid.RowCount:=0;         //ciscenje StringGrid-a
    StringGrid.Cells[0, 0]:='';     //(ne bi trebalo da se cisti nulti red, ali meni
    StringGrid.Cells[1, 0]:='';     //nece da se izbrise samo)
    StringGrid.Cells[2, 0]:='';
    if((cbTipUloge.ItemIndex<>-1) and (cbProducent.ItemIndex<>-1)) //proverava da li su obavezna polja uneta
      then
        begin
          dm.TIP_ULOGE.Locate('Tip', cbTipUloge.Text, []);
          dm.PRODUCENT.Locate('Ime', cbProducent.Text, []);
          br:=0;
          dm.FILM.First;
            while(not(dm.FILM.Eof)) do
              begin
                dm.LISTA_FILM_PRODUCENT.First;
                while(not(dm.LISTA_FILM_PRODUCENT.Eof)) do
                  begin
                    if((dm.LISTA_FILM_PRODUCENT.FieldByName('ProducentID').Value=dm.PRODUCENT.FieldByName('ProducentID').Value) and (dm.LISTA_FILM_PRODUCENT.FieldByName('FilmID').Value=dm.FILM.FieldByName('FilmID').Value)) //proverava da li na listi postoji izabrani producent
                      then                                                                                                                                                                                                     //i trenutni film (da li je trenutni film producirao
                        begin                                                                                                                                                                                                  //odabrani producent)
                          dm.ULOGA.First;
                          while(not(dm.ULOGA.Eof)) do
                            begin
                              if((dm.ULOGA.FieldByName('FilmID').Value=dm.FILM.FieldByName('FilmID').Value) and (dm.ULOGA.FieldByName('TipUlogeID').Value=dm.TIP_ULOGE.FieldByName('TipUlogeID').Value)) //proverava da li trenutna uloga postoji u trenutnom filmu
                                then                                                                                                                                                                     //i da li je odabranog tipa
                                  begin
                                    dm.GLUMAC.Locate('GlumacID', dm.ULOGA.FieldByName('GlumacID').Value, []);
                                    br:=br+1;
                                    rezultati[br].film:=dm.FILM.FieldByName('Naziv').Value;         //potrebne vrednosti se cuvaju u nizu tipa rezultat (vidi gore type)
                                    rezultati[br].zanr:=dm.ZANR.FieldByName('NazivZanra').Value;
                                    rezultati[br].ime:=dm.GLUMAC.FieldByName('Ime').Value;
                                    rezultati[br].prezime:=dm.GLUMAC.FieldByName('Prezime').Value;
                                  end;
                              dm.ULOGA.Next;
                            end;
                        end;
                    dm.LISTA_FILM_PRODUCENT.Next;
                  end;
              dm.FILM.Next;
            end;
          if(br<>0) //ukoliko su nadjeni rezultati pretrage
            then
              begin
                for i:=0 to br-1 do                                 //sortiranje prema nazivu filma filma u rastuci redosledu
                  for j:=i+1 to br do
                    if(rezultati[i].film>rezultati[j].film)
                      then
                        begin
                          temp:=rezultati[j];
                          rezultati[j]:=rezultati[i];
                          rezultati[i]:=temp;
                        end;
                for i:=0 to br do                                   //ispis rezultsta
                  begin
                    StringGrid.Cells[0, i]:=rezultati[i+1].film;
                    StringGrid.Cells[1, i]:=rezultati[i+1].zanr;
                    StringGrid.Cells[2, i]:=rezultati[i+1].ime;
                    StringGrid.Cells[3, i]:=rezultati[i+1].prezime;
                  end;
                StringGrid.RowCount:=br;
              end
            else
              showmessage('Nema rezultata za unete parametre!');
        end
      else
        showmessage('Polja Naziv tipa uloge i Naziv producenta su obavezna!');
    dm.ZANR.Close;
    dm.GLUMAC.Close;
    dm.PRODUCENT.Open;
    dm.FILM.Close;
    dm.ULOGA.Close;
    dm.TIP_ULOGE.Close;
    dm.LISTA_FILM_PRODUCENT.Close;
  end;

end.
