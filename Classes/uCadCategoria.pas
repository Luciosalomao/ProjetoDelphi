unit uCadCategoria;

interface

uses System.Classes, Vcl.Controls, Vcl.Dialogs, ExtCtrls,
 ZAbstractConnection, ZConnection,ZAbstractRODataset, ZAbstractDataset,
 System.SysUtils, ZDataset; //Lista de units

Type
  TCategoria=class   //Declara??o do tipo da classe
  private
    //Vari?veis privadas somente dentro da classe
    conexaoDB: TZConnection; //variavel da conex?o interna com o banco
    F_categoriaid: integer;
    F_descricao: string;
    function getCodigo: integer;
    function getDescricao: string;
    procedure setCodigo(const Value: integer);
    procedure setDescricao(const Value: string);
  public
    //Vari?veis p?blicas
    constructor Create(aConexao: TZConnection); //Construtor da classe
    destructor Destroy; override; //Destroi a classe usar o override por causa de substrever
    function Inserir: boolean;
    function Apagar: boolean;
    function Atualizar: boolean;
    function Selecionar(id: integer): boolean;
  published
  //Variaveis publicas utilizadas para propriedades da classe para fornecer informa??es em runtime
     property codigo: integer read getCodigo write setCodigo;
     property descricao: string read getDescricao write setDescricao;
  end;

implementation

{ TCategoria }

{$region 'Constructor e Destructor'}
  constructor TCategoria.Create(aConexao: TZConnection);
  begin
     conexaoDB:=aConexao;
  end;
    destructor TCategoria.Destroy;
  begin
    inherited;
  end;
 {$endregion}

{$region 'M?todos Gets'}
  function TCategoria.getCodigo: integer;
  begin
    Result:= Self.F_categoriaid;
  end;

  function TCategoria.getDescricao: string;
  begin
    Result:= Self.F_descricao;
  end;
{$endregion}

{$region 'M?todos Sets'}
  procedure TCategoria.setCodigo(const Value: integer);
  begin
     Self.F_categoriaid:=Value;
  end;

  procedure TCategoria.setDescricao(const Value: string);
  begin
     Self.F_descricao:=Value;
  end;
{$endregion}

{$region 'M?todos CRUDS'}
  function TCategoria.Apagar: boolean;
  var
    qry: TZQuery;
  begin
     if MessageDlg('Apagar o Registro: '+#13+#13+
                   'C?digo: ' + IntToStr(F_categoriaId)+#13+
                     'Descri??o: '+F_descricao, mtConfirmation,[mbYes, mbNo],0)=mrNo then
       begin
          Result:=false;
          abort;   
       end;
     
     try
       Result:=true;
       qry:=TZQuery.Create(nil);
       qry.Connection:=conexaoDB;
       qry.SQL.Clear;
       qry.SQL.Add('Delete from categorias where ' + 
                   'categoriaId = :categoriaId');
       qry.ParamByName('categoriaId').AsInteger:=F_categoriaId;
     try
       qry.ExecSQL;
     Except
       Result:=False;
     end
     finally
       if Assigned(qry) then  
       FreeAndNil(qry);    
     end;
     
  end;

  function TCategoria.Atualizar: boolean;
  var
    qry: TZQuery;
  begin
     try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('Update categorias set descricao=:descricao where categoriaId=:categoriaId');
     qry.ParamByName('categoriaId').AsInteger:=Self.F_categoriaid;
     qry.ParamByName('descricao').AsString:=Self.F_descricao;      
     try
       qry.ExecSQL;
     Except
       Result:=False;
     end;
     finally
     if Assigned(qry) then  //Verifica se o objeto existe na mem?ria
     FreeAndNil(qry);    //Apaga a mem?ria
  end;
  end;

  function TCategoria.Inserir: boolean;
  var
    qry: TZQuery;
  begin
    try
      Result:=true;
      qry:=TZQuery.Create(nil); //Dentro de uma classe n?o pode usar (Self), porque n?o ? um objeto f?sico
      qry.Connection:=conexaoDB;
      qry.SQL.Clear;
      qry.SQL.Add('Insert into categorias (descricao) values (:descricao)');
      qry.ParamByName('descricao').AsString:=Self.F_descricao; //O valor de F_descricao chega atraves do m?todo Set
      try
        qry.ExecSQL;
      Except
        Result:=False;
      end;      
    finally
      if Assigned(qry) then  //Verifica se o objeto existe na mem?ria
         FreeAndNil(qry);    //Apaga a mem?ria
    end;
  end;

  function TCategoria.Selecionar(id: integer): boolean;
  var
    qry: TZQuery;
  begin
    try
      Result:=true;
      qry:=TZQuery.Create(nil);
      qry.Connection:=conexaoDB;
      qry.SQL.Clear;
      qry.SQL.Add('Select categoriaId, descricao from categorias where categoriaId=:categoriaId');
      qry.ParamByName('categoriaId').AsInteger:=id; 
      {ParamByName ? usado para passar um par?metro para query}
      try
        qry.Open;
        Self.F_categoriaid:=qry.FieldByName('categoriaId').AsInteger;
        Self.F_descricao:=qry.FieldByName('descricao').AsString;
        {FieldByName recebe um field do banco de dados}
      Except
        Result:=false;
      end;      
    finally
      if Assigned(qry) then
        FreeAndNil(qry);
    end;
  end;
{$endregion}
end.
