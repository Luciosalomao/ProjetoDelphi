object dtmVendas: TdtmVendas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 319
  Width = 572
  object qryCliente: TZQuery
    Connection = dmConexao.conexaoDB
    Active = True
    SQL.Strings = (
      'Select clienteId, nome from clientes')
    Params = <>
    Left = 480
    Top = 32
    object qryClienteclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object qryClientenome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
  end
  object qryProdutos: TZQuery
    Connection = dmConexao.conexaoDB
    Active = True
    SQL.Strings = (
      'Select '
      '   produtoId,'
      '   nome,'
      '   valor,'
      '   quantidade'
      'from produtos')
    Params = <>
    Left = 480
    Top = 112
    object qryProdutosprodutoId: TIntegerField
      DisplayLabel = 'Cod. Produto'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object qryProdutosnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object qryProdutosvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
    end
    object qryProdutosquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
  end
  object dtsCliente: TDataSource
    DataSet = qryCliente
    Left = 352
    Top = 40
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 352
    Top = 112
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 40
    object cdsItensVendaprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
    end
    object cdsItensVendaNomeProduto: TStringField
      DisplayLabel = 'Nome do Produto'
      FieldName = 'NomeProduto'
      Size = 60
    end
    object cdsItensVendaQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object cdsItensVendaValorUnitario: TFloatField
      DisplayLabel = 'Total do Item'
      FieldName = 'ValorUnitario'
    end
    object cdsItensVendaValorTotalProduto: TFloatField
      DisplayLabel = 'Total do Produto'
      FieldName = 'ValorTotalProduto'
    end
  end
  object dtsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 224
    Top = 112
  end
end
