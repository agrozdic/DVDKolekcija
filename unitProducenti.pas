unit unitProducenti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TformProducenti = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    editSifra: TEdit;
    editIme: TEdit;
    editEmail: TEdit;
    btnUpisi: TButton;
    btnObrisi: TButton;
    btnIzmeni: TButton;
    btnIzadji: TButton;
    StringGrid: TStringGrid;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
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
  formProducenti: TformProducenti;

implementation

uses unitDM;

{$R *.dfm}

procedure TformProducenti.FormActivate(Sender: TObject);
  var
    i: integer;
  begin
    editSifra.Text:='';           //pocetne vrednosti
    editIme.Text:='';
    editEmail.Text:='';
    StringGrid.FixedCols:=0;            //podesavanje StringGrid-a da izgleda kao ListBox
    StringGrid.FixedRows:=0;
    StringGrid.GridLineWidth:=0;
    StringGrid.ColCount:=3;
    StringGrid.ColWidths[0]:=40;
    StringGrid.ColWidths[1]:=150;
    StringGrid.ColWidths[2]:=200;
    i:=0;                                               //popunjavanje StringGrid-a
    dm.PRODUCENT.Open;
    dm.PRODUCENT.First;
    while(not(dm.PRODUCENT.Eof)) do
      begin
        StringGrid.Cells[0, i]:=dm.PRODUCENT.FieldByName('ProducentID').AsString;
        StringGrid.Cells[1, i]:=dm.PRODUCENT.FieldByName('Ime').AsString;
        StringGrid.Cells[2, i]:=dm.PRODUCENT.FieldByName('Email').AsString;
        i:=i+1;
        dm.PRODUCENT.Next;
      end;
    StringGrid.RowCount:=i;
    dm.PRODUCENT.Close;
  end;

procedure TformProducenti.btnUpisiClick(Sender: TObject);
  var
    i, int, provera: integer;
  begin
    dm.PRODUCENT.Open;
    val(editSifra.Text, int, provera); //proverava da li je sifra broj
    if((editSifra.Text<>'') and (editIme.Text<>'')) //proverava da li su obavezna polja uneta
      then
        begin
          if(provera=0) //ako je broj (val ce vratiti 0 u poslednju promenljivu), moze se nastaviti
            then
              begin
                if(dm.PRODUCENT.Locate('ProducentID', editSifra.Text, [])=false) //proverava da li postoji rezultat sa upisanom sifrom
                  then
                    begin
                      dm.PRODUCENT.Append;                                      //unos u bazu
                      dm.PRODUCENT.FieldByName('ProducentID').Value:=StrToInt(editSifra.Text);
                      dm.PRODUCENT.FieldByName('Ime').Value:=editIme.Text;
                      dm.PRODUCENT.FieldByName('Email').Value:=editEmail.Text;
                      dm.PRODUCENT.Post;
                      showmessage('Producent je uspesno upisan!');
                      i:=0;                                                     //osvezavanje StringGrid-a
                      dm.PRODUCENT.First;
                      while(not(dm.PRODUCENT.Eof)) do
                        begin
                          StringGrid.Cells[0, i]:=dm.PRODUCENT.FieldByName('ProducentID').AsString;
                          StringGrid.Cells[1, i]:=dm.PRODUCENT.FieldByName('Ime').AsString;
                          StringGrid.Cells[2, i]:=dm.PRODUCENT.FieldByName('Email').AsString;
                          i:=i+1;
                          dm.PRODUCENT.Next;
                        end;
                      StringGrid.RowCount:=i
                    end
                  else
                    begin
                      showmessage('Vec postoji producent sa upisanom sifrom!');        //ispis postojeceg producenta
                      editSifra.Text:=dm.PRODUCENT.FieldByName('ProducentID').Value;
                      editIme.Text:=dm.PRODUCENT.FieldByName('Ime').Value;
                      editEmail.Text:=dm.PRODUCENT.FieldByName('Email').Value;
                    end;
              end
            else
              showmessage('Sifra mora biti broj!');
        end
      else
        showmessage('Polja Sifra i Ime su obavezna!');
    dm.PRODUCENT.Close;
  end;

procedure TformProducenti.btnObrisiClick(Sender: TObject);
  var
    i, int, provera: integer;
  begin
    dm.PRODUCENT.Open;
    val(editSifra.Text, int, provera); //proverava da li je sifra broj
    if(editSifra.Text<>'') //proverava da li su sva obavezna polja untea
      then
        begin
          if(provera=0) //ako je broj (val ce vratiti 0 u poslednju promenljivu), moze se nastaviti
            then
              begin
                if(dm.PRODUCENT.Locate('ProducentID', editSifra.Text, [])=true) //proverava da li postoji rezultat sa upisanom sifrom
                  then
                    begin
                      dm.PRODUCENT.Locate('ProducentID', editSifra.Text, []); //brisanje iz base
                      dm.PRODUCENT.Delete;
                      showmessage('Uspesno obrisano!');
                      i:=0;                                                     //osvezavanje StringGrid-a
                      dm.PRODUCENT.First;
                     while(not(dm.PRODUCENT.Eof)) do
                        begin
                          StringGrid.Cells[0, i]:=dm.PRODUCENT.FieldByName('ProducentID').AsString;
                          StringGrid.Cells[1, i]:=dm.PRODUCENT.FieldByName('Ime').AsString;
                          StringGrid.Cells[2, i]:=dm.PRODUCENT.FieldByName('Email').AsString;
                          i:=i+1;
                          dm.PRODUCENT.Next;
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
    dm.PRODUCENT.Close;
  end;

procedure TformProducenti.btnIzmeniClick(Sender: TObject);
  var
    i, int, provera: integer;
  begin
    dm.PRODUCENT.Open;
    val(editSifra.Text, int, provera); //proverava da li je sifra broj
    if((editSifra.Text<>'') and (editIme.Text<>'')) //proverava da li su obavezna polja uneta
      then
        begin
          if(provera=0) //ako je broj (val ce vratiti 0 u poslednju promenljivu), moze se nastaviti
            then
              begin
                if(dm.PRODUCENT.Locate('ProducentID', editSifra.Text, [])=true) //proverava da li postoji rezultat sa upisanom sifrom
                 then
                    begin
                      dm.PRODUCENT.Locate('ProducentID', editSifra.Text, []);   //izmena podataka u bazi
                      dm.PRODUCENT.Edit;
                      dm.PRODUCENT.FieldByName('Ime').Value:=editIme.Text;
                      dm.PRODUCENT.FieldByName('Email').Value:=editEmail.Text;
                      dm.PRODUCENT.Post;
                      showmessage('Uspesno izmenjeni podaci!');
                      i:=0;                                                     //osvezavanje StringGrid-a
                      dm.PRODUCENT.First;
                      while(not(dm.PRODUCENT.Eof)) do
                        begin
                          StringGrid.Cells[0, i]:=dm.PRODUCENT.FieldByName('ProducentID').AsString;
                          StringGrid.Cells[1, i]:=dm.PRODUCENT.FieldByName('Ime').AsString;
                          StringGrid.Cells[2, i]:=dm.PRODUCENT.FieldByName('Email').AsString;
                          i:=i+1;
                          dm.PRODUCENT.Next;
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
        showmessage('Polja Sifra i Ime su obavezna!');
    dm.PRODUCENT.Close;
  end;

end.
