unit cCadProduto;

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
   ZDataset;

 Type
    TProduto = class
 private
    conexaoDB: TZConnection;
    F_ProdutoId: integer;
    F_Nome: string;
    F_Descricao: string;
    F_Valor: Double;
    F_Quantidade: Double;
    F_CategoriaID: integer;
    function getCategoriaID: integer;
    function getDescricao: string;
    function getNome: string;
    function getProdutoId: integer;
    function getQuantidade: Double;
    function getValor: Double;
    procedure setCategoriaID(const Value: integer);
    procedure setDescricao(const Value: string);
    procedure setNome(const Value: string);
    procedure setProdutoId(const Value: integer);
    procedure setQuantidade(const Value: Double);
    procedure setValor(const Value: Double);

  public
    constructor Create(aConexao: TZConnection);
    destructor Destroy; override;
    function Inserir: boolean;
    function Apagar: boolean;
    function Atualizar: boolean;
    function Selecionar(id: integer): boolean;

  published
    property ProdutoId :integer   read getProdutoId   write setProdutoId;
    property Nome :string         read getNome        write setNome;
    property Descricao :string    read getDescricao   write setDescricao;
    property Valor :Double        read getValor       write setValor;
    property Quantidade :Double   read getQuantidade  write setQuantidade;
    property CategoriaID :integer read getCategoriaID write setCategoriaID;
 end;

implementation

{$region 'Constructor e Destructor'}

constructor TProduto.Create(aConexao: TZConnection);
begin
   conexaoDB := aConexao;
end;

destructor TProduto.Destroy;
begin
  inherited;
end;

{$endregion}

{$region 'CRUDS'}

function TProduto.Apagar: boolean;
var
  qry: TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
               'C?digo: ' + IntToStr(F_ProdutoId)+#13+
                 'Descri??o: '+F_Nome, mtConfirmation,[mbYes, mbNo],0)=mrNo then
     begin
        Result:=false;
        abort;
     end;

  try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('Delete from produtos where ' +
                   'produtoId= :produtoId');
     qry.ParamByName('produtoId').AsInteger:=F_ProdutoId;
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

function TProduto.Atualizar: boolean;
var
  qry: TZQuery;
begin
   try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('UPDATE produtos SET ' +
                 'nome = :nome, '+
                 'descricao = :descricao, ' +
                 'valor = :valor, ' +
                 'quantidade = :quantidade, '+
                 'categoriaId = :categoriaId ' +
                 'WHERE produtoId = :produtoId');
     qry.ParamByName('produtoId').AsInteger         :=Self.F_ProdutoId;
     qry.ParamByName('nome').AsString               :=Self.F_nome;
     qry.ParamByName('descricao').AsString          :=Self.F_Descricao;
     qry.ParamByName('valor').AsFloat               :=Self.F_Valor;
     qry.ParamByName('quantidade').AsFloat          :=Self.F_Quantidade;
     qry.ParamByName('categoriaId').AsInteger       :=Self.F_CategoriaID;

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

function TProduto.Inserir: boolean;
var
  qry: TZQuery;
begin
   try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('INSERT INTO produtos ( nome, '+
                 '                      descricao, '+
                 '                      valor, '+
                 '                      quantidade, '+
                 '                      categoriaId ) '+
                 ' VALUES               ( :nome, '+
                 '                       :descricao, ' +
                 '                       :valor, ' +
                 '                       :quantidade, '+
                 '                       :categoriaId )' );
     qry.ParamByName('nome').AsString               :=Self.F_nome;
     qry.ParamByName('descricao').AsString          :=Self.F_Descricao;
     qry.ParamByName('valor').AsFloat               :=Self.F_Valor;
     qry.ParamByName('quantidade').AsFloat          :=Self.F_Quantidade;
     qry.ParamByName('categoriaId').AsInteger       :=Self.F_CategoriaID;

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

function TProduto.Selecionar(id: integer): boolean;
var qry:TZQuery;
begin
    try
      Result:=true;
      qry:=TZQuery.Create(nil);
      qry.Connection:=conexaoDB;
      qry.SQL.Clear;
      qry.SQL.Add('Select  produtoId, '+
                 ' nome, '+
                 ' descricao, '+
                 ' valor, '+
                 ' quantidade, '+
                 ' categoriaId  '+
            ' from produtos ' +
            ' where produtoId = :produtoId');
      qry.ParamByName('produtoId').AsInteger:=id;
      try
        qry.Open;

        Self.F_ProdutoId := qry.FieldByName('produtoId').AsInteger;
        Self.F_Nome := qry.FieldByName('nome').AsString;
        Self.F_Descricao := qry.FieldByName('descricao').AsString;
        Self.F_Valor := qry.FieldByName('valor').AsFloat;
        self.F_Quantidade := qry.FieldByName('quantidade').AsFloat;
        self.F_CategoriaID := qry.FieldByName('categoriaId').AsInteger;
      Except
        Result := false;
      end;
    finally
       if Assigned(qry) then
       FreeAndNil(qry);
    end;
end;

{$endregion}

{$region 'GETS e SETS'}

function TProduto.getCategoriaID: integer;
begin
  Result := Self.F_CategoriaID;
end;

function TProduto.getDescricao: string;
begin
   Result := Self.F_Descricao;
end;

function TProduto.getNome: string;
begin
   Result := Self.F_Nome;
end;

function TProduto.getProdutoId: integer;
begin
   Result := Self.F_ProdutoId;
end;

function TProduto.getQuantidade: Double;
begin
   Result := Self.F_Quantidade;
end;

function TProduto.getValor: Double;
begin
   Result := Self.F_Valor;
end;


procedure TProduto.setCategoriaID(const Value: integer);
begin
   Self.F_CategoriaID := Value;
end;

procedure TProduto.setDescricao(const Value: string);
begin
   Self.F_Descricao := Value;
end;

procedure TProduto.setNome(const Value: string);
begin
   Self.F_Nome := Value;
end;

procedure TProduto.setProdutoId(const Value: integer);
begin
   Self.F_ProdutoId := Value;
end;

procedure TProduto.setQuantidade(const Value: Double);
begin
   Self.F_Quantidade := Value;
end;

procedure TProduto.setValor(const Value: Double);
begin
   Self.F_Valor := Value;
end;

{$endregion}



end.
