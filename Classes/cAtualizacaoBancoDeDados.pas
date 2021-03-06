unit cAtualizacaoBancoDeDados;

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
    ZDataset; //Lista de units

type
   TAtualizaBancoDeDados = class

private

public
   conexaoDB: TZConnection;
   constructor Create(aConexao: TZConnection);
   destructor Destroy; override;
   procedure ExecutaDiretoBancoDeDados(aScript: String);
end;

type
   TAtualizaBancoDeDadosMSSQL = class

private
   conexaoDB: TZConnection;
public
   function AtualizarBancoDeDadosMSSQL: Boolean;
   constructor Create(aConexao: TZConnection);
   destructor Destroy; override;
end;

implementation

uses cAtualizacaoTabelaMSSQL, cAtualizacaoCampoMSSQL;

{ TAtualizaBancoDeDados }

{$region 'Constructor e Desctructor'}

constructor TAtualizaBancoDeDados.Create(aConexao: TZConnection);
begin
    conexaoDB:=aConexao;
end;

destructor TAtualizaBancoDeDados.Destroy;
begin
  inherited;
end;

constructor TAtualizaBancoDeDadosMSSQL.Create(aConexao: TZConnection);
begin
   conexaoDB:=aConexao;
end;

destructor TAtualizaBancoDeDadosMSSQL.Destroy;
begin

  inherited;
end;

{$endregion}

procedure TAtualizaBancoDeDados.ExecutaDiretoBancoDeDados(aScript: String);
var qry:TZQuery;
begin
    try
      qry:=TZQuery.Create(nil);
      qry.Connection:=conexaoDB;
      qry.SQL.Clear;
      qry.SQL.Add(aScript);
      try
         conexaoDB.StartTransaction;
         qry.ExecSQL;
         conexaoDB.Commit;
      except
         conexaoDB.Rollback;
      end;
    finally
       qry.Close;
       if Assigned(qry) then
          FreeAndNil(qry);
    end;
end;

{ TAtualizaBancoDeDadosMSSQL }

function TAtualizaBancoDeDadosMSSQL.AtualizarBancoDeDadosMSSQL: Boolean;
var
   OAtualizaDB: TAtualizaBancoDeDados;
   oTabela: TAtualizacaoTabelaMSSQL;
   oCampo: TAtualizacaoCampoMSSQL;
begin
   try
       //Classe principal de atualização
       OAtualizaDB := TAtualizaBancoDeDados.Create(conexaoDB);

       //Classe filha
       oTabela := TAtualizacaoTabelaMSSQL.Create(conexaoDB);
       oCampo := TAtualizacaoCampoMSSQL.Create(conexaoDB);

   finally
       if Assigned(OAtualizaDB) then
          FreeAndNil(OAtualizaDB);

       if Assigned(oTabela) then
          FreeAndNil(oTabela);
   end;

end;

end.
