unit cProdVenda;

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
   uENum,
   cControleEstoque,
   Datasnap.DBClient;

 Type
    TVenda = class

    private
      conexaoDB: TZConnection;
      F_vendaId : Integer;
      F_clienteId : Integer;
      F_dataVenda : TDateTime;
      F_totalVenda : Double;
    function getF_clienteId: integer;
    function getF_dataVenda: TDateTime;
    function getF_totalVenda: Double;
    function getF_vendaId: integer;
    procedure setF_clienteId(const Value: integer);
    procedure setF_dataVenda(const Value: TDateTime);
    procedure setF_totalVenda(const Value: Double);
    procedure setF_vendaId(const Value: integer);
    function InserirItens(cds: TClientDataSet; IdVenda: Integer): boolean;
    function ApagaItens(cds: TClientDataSet): boolean;
    function InNot(cds: TClientDataSet): String;
    function EsteItemExiste(vendaId, produtoId: Integer): Boolean;
    function AtualizarItem(cds: TClientDataSet): boolean;
    procedure RetornarEstoque(sCodigo: String; Acao: TAcaoExcluirEstoque);
    procedure BaixarEstoque(produtoId: Integer; Quantidade: Double);

    public
      constructor Create(aConexao: TZConnection);
      destructor Destroy; override;
      function Inserir(cds: TClientDataSet): integer;
      function Apagar: boolean;
      function Atualizar(cds: TClientDataSet): boolean;
      function Selecionar(id: integer; var cds: TClientDataSet): boolean;

    published
      property VendaId   : integer     read getF_vendaId     write setF_vendaId;
      property clienteId : integer     read getF_clienteId   write setF_clienteId;
      property dataVenda : TDateTime   read getF_dataVenda   write setF_dataVenda;
      property totalVenda : Double     read getF_totalVenda  write setF_totalVenda;
 end;

implementation

{$region 'Constructor e Destructor'}

constructor TVenda.Create(aConexao: TZConnection);
begin
   conexaoDB := aConexao;
end;

destructor TVenda.Destroy;
begin

  inherited;
end;

{$endregion}

{$region 'CRUDS'}
function TVenda.Apagar: boolean;
var
  qry: TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
               'Venda Nro: ' + IntToStr(vendaId), mtConfirmation,[mbYes, mbNo],0)=mrNo then

     begin
        Result:=false;
        abort;
     end;

  try
     Result:=true;
     conexaoDB.StartTransaction;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('Delete from vendasItens where ' +
                   'vendaId= :vendaId');
     qry.ParamByName('vendaId').AsInteger:= F_vendaId;

     try
       qry.ExecSQL;
       qry.SQL.Clear;
       qry.SQL.Add('Delete from vendas where ' +
                   'vendaId= :vendaId');
       qry.ParamByName('vendaId').AsInteger:= F_vendaId;
       qry.ExecSQL;
       conexaoDB.Commit;
     except
        conexaoDB.Rollback;
        Result:=false;
     end;

  finally
     if Assigned(qry) then
         FreeAndNil(qry);
  end;

  end;

function TVenda.Atualizar(cds: TClientDataSet): boolean;
var
  qry: TZQuery;
begin
  try
     Result:=true;
     conexaoDB.StartTransaction;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('UPDATE vendas SET ' +
                 'clienteId = :clienteId, '+
                 'dataVenda = :dataVenda, ' +
                 'totalVenda = :totalVenda ' +
                 ' WHERE vendaId = :vendaId ');
     qry.ParamByName('vendaId').AsInteger           :=Self.F_vendaId;
     qry.ParamByName('clienteId').AsInteger         :=Self.F_clienteId;
     qry.ParamByName('dataVenda').AsDateTime        :=Self.F_dataVenda;
     qry.ParamByName('totalVenda').AsFloat          :=Self.F_totalVenda;

     try
       //Update Vendas
       qry.ExecSQL;

       //Apaga itens no banco de dados que foram apagados na tela
       ApagaItens(cds);

       cds.First;

       while not cds.Eof do
       begin
         if EsteItemExiste(Self.F_vendaId, cds.FieldByName('produtoId').AsInteger) then
            AtualizarItem(cds)
         else
            InserirItens(cds, self.F_vendaId);
            cds.Next;
       end;
          conexaoDB.Commit;
     except
        Result:=false;
        conexaoDB.Rollback;
     end;

  finally
     if Assigned(qry) then
     FreeAndNil(qry);
  end;
end;

function  TVenda.EsteItemExiste(vendaId: Integer; produtoId: Integer): Boolean;
var
    qry: TZQuery;
begin
     try
       qry:=TZQuery.Create(nil);
       qry.Connection:=conexaoDB;
       qry.SQL.Clear;
       qry.SQL.Add('SELECT count(VendaId) AS Qtde ' +
                   'FROM vendasItens '+
                   'WHERE vendaId = :vendaId and produtoId = :produtoId ');
       qry.ParamByName('vendaId').AsInteger := vendaId;
       qry.ParamByName('produtoId').AsInteger := produtoId;
     try
       qry.Open;
       if qry.FieldByName('Qtde').AsInteger > 0 then
          Result:=true
       else
          Result:=false;
     except
          Result:=false;
     end;
     finally
       if Assigned(qry) then
       FreeAndNil(qry);
     end;
end;

function TVenda.Inserir(cds: TClientDataSet): integer;
var
  qry: TZQuery;
  IdVendaGerado : integer;
begin
   try
     conexaoDB.StartTransaction;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('INSERT INTO vendas ( clienteId, ' +
                 '                     dataVenda, ' +
                 '                     totalVenda ) ' +
                 ' VALUES             ( :clienteId, ' +
                 '                      :dataVenda, ' +
                 '                      :totalVenda )' );
     qry.ParamByName('clienteId').AsInteger         :=Self.F_clienteId;
     qry.ParamByName('dataVenda').AsDateTime        :=Self.F_dataVenda;
     qry.ParamByName('totalVenda').AsFloat          :=Self.F_totalVenda;
   try
      qry.ExecSQL;
      //RECUPERA O ID GERADO NO INSERT
      qry.SQL.Clear;
      qry.SQL.Add('SELECT SCOPE_IDENTITY() AS ID');
      qry.Open;

      //Id da tabela Master venda
      IdVendaGerado := qry.FieldByName('ID').AsInteger;

      {$region 'Grava na Tabela VendasItens'}
         cds.First;
         while not cds.Eof do
         begin
           InserirItens(cds, IdVendaGerado);
           cds.Next;
         end;
      {$endregion}

      conexaoDB.Commit;
      Result := IdVendaGerado;
   except
      conexaoDB.Rollback;
      Result:= -1;
   end;

finally
    if Assigned(qry) then
    FreeAndNil(qry);
end;

end;

function TVenda.InserirItens(cds: TClientDataSet; IdVenda: Integer): boolean;
var
  qry: TZQuery;
begin
   try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('INSERT INTO vendasItens (vendaId, produtoId, valorUnitario, quantidade, totalProduto) ' +
     'VALUES (:vendaId, :produtoId, :valorUnitario, :quantidade, :totalProduto)' );
     qry.ParamByName('vendaId').AsInteger          := IdVenda;
     qry.ParamByName('produtoId').AsInteger        := cds.FieldByName('produtoId').AsInteger;
     qry.ParamByName('valorUnitario').AsFloat      :=cds.FieldByName('ValorUnitario').AsFloat;
     qry.ParamByName('quantidade').AsFloat         :=cds.FieldByName('Quantidade').AsFloat;
     qry.ParamByName('totalProduto').AsFloat       :=cds.FieldByName('ValorTotalProduto').AsFloat;
   try
      conexaoDB.StartTransaction;
      qry.ExecSQL;
      conexaoDB.Commit;
      BaixarEstoque(cds.FieldByName('produtoId').AsInteger, cds.FieldByName('quantidade').AsFloat);
   except
      conexaoDB.Rollback;
      Result:= false;
   end;
finally
    if Assigned(qry) then
    FreeAndNil(qry);
end;

end;

function TVenda.Selecionar(id: integer; var cds: TClientDataSet): boolean;
var
  qry: TZQuery;
begin
try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('SELECT vendaId,' +
                 ' clienteId,' +
                 ' dataVenda,' +
                 ' totalVenda' +
                 ' from vendas' +
                 ' where vendaId = :vendaId');
     qry.ParamByName('vendaId').AsInteger := id;

     try
        qry.Open;
        Self.F_vendaId    := qry.FieldByName('vendaId').AsInteger;
        Self.F_clienteId  := qry.FieldByName('clienteId').AsInteger;
        Self.F_dataVenda  := qry.FieldByName('dataVenda').AsDateTime;
        Self.F_totalVenda := qry.FieldByName('totalVenda').AsFloat;


        {$region 'Selecionar a tabela vendasItens'}
        //Apaga o clientDataSet caso esteja com registro
        cds.First;
        while not cds.Eof do
        begin
          cds.Delete;
        end;

        //Seleciona os itens do banco de dados com a propriedade F_vendaId
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add('select vendasItens.produtoId,'+
                    ' produtos.nome,'+
                    ' vendasItens.valorUnitario,'+
                    ' vendasItens.quantidade,'+
                    ' vendasItens.totalProduto'+
                    ' from vendasItens' +
                    ' inner join produtos on produtos.produtoId = vendasItens.produtoId' +
                    ' where vendasItens.vendaId = :vendaId ');
                    qry.ParamByName('vendaId').AsInteger := self.F_vendaId;
                    qry.Open;

        //Le da query e coloca no clientDataSet
        qry.First;
        while not qry.Eof do
        begin
          cds.Append;
          cds.FieldByName('produtoId').AsInteger       := qry.FieldByName('produtoId').AsInteger;
          cds.FieldByName('nomeProduto').AsString      := qry.FieldByName('nome').AsString;
          cds.FieldByName('valorUnitario').AsFloat     := qry.FieldByName('valorUnitario').AsFloat;
          cds.FieldByName('quantidade').AsFloat        := qry.FieldByName('quantidade').AsFloat;
          cds.FieldByName('valorTotalProduto').AsFloat := qry.FieldByName('totalProduto').AsFloat;
          cds.Post;
          qry.Next;
        end;
        cds.First;
        {$endregion}

     except
        Result := false;
     end;

finally
    if Assigned(qry) then
       FreeAndNil(qry);
end;

end;

function TVenda.ApagaItens(cds: TClientDataSet): boolean;
var
   qry: TZQuery;
   sCodNoCds: string;
begin
   try
       Result:=true;
       sCodNoCds:= InNot(cds);  //Pega os codigos que est?o no cliente para selecionar o InNot no bando de dados
       RetornarEstoque(sCodNoCds, aeeApagar); //Retorna ao estoque
       qry:=TZQuery.Create(nil);
       qry.Connection:=conexaoDB;
       qry.SQL.Clear;
       qry.SQL.Add('DELETE FROM vendasItens WHERE vendaId = :vendaId ' +
                   'AND produtoId NOT IN ('+sCodNoCds+') ');
       qry.ParamByName('vendaId').AsInteger := Self.F_vendaId;

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

function TVenda.AtualizarItem(cds: TClientDataSet): boolean;
var
   qry: TZQuery;
begin
   try    
     Result:=true;
     RetornarEstoque(cds.FieldByName('produtoId').AsString, aeeAlterar);
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('UPDATE vendasItens ' +
                 ' SET valorUnitario = :valorUnitario, '+
                 ' quantidade = :quantidade, '+
                 ' totalProduto = :totalProduto ' +
                 ' WHERE vendaId = :vendaId AND produtoId = :produtoId ');
     qry.ParamByName('vendaId').AsInteger          := self.F_vendaId;
     qry.ParamByName('produtoId').AsInteger        := cds.FieldByName('produtoId').AsInteger;
     qry.ParamByName('valorUnitario').AsFloat      := cds.FieldByName('ValorUnitario').AsFloat;
     qry.ParamByName('quantidade').AsFloat         := cds.FieldByName('Quantidade').AsFloat;
     qry.ParamByName('totalProduto').AsFloat       := cds.FieldByName('ValorTotalProduto').AsFloat;

   try
      conexaoDB.StartTransaction;
      qry.ExecSQL;
      conexaoDB.Commit;
      BaixarEstoque(cds.FieldByName('produtoId').AsInteger, cds.FieldByName('quantidade').AsFloat);
   except
      conexaoDB.Rollback;
      result := false;
   end;

   finally
     if Assigned(qry) then          
        FreeAndNil(qry);
   end;
end;

function TVenda.InNot(cds: TClientDataSet): String;
var
   sInNot: string;
begin
   sInNot := EmptyStr;
   cds.First;
   while not cds.Eof do
   begin
     if sInNot=EmptyStr then
        sInNot := cds.FieldByName('produtoId').AsString
     else
        sInNot := sInNot + ',' + cds.FieldByName('produtoId').AsString;

        cds.Next;
   end;
      result := sInNot;
end;
{$endregion}

{$region 'Gets e Sets'}
function TVenda.getF_clienteId: integer;
begin
   Result := Self.F_clienteId;
end;

function TVenda.getF_dataVenda: TDateTime;
begin
   Result := Self.F_dataVenda;
end;

function TVenda.getF_totalVenda: Double;
begin
   Result := Self.F_totalVenda;
end;

function TVenda.getF_vendaId: integer;
begin
   Result := Self.F_vendaId;
end;

procedure TVenda.setF_clienteId(const Value: integer);
begin
  self.F_clienteId := Value;
end;

procedure TVenda.setF_dataVenda(const Value: TDateTime);
begin
  Self.F_dataVenda := Value;
end;

procedure TVenda.setF_totalVenda(const Value: Double);
begin
   Self.F_totalVenda := Value;
end;

procedure TVenda.setF_vendaId(const Value: integer);
begin
   Self.F_vendaId := Value;
end;


{$endregion}

{$region 'Controle de Estoque'}
//utilizar no update e delete do item
Procedure TVenda.RetornarEstoque(sCodigo: String; Acao: TAcaoExcluirEstoque);
var
   qry: TZQuery;
   oControleEstoque: TControleEstoque;
begin
   qry:=TZQuery.Create(nil);
   qry.Connection:=conexaoDB;
   qry.SQL.Clear;
   qry.SQL.Add('Select produtoId, quantidade ' +
               ' from vendasItens '+
               ' where vendaId = :vendaId ');
   if Acao=aeeApagar then
      qry.SQL.Add(' AND produtoId NOT IN ('+sCodigo+') ')
   else
      qry.SQL.Add(' AND produtoId = ('+sCodigo+') ');
      qry.ParamByName('vendaId').AsInteger := Self.F_vendaId;
   try
     oControleEstoque := TControleEstoque.Create(ConexaoDB);
     qry.Open;
     qry.First;

     while not qry.Eof do
     begin
       oControleEstoque.ProdutoId := qry.FieldByName('produtoId').AsInteger;
       oControleEstoque.Quantidade := qry.FieldByName('quantidade').AsFloat;
       oControleEstoque.RetornarEstoque;
       qry.Next;
     end;
   finally
     if Assigned(oControleEstoque) then
        FreeAndNil(oControleEstoque);
   end;
end;


Procedure TVenda.BaixarEstoque(produtoId: Integer; Quantidade: Double);
var
  oControleEstoque: TControleEstoque;
begin
   try
     oControleEstoque := TControleEstoque.Create(conexaoDB);
     oControleEstoque.ProdutoId := produtoId;
     oControleEstoque.Quantidade := quantidade;
     oControleEstoque.BaixarEstoque;
   finally
     if Assigned(oControleEstoque) then
     FreeAndNil(oControleEstoque);
   end;
end;

{$endregion}
end.
