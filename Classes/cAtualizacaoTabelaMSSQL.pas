unit cAtualizacaoTabelaMSSQL;

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
    cAtualizacaoBancoDeDados,
    cUsuario;

type
    TAtualizacaoTabelaMSSQL = class(TAtualizaBancoDeDados)

private
    function TabelaExiste(aNomeTabela: String): Boolean;
    procedure Categoria;
    procedure Cliente;
    procedure Produto;
    procedure VendasItem;
    procedure Usuario;
    procedure Venda;
    procedure AcaoAcesso;
    procedure UsuariosAcaoAcesso;

protected

public
    constructor Create(aConexao: TZConnection);
    destructor Destroy; override;
end;

implementation

{ TAtualizacaoTabelaMSSQL }

{$region 'Constructor e Desctructor'}

constructor TAtualizacaoTabelaMSSQL.Create(aConexao: TZConnection);
begin
   conexaoDB:=aConexao;
   Categoria;
   Cliente;
   Produto;
   Venda;
   VendasItem;
   Usuario;
   AcaoAcesso;
   UsuariosAcaoAcesso;

end;

destructor TAtualizacaoTabelaMSSQL.Destroy;
begin

  inherited;
end;

{$endregion}

function TAtualizacaoTabelaMSSQL.TabelaExiste(aNomeTabela: String): Boolean;
var qry:TZQuery;
begin
  try
    Result:=False;
    qry:=TZQuery.Create(nil);
    qry.Connection:=conexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add(' SELECT OBJECT_ID (:NomeTabela) As ID');
    qry.ParamByName('NomeTabela').AsString:=aNomeTabela;
    qry.Open;

    if qry.FieldByName('ID').AsInteger > 0 then
       Result:=True;

  finally
     qry.Close;
     if Assigned(qry) then
        FreeAndNil(qry);
  end;

end;

procedure TAtualizacaoTabelaMSSQL.AcaoAcesso;
begin
   if not TabelaExiste('acaoAcesso') then
   begin
       ExecutaDiretoBancoDeDados(
            ' create table acaoAcesso ( ' +
            ' acaoAcessoId int IDENTITY(1,1) not null, ' +
            ' descricao varchar(100) not null, ' +
            ' chave varchar(60) not null, ' +
            ' primary key (acaoAcessoId) ) '
       );
   end;
end;

procedure TAtualizacaoTabelaMSSQL.Categoria;
begin
   if not TabelaExiste('categorias') then
   begin
       ExecutaDiretoBancoDeDados(
            ' create table categorias ( ' +
            ' categoriaId int IDENTITY(1,1) not null, ' +
            ' descricao varchar(30) null, ' +
            ' status bit null, ' +
            ' primary key (categoriaId) ) '
       );
   end;
end;

procedure TAtualizacaoTabelaMSSQL.Cliente;
begin
   if not TabelaExiste('clientes') then
   begin
       ExecutaDiretoBancoDeDados(
            ' create table clientes  ( ' +
                     ' clienteId int IDENTITY(1,1) not null, ' +
                     ' nome varchar(60) null, ' +
                     ' endereco varchar(60) null, ' +
                     ' cidade varchar(50) null, ' +
                     ' bairro varchar(40) null, ' +
                     ' cep varchar(10) null, ' +
                     ' telefone varchar(14) null, ' +
                     ' email varchar(100) null, ' +
                     ' dataDeNascimento datetime null, ' +
                     ' primary key (clienteId) )'
       );
   end;
end;

procedure TAtualizacaoTabelaMSSQL.Produto;
begin
   if not TabelaExiste('produtos') then
   begin
       ExecutaDiretoBancoDeDados(
            'CREATE TABLE produtos ( ' +
            ' produtoId int IDENTITY(1,1) NOT NULL, ' +
            '	nome varchar(60) NULL, ' +
	          ' descricao varchar(255) NULL, ' +
	          ' valor decimal(18,5) default 0.00000 NULL, ' +
	          ' quantidade decimal(18,5) default 0.00000 NULL, ' +
	          ' categoriaId int NULL, ' +
	          ' PRIMARY KEY (produtoId), ' +
	          ' CONSTRAINT FK_ProdutosCategorias ' +
	          ' FOREIGN KEY (categoriaId) references categorias(categoriaId) )'
       );
   end;
end;

procedure TAtualizacaoTabelaMSSQL.VendasItem;
begin
   if not TabelaExiste('vendasItens') then
   begin
       ExecutaDiretoBancoDeDados(
          ' create table vendasItens ( ' +
          ' vendaId int not null, ' +
          ' produtoId int not null, ' +
          ' valorUnitario decimal (18,5) default 0.00000, ' +
          ' quantidade decimal (18,5) default 0.00000, ' +
          ' totalProduto decimal (18,5) default 0.00000, ' +
          ' primary key (vendaId,produtoId), ' +
          ' constraint fk_vendasItensProdutos foreign key (produtoId) ' +
          ' references produtos(produtoId) )'
       );
   end;
end;

procedure TAtualizacaoTabelaMSSQL.Usuario;
var
   oUsuario: TUsuario;
begin
   if not TabelaExiste('usuarios') then
   begin
       ExecutaDiretoBancoDeDados(
           ' Create table usuarios ( ' +
           ' usuarioId int identity(1,1) not null, ' +
           ' nome varchar(50) not null, ' +
           ' senha varchar(40) not null, ' +
           ' PRIMARY KEY (usuarioId) ' +
           ') '
       );
   end;
   try
      oUsuario := TUsuario.Create(conexaoDB);
      oUsuario.Nome:='Admin';
      oUsuario.Senha:='1234';
      if not oUsuario.UsuarioExiste(oUsuario.Nome) then
          oUsuario.Inserir;
   finally
      if Assigned(oUsuario) then
         FreeAndNil(oUsuario);
   end;
end;

procedure TAtualizacaoTabelaMSSQL.UsuariosAcaoAcesso;
begin
   if not TabelaExiste('usuariosAcaoAcesso') then
   begin
       ExecutaDiretoBancoDeDados(
            ' create table usuariosAcaoAcesso ( ' +
            ' usuarioId int NOT NULL, ' +
            ' acaoAcessoId int not null, ' +
            ' ativo bit not null default 1, ' +
            ' primary key (usuarioId, acaoAcessoId), ' +
            ' constraint fk_UsuarioAcaoAcessoUsuario ' +
            ' foreign key (usuarioId) references usuarios(usuarioId), ' +
            ' constraint fk_UsuarioAcaoAcessoAcaoAcesso '+
            ' foreign key (acaoAcessoId) references acaoAcesso(acaoAcessoId) ) '
       );

   end;
end;

procedure TAtualizacaoTabelaMSSQL.Venda;
begin
   if not TabelaExiste('vendas') then
   begin
       ExecutaDiretoBancoDeDados(
            ' create table vendas ( ' +
            ' vendaId int IDENTITY(1,1) NOT NULL, ' +
            ' clienteId int not null, ' +
            ' datavenda datetime default getdate(), ' +
            ' totalvenda decimal (18,5) default 0.00000, ' +
            ' primary key (vendaId), ' +
            ' constraint fk_vendascliente foreign key (clienteId) ' +
            ' references clientes(clienteId) ) '
       );

   end;
end;
end.
