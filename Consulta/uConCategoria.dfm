inherited frmConCategoria: TfrmConCategoria
  Caption = 'Consulta de Categorias'
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
      'Select categoriaId, descricao, status from categorias')
    object qryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object qryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 30
      FieldName = 'descricao'
      Size = 30
    end
    object qryListagemstatus: TBooleanField
      DisplayLabel = 'Status'
      DisplayWidth = 8
      FieldName = 'status'
    end
  end
end
