inherited frmConProduto: TfrmConProduto
  Caption = 'frmConProduto'
  ExplicitWidth = 697
  ExplicitHeight = 414
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    ExplicitWidth = 691
    inherited mskPesquisa: TMaskEdit
      ExplicitTop = 24
      ExplicitWidth = 689
    end
  end
  inherited Panel2: TPanel
    ExplicitLeft = 0
    ExplicitTop = 49
    ExplicitWidth = 691
    ExplicitHeight = 295
  end
  inherited Panel3: TPanel
    inherited btnFechar: TBitBtn
      ExplicitLeft = 612
    end
  end
  inherited qryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT      produtoId,'
      '                  nome,'
      #9' descricao,'
      #9' valor,'
      #9' quantidade,'
      #9' categoriaId'
      'FROM produtos ')
    object qryListagemprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object qryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 255
    end
    object qryListagemvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
    end
    object qryListagemquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object qryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo Categoria'
      FieldName = 'categoriaId'
    end
  end
end
