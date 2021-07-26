object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 298
  Width = 561
  object conexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    TransactIsolationLevel = tiReadCommitted
    Connected = True
    SQLHourGlass = True
    HostName = 'localhost\SQL2017EL'
    Port = 1433
    Database = 'vendas'
    User = 'sa'
    Password = 'cidadao'
    Protocol = 'mssql'
    LibraryLocation = 'C:\ProjetoDelphi\ntwdblib.dll'
    Left = 488
    Top = 56
  end
  object qryScriptCategorias: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'if OBJECT_ID ('#39'categorias'#39') IS NULL  '
      'BEGIN'
      'create table categorias ('
      'categoriasId int IDENTITY(1,1) not null,'
      'descricao varchar(30) null,'
      'primary key (categoriasId) )'
      'END')
    Params = <>
    Left = 48
    Top = 32
  end
  object qryScriptProdutos: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'if OBJECT_ID ('#39'produtos'#39') IS NULL  '
      'BEGIN'
      'CREATE TABLE produtos ('
      #9'produtoId int IDENTITY(1,1) NOT NULL,'
      #9'nome varchar(60) NULL,'
      #9'descricao varchar(255) NULL,'
      #9'valor decimal(18,5) default 0.00000 NULL,'
      #9'quantidade decimal(18,5) default 0.00000 NULL,'
      #9'categoriaId int NULL,'
      #9'PRIMARY KEY (produtoId),'
      #9'CONSTRAINT FK_ProdutosCategorias'
      #9'FOREIGN KEY (categoriaId) references categorias(categoriaId) '
      ')'
      'END'#9)
    Params = <>
    Left = 48
    Top = 144
  end
  object qryScriptVendas: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'if OBJECT_ID ('#39'vendas'#39') IS NULL  '
      'BEGIN'
      '     create table vendas ('
      '     vendaId int IDENTITY(1,1) NOT NULL,'
      '     clienteId int not null,'
      '     datavenda datetime default getdate(),'
      '     totalvenda decimal (18,5) default 0.00000,'
      '     primary key (vendaId),'
      '     constraint fk_vendascliente foreign key (clienteId)'
      '     references clientes(clienteId) '
      ')'
      'END')
    Params = <>
    Left = 184
    Top = 176
  end
  object qryScriptClientes: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'if OBJECT_ID ('#39'clientes'#39') IS NULL  '
      'BEGIN'
      'create table clientes  ('
      '         clienteId int IDENTITY(1,1) not null,'
      '         nome varchar(60) null,'
      '         endereco varchar(60) null,'
      '         cidade varchar(50) null,'
      '         bairro varchar(40) null,'
      '         cep varchar(10) null,'
      '         telefone varchar(14) null,'
      '         email varchar(100) null,'
      '         dataDeNascimento datetime null,'
      '         primary key (clienteId)'
      '  )'
      'END')
    Params = <>
    Left = 48
    Top = 88
  end
  object qryScriptVendasItens: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'if OBJECT_ID ('#39'vendasItens'#39') IS NULL  '
      'BEGIN'
      '     create table vendasItens ('
      '     vendaId int not null,'
      '     produtoId int not null,'
      '     valorUnitario decimal (18,5) default 0.00000,'
      '     quantidade decimal (18,5) default 0.00000,'
      '     totalProduto decimal (18,5) default 0.00000,'
      '     primary key (vendaId,produtoId),'
      '     constraint fk_vendasItensProdutos foreign key (produtoId)'
      '     references produtos(produtoId) '
      ')'
      'END')
    Params = <>
    Left = 48
    Top = 208
  end
  object qryScriptUsuarios: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'usuarios'#39') IS NULL'
      'BEGIN'
      '   Create table usuarios ('
      '   usuarioId int identity(1,1) not null,'
      '   nome varchar(50) not null,'
      '   senha varchar(40) not null,   '
      '   PRIMARY KEY (usuarioId) '
      ')'
      'END')
    Params = <>
    Left = 184
    Top = 112
  end
end
