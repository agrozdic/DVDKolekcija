unit unitGlumci;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids;

type
  TformGlumci = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    editSifra: TEdit;
    editIme: TEdit;
    editPrezime: TEdit;
    editMesto: TEdit;
    btnUpisi: TButton;
    btnObrisi: TButton;
    btnIzmeni: TButton;
    btnIzadji: TButton;
    editDatum: TEdit;
    StringGrid: TStringGrid;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure btnIzadjiClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnUpisiClick(Sender: TObject);
    procedure btnObrisiClick(Sender: TObject);
    procedure btnIzmeniClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formGlumci: TformGlumci;

implementation

uses unitDM;

{$R *.dfm}

procedure TformGlumci.btnIzadjiClick(Sender: TObject);
  begin
    Close;
  end;

procedure TformGlumci.FormActivate(Sender: TObject);
  var
    i: integer;
  begin
    editSifra.Text:='';         //pocetne vrednosti
    editIme.Text:='';
    editPrezime.Text:='';
    editDatum.Text:='';
    editMesto.Text:='';
    StringGrid.FixedCols:=0;        //podesavanje StringGrid-a da izgleda kao ListBox
    StringGrid.FixedRows:=0;
    StringGrid.GridLineWidth:=0;
    StringGrid.ColCount:=5;
    StringGrid.ColWidths[0]:=40;
    StringGrid.ColWidths[4]:=200;
    i:=0;                                               //popunjavanje StringGrid-a
    dm.GLUMAC.Open;
    dm.GLUMAC.First;
    while(not(dm.GLUMAC.Eof)) do
      begin
        StringGrid.Cells[0, i]:=dm.GLUMAC.FieldByName('GlumacID').AsString;
        StringGrid.Cells[1, i]:=dm.GLUMAC.FieldByName('Ime').AsString;
        StringGrid.Cells[2, i]:=dm.GLUMAC.FieldByName('Prezime').AsString;
        StringGrid.Cells[3, i]:=dm.GLUMAC.FieldByName('DatumRodjenja').AsString;
        StringGrid.Cells[4, i]:=dm.GLUMAC.FieldByName('MestoRodjenja').AsString;
        i:=i+1;
        dm.GLUMAC.Next;
      end;
    StringGrid.RowCount:=i;
    dm.GLUMAC.Close;
  end;

procedure TformGlumci.btnUpisiClick(Sender: TObject);
  var
    i, int, provera: integer;
  begin
    dm.GLUMAC.Open;
    val(editSifra.Text, int, provera); //proverava da li je sifra broj
    if((editSifra.Text<>'') and (editIme.Text<>'') and (editPrezime.Text<>'') and (editDatum.Text<>'')) //proverava da li su obavezna polja uneta
      then
        begin
          if(provera=0) //ako je broj (val ce vratiti 0 u poslednju promenljivu), moze se nastaviti
            then
              begin
                if(dm.GLUMAC.Locate('GlumacID', editSifra.Text, [])=false) //proverava da li postoji rezultat sa upisanom sifrom
                  then
                    begin
                      dm.GLUMAC.Append;                                       //unos u bazu
                      dm.GLUMAC.FieldByName('GlumacID').Value:=StrToInt(editSifra.Text);
                      dm.GLUMAC.FieldByName('Ime').Value:=editIme.Text;
                      dm.GLUMAC.FieldByName('Prezime').Value:=editPrezime.Text;
                      dm.GLUMAC.FieldByName('DatumRodjenja').Value:=StrToDate(editDatum.Text);
                      dm.GLUMAC.FieldByName('MestoRodjenja').Value:=editMesto.Text;
                      dm.GLUMAC.Post;
                      showmessage('Glumac je uspesno upisan!');
                      i:=0;                                           //osvezavanje StringGrid-a
                      dm.GLUMAC.First;
                      while(not(dm.GLUMAC.Eof)) do
                        begin
                          StringGrid.Cells[0, i]:=dm.GLUMAC.FieldByName('GlumacID').AsString;
                          StringGrid.Cells[1, i]:=dm.GLUMAC.FieldByName('Ime').AsString;
                          StringGrid.Cells[2, i]:=dm.GLUMAC.FieldByName('Prezime').AsString;
                          StringGrid.Cells[3, i]:=dm.GLUMAC.FieldByName('DatumRodjenja').AsString;
                          StringGrid.Cells[4, i]:=dm.GLUMAC.FieldByName('MestoRodjenja').AsString;
                          i:=i+1;
                          dm.GLUMAC.Next;
                        end;
                      StringGrid.RowCount:=i;
                    end
                  else
                    begin
                      showmessage('Vec postoji glumac sa upisanom sifrom!');        //ispis postojeceg glumca
                      editSifra.Text:=dm.GLUMAC.FieldByName('GlumacID').Value;
                      editIme.Text:=dm.GLUMAC.FieldByName('Ime').Value;
                      editPrezime.Text:=dm.GLUMAC.FieldByName('Prezime').Value;
                      editDatum.Text:=DateToStr(dm.GLUMAC.FieldByName('DatumRodjenja').Value);
                      editMesto.Text:=dm.GLUMAC.FieldByName('MestoRodjenja').Value;
                    end;
              end
            else
              showmessage('Sifra mora biti broj!');
        end
      else
        showmessage('Polja Sifra, Ime, Prezime i Datum su obavezna!');
    dm.GLUMAC.Close;
  end;

procedure TformGlumci.btnObrisiClick(Sender: TObject);
  var
    i, int, provera: integer;
  begin
    dm.GLUMAC.Open;
    val(editSifra.Text, int, provera); //proverava da li je sifra broj
    if(editSifra.Text<>'') //proverava da li su sva obavezna polja untea
      then
        begin
          if(provera=0) //ako je broj (val ce vratiti 0 u poslednju promenljivu), moze se nastaviti
            then
              begin
                if(dm.GLUMAC.Locate('GlumacID', editSifra.Text, [])=true) //proverava da li postoji rezultat sa upisanom sifrom
                  then
                    begin
                      dm.GLUMAC.Locate('GlumacID', editSifra.Text, []); //brisanje iz base
                      dm.GLUMAC.Delete;
                      showmessage('Uspesno obrisano!');
                      i:=0;                                           //osvezavanje StringGrid-a
                      dm.GLUMAC.First;
                      while(not(dm.GLUMAC.Eof)) do
                        begin
                          StringGrid.Cells[0, i]:=dm.GLUMAC.FieldByName('GlumacID').AsString;
                          StringGrid.Cells[1, i]:=dm.GLUMAC.FieldByName('Ime').AsString;
                          StringGrid.Cells[2, i]:=dm.GLUMAC.FieldByName('Prezime').AsString;
                          StringGrid.Cells[3, i]:=dm.GLUMAC.FieldByName('DatumRodjenja').AsString;
                          StringGrid.Cells[4, i]:=dm.GLUMAC.FieldByName('MestoRodjenja').AsString;
                          i:=i+1;
                          dm.GLUMAC.Next;
                        end;
                      StringGrid.RowCount:=i;
                    end
                  else
                   showmessage('Ne postoji uneta sifra!');
              end
            else
              showmessage('Sifra mora biti broj!');
        end
      else
        showmessage('Unesite sifru!');
    dm.GLUMAC.Close;
  end;

procedure TformGlumci.btnIzmeniClick(Sender: TObject);
  var
    i, int, provera: integer;
  begin
    dm.GLUMAC.Open;
    val(editSifra.Text, int, provera); //proverava da li je sifra broj
    if((editSifra.Text<>'') and (editIme.Text<>'') and (editPrezime.Text<>'') and (editDatum.Text<>'')) //proverava da li su obavezna polja uneta
      then
        begin
          if(provera=0) //ako je broj (val ce vratiti 0 u poslednju promenljivu), moze se nastaviti
            then
              begin
                if(dm.GLUMAC.Locate('GlumacID', editSifra.Text, [])=true) //proverava da li postoji rezultat sa upisanom sifrom
                 then
                    begin
                      dm.GLUMAC.Locate('GlumacID', editSifra.Text, []);         //izmena podataka u bazi
                      dm.GLUMAC.Edit;
                      dm.GLUMAC.FieldByName('Ime').Value:=editIme.Text;
                      dm.GLUMAC.FieldByName('Prezime').Value:=editPrezime.Text;
                      dm.GLUMAC.FieldByName('DatumRodjenja').Value:=StrToDate(editDatum.Text);
                      dm.GLUMAC.FieldByName('MestoRodjenja').Value:=editMesto.Text;
                      dm.GLUMAC.Post;
                      showmessage('Uspesno izmenjeni podaci!');
                      i:=0;                                                     //osvezavanje StringGrid-a
                      dm.GLUMAC.First;
                      while(not(dm.GLUMAC.Eof)) do
                        begin
                          StringGrid.Cells[0, i]:=dm.GLUMAC.FieldByName('GlumacID').AsString;
                          StringGrid.Cells[1, i]:=dm.GLUMAC.FieldByName('Ime').AsString;
                          StringGrid.Cells[2, i]:=dm.GLUMAC.FieldByName('Prezime').AsString;
                          StringGrid.Cells[3, i]:=dm.GLUMAC.FieldByName('DatumRodjenja').AsString;
                          StringGrid.Cells[4, i]:=dm.GLUMAC.FieldByName('MestoRodjenja').AsString;
                          i:=i+1;
                          dm.GLUMAC.Next;
                        end;
                      StringGrid.RowCount:=i;
                    end
                  else
                    showmessage('Ne postoji uneta sifra!');
              end
            else
              showmessage('Sifra mora biti broj!');
        end
      else
        showmessage('Polja Sifra, Ime, Prezime i Datum su obavezna!');
    dm.GLUMAC.Close;
  end;

end.
