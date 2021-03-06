unit cAtualizacaoCampoMSSQL;

interface
uses
    System.Classes,
    Vcl.Controls,
    Vcl.Dialogs,
    ExtCtrls,
    ZAbstractConnection,
    ZConnection,
    ZAbstractRODataset,
    ZAbstractDataset,
    System.SysUtils,
    ZDataset,
    cAtualizacaoBancoDeDados;

type
   TAtualizacaoCampoMSSQL = class(TAtualizaBancoDeDados)

private
    function CampoExisteNaTabela(aNomeTabela, aCampo: String): Boolean;
    procedure Versao1;
public
   constructor Create(aConexao: TZConnection);
   destructor Destroy; override;

end;

implementation

{ TAtualizacaoCampoMSSQL }

function TAtualizacaoCampoMSSQL.CampoExisteNaTabela(aNomeTabela,
  aCampo: String): Boolean;
var qry:TZQuery;
begin
try
  Result:=false;
  qry:=TZQuery.Create(nil);
  qry.Connection:=conexaoDB;
  qry.SQL.Clear;
  qry.SQL.Add(' SELECT COUNT(COLUMN_NAME) AS Qtde ');
  qry.SQL.Add(' FROM INFORMATION_SCHEMA.COLUMNS ');
  qry.SQL.Add(' WHERE TABLE_NAME =:Tabela ');
  qry.SQL.Add(' AND COLUMN_NAME =:Campo ');
  qry.ParamByName('Tabela').AsString:=aNomeTabela;
  qry.ParamByName('Campo').AsString:=aCampo;
  qry.Open;

  if qry.FieldByName('Qtde').AsInteger > 0 then
     Result:=true;

finally
   qry.Close;
   if Assigned(qry) then
      FreeAndNil(qry);
end;

end;

{$region 'Constructor e Desctructor'}

constructor TAtualizacaoCampoMSSQL.Create(aConexao: TZConnection);
begin
   conexaoDB := aConexao;
   Versao1;
end;

destructor TAtualizacaoCampoMSSQL.Destroy;
begin

  inherited;
end;

{$endregion}


procedure TAtualizacaoCampoMSSQL.Versao1;
begin
   //Adicionando coluna na tabela
   if CampoExisteNaTabela('usuarios','nivel')=false then
     begin
        ExecutaDiretoBancoDeDados('ALTER TABLE usuarios ADD nivel bit NULL');
     end;

   //Removendo coluna na tabela
   {if not CampoExisteNaTabela('usuarios', 'nivel') then
     begin
       //ExecutaDiretoBancoDeDados('ALTER TABLE usuarios DROP COLUMN teste');
     end;   }
end;


end.
