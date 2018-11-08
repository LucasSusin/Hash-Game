{##########################
	# UCS - Universidade de Caxias do Sul (CETEC)
	# Série: II Ano
	# Autor: Lucas Simon Susin
	# Data de criação: 08/11/2018 14:08
	# Data da última modificação: 08/11/2018 15:29
	#########################}




unit UntPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, math, Vcl.StdCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure jogador();
    procedure bot();
    function teste(): integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: integer;

  m: array [0 .. 2, 0 .. 2] of string;
  b: string;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  x,y: integer;
begin
  m[1, 1] := 'O';
  StringGrid1.Cells[1, 1] := m[1,1];
end;

function TForm1.teste: integer;
begin
  if ((StringGrid1.Cells[0, 0] = 'O') and (StringGrid1.Cells[0, 1] = 'O') and
    (StringGrid1.Cells[0, 2] = 'O')) or
    ((StringGrid1.Cells[1, 0] = 'O') and (StringGrid1.Cells[1, 1] = 'O') and
    (StringGrid1.Cells[1, 2] = 'O')) or
    ((StringGrid1.Cells[2, 0] = 'O') and (StringGrid1.Cells[2, 1] = 'O') and
    (StringGrid1.Cells[2, 2] = 'O')) then
  begin
    result := 1;
    exit;
  end;
  if ((StringGrid1.Cells[0, 0] = 'O') and (StringGrid1.Cells[1, 0] = 'O') and
    (StringGrid1.Cells[2, 0] = 'O')) or
    ((StringGrid1.Cells[0, 1] = 'O') and (StringGrid1.Cells[1, 1] = 'O') and
    (StringGrid1.Cells[2, 1] = 'O')) or
    ((StringGrid1.Cells[0, 2] = 'O') and (StringGrid1.Cells[1, 2] = 'O') and
    (StringGrid1.Cells[2, 2] = 'O')) or
    ((StringGrid1.Cells[0, 0] = 'O') and (StringGrid1.Cells[1, 1] = 'O') and
    (StringGrid1.Cells[2, 2] = 'O')) or
    ((StringGrid1.Cells[2, 0] = 'O') and (StringGrid1.Cells[1, 1] = 'O') and
    (StringGrid1.Cells[0, 2] = 'O')) then
  begin
    result := 1;
    exit;
  end;

  if ((StringGrid1.Cells[0, 0] = 'O') and (StringGrid1.Cells[0, 1] = 'O') and
    (StringGrid1.Cells[0, 2] = 'O')) or
    ((StringGrid1.Cells[1, 0] = 'O') and (StringGrid1.Cells[1, 1] = 'O') and
    (StringGrid1.Cells[1, 2] = 'O')) or
    ((StringGrid1.Cells[2, 0] = 'O') and (StringGrid1.Cells[2, 1] = 'O') and
    (StringGrid1.Cells[2, 2] = 'O')) then
  begin
    result := 2;
    exit;
  end;
  if ((StringGrid1.Cells[0, 0] = 'X') and (StringGrid1.Cells[1, 0] = 'X') and
    (StringGrid1.Cells[2, 0] = 'X')) or
    ((StringGrid1.Cells[0, 1] = 'X') and (StringGrid1.Cells[1, 1] = 'X') and
    (StringGrid1.Cells[2, 1] = 'X')) or
    ((StringGrid1.Cells[0, 2] = 'X') and (StringGrid1.Cells[1, 2] = 'X') and
    (StringGrid1.Cells[2, 2] = 'X')) or
    ((StringGrid1.Cells[0, 0] = 'X') and (StringGrid1.Cells[1, 1] = 'X') and
    (StringGrid1.Cells[2, 2] = 'X')) or
    ((StringGrid1.Cells[2, 0] = 'X') and (StringGrid1.Cells[1, 1] = 'X') and
    (StringGrid1.Cells[0, 2] = 'X')) then
  begin
    result := 2;
    exit;
  end;

end;

procedure TForm1.StringGrid1Click(Sender: TObject);
var
  aux,x,y: integer;
begin
  aux:=0;
  jogador();
  teste();
  if teste = 2 then
  begin
    ShowMessage('You won!');
    Form1.close;

  end;

  if a = 1 then
  begin
    bot();
    teste();
    if teste = 1 then
    begin
      ShowMessage('PC Won!');
      Form1.close;

    end;

  end;

  for x := 0 to 2 do
  begin
    for y := 0 to 2 do
    begin
     if m[x,y] <> '' then
     aux:=aux+1

    end;

  end;
  if aux=9 then
  begin
    ShowMessage('Draw!');
      Form1.close;
  end;

end;

procedure TForm1.jogador;
var
  aux: integer;
begin
  aux := 0;

  if (m[StringGrid1.Row, StringGrid1.Col] = '') then

  begin
    m[StringGrid1.Row, StringGrid1.Col] := 'X';
    StringGrid1.Cells[StringGrid1.Col, StringGrid1.Row] := 'X';
    a := 1;
  end
  else
  begin
    if (m[StringGrid1.Row, StringGrid1.Col] <> '') then
    begin
      ShowMessage('Occupied position!');
      a := 0
    end;
  end;

end;

procedure TForm1.bot;
var
  aux,x,y: integer;

begin
  aux := 0;
  x := 1;
  y := 1;
  while aux <> 1 do
  begin
    if StringGrid1.Cells[y, x] = '' then
    begin
      StringGrid1.Cells[y, x] := 'O';
      m[x, y] := 'O';
      aux := aux + 1;

    end
    else
    begin
      x := RandomRange(0, 3);
      y := RandomRange(0, 3);

    end;

  end;

end;

end.
