unit cControleEstoque;

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
   Data.DB,
   Datasnap.DBClient;

Type
   TControleEstoque = class

   private
     conexaoDB: TZConnection;
     F_ProdutoId: Integer;
     F_Quantidade: Double;

   public
     constructor Create(aConexao: TZConnection);
     destructor Destroy; override;
     function BaixarEstoque: Boolean;
     function RetornarEstoque: Boolean;

   published
     property ProdutoId: Integer read F_ProdutoId write F_ProdutoId;
     property Quantidade: Double read F_Quantidade write F_Quantidade;
end;

implementation

{$region 'Constructor e Destructor'}

constructor TControleEstoque.Create(aConexao: TZConnection);
begin
   conexaoDB := aConexao;
end;

destructor TControleEstoque.Destroy;
begin

  inherited;
end;

{$endregion}

function TControleEstoque.BaixarEstoque: Boolean;
var
   qry: TZQuery;
begin
   try
     Result := true;
     qry := TZQuery.Create(nil);
     qry.Connection := ConexaoDB;

     qry.SQL.Clear;
     qry.SQL.Add('Update produtos ' +
                 ' set quantidade = quantidade - :qtdeBaixa '+
                 ' where produtoId = :produtoId ');
     qry.ParamByName('produtoId').AsInteger := produtoId;
     qry.ParamByName('qtdeBaixa').AsFloat := quantidade;
      try
         conexaoDB.StartTransaction;
         qry.ExecSQL;
         conexaoDB.Commit;
      Except
         conexaoDB.Rollback;
         Result:=False;
      end;
   finally
        if Assigned(qry) then
          FreeAndNil(qry);
   end;

end;

function TControleEstoque.RetornarEstoque: Boolean;
var
   qry: TZQuery;
begin
     try
     Result := true;
     qry := TZQuery.Create(nil);
     qry.Connection := ConexaoDB;

     qry.SQL.Clear;
     qry.SQL.Add('Update produtos ' +
                 ' set quantidade = quantidade + :qtdeBaixa '+
                 ' where produtoId = :produtoId ');

     qry.ParamByName('produtoId').AsInteger := produtoId;
     qry.ParamByName('qtdeBaixa').AsFloat:= quantidade;
      try
         conexaoDB.StartTransaction;
         qry.ExecSQL;
         conexaoDB.Commit;
      Except
         conexaoDB.Rollback;
         Result:=False;
      end;

     finally
        if Assigned(qry) then
        FreeAndNil(qry);
     end;
end;

end.
