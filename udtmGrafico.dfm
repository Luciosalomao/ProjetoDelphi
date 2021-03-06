object dtmGrafico: TdtmGrafico
  OldCreateOrder = False
  Height = 313
  Width = 601
  object dstProdutoEstoque: TDataSource
    DataSet = qryProdutoEstoque
    Left = 57
    Top = 26
  end
  object qryProdutoEstoque: TZQuery
    Connection = dmConexao.conexaoDB
    SQL.Strings = (
      
        'SELECT CONVERT(VARCHAR, produtoId) +'#39' - '#39'+nome As Label, Quantid' +
        'ade AS Value FROM produtos')
    Params = <>
    Left = 57
    Top = 74
    object qryProdutoEstoqueLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 93
    end
    object qryProdutoEstoqueValue: TFloatField
      FieldName = 'Value'
    end
  end
  object qryVendaValorPorCliente: TZQuery
    Connection = dmConexao.conexaoDB
    SQL.Strings = (
      
        'SELECT CONVERT(VARCHAR, vendas.clienteId) + '#39' - '#39' + clientes.nom' +
        'e AS Label, '
      'SUM(vendas.totalvenda) AS Value'
      'FROM Vendas'
      '    INNER JOIN Clientes ON Clientes.clienteId = vendas.clienteId'
      
        'WHERE vendas.datavenda BETWEEN CONVERT(DATE, GETDATE()-7) AND CO' +
        'NVERT(DATE, GETDATE())'
      'GROUP BY vendas.clienteId, clientes.nome')
    Params = <>
    Left = 312
    Top = 72
    object qryVendaValorPorClienteLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 93
    end
    object qryVendaValorPorClienteValue: TFloatField
      FieldName = 'Value'
      ReadOnly = True
    end
  end
  object qryVendasMaiores: TZQuery
    Connection = dmConexao.conexaoDB
    Active = True
    SQL.Strings = (
      
        'SELECT TOP 10 CONVERT(VARCHAR, vi.produtoId) + '#39' - '#39' + p.nome AS' +
        ' Label, SUM(vi.totalProduto) AS Value'
      'FROM vendasItens as vi'
      'INNER JOIN produtos AS P ON p.produtoId = vi.produtoId'
      'GROUP BY vi.produtoId, p.nome'
      'ORDER BY Value DESC')
    Params = <>
    Left = 312
    Top = 152
    object qryVendasMaioresLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 93
    end
    object qryVendasMaioresValue: TFloatField
      FieldName = 'Value'
      ReadOnly = True
    end
  end
  object qryVendasUltimaSemana: TZQuery
    Connection = dmConexao.conexaoDB
    SQL.Strings = (
      
        'SELECT vendas.datavenda AS Label, SUM(vendas.totalvenda) AS Valu' +
        'e'
      'from Vendas'
      
        'where vendas.datavenda between CONVERT(DATE, GETDATE()-7) AND CO' +
        'NVERT(DATE, GETDATE()) '
      'GROUP BY vendas.datavenda')
    Params = <>
    Left = 144
    Top = 192
    object qryVendasUltimaSemanaLabel: TDateTimeField
      FieldName = 'Label'
      Required = True
    end
    object qryVendasUltimaSemanaValue: TFloatField
      FieldName = 'Value'
      ReadOnly = True
    end
  end
end
