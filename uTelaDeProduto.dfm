inherited frmTelaProdutos: TfrmTelaProdutos
  Caption = 'Cadastro de Produtos'
  ClientHeight = 468
  ClientWidth = 836
  ExplicitWidth = 842
  ExplicitHeight = 497
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 836
    Height = 427
    ExplicitWidth = 836
    ExplicitHeight = 427
    inherited TabListagem: TTabSheet
      ExplicitWidth = 828
      ExplicitHeight = 399
      inherited pnlListagemTopo: TPanel
        Width = 828
        ExplicitWidth = 828
      end
      inherited grdListagem: TDBGrid
        Width = 828
        Height = 342
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoCategoria'
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitWidth = 828
      ExplicitHeight = 399
      object lblDescricao: TLabel
        Left = 5
        Top = 133
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object lblValor: TLabel
        Left = 3
        Top = 261
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object lblQuantidade: TLabel
        Left = 179
        Top = 261
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object lblCategoria: TLabel
        Left = 575
        Top = 77
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object edtProdutoId: TLabeledEdit
        Tag = 1
        Left = 3
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 96
        Width = 566
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
      end
      object edtDescricao: TMemo
        Left = 3
        Top = 152
        Width = 814
        Height = 89
        MaxLength = 255
        TabOrder = 3
      end
      object edtValor: TCurrencyEdit
        Left = 3
        Top = 280
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edtQuantidade: TCurrencyEdit
        Left = 179
        Top = 280
        Width = 121
        Height = 21
        DisplayFormat = '0.00;-R$ ,0.00'
        TabOrder = 5
      end
      object edtCategoriaId: TDBLookupComboBox
        Left = 575
        Top = 96
        Width = 242
        Height = 21
        KeyField = 'categoriaId'
        ListField = 'descricao'
        ListSource = dsCategoria
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 427
    Width = 836
    ExplicitTop = 427
    ExplicitWidth = 836
    inherited btnFechar: TBitBtn
      Left = 756
      ExplicitLeft = 756
    end
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT p.produtoId,'
      '       p.nome,'
      #9'   p.descricao,'
      #9'   p.valor,'
      #9'   p.quantidade,'
      #9'   p.categoriaId,'
      #9'   c.descricao As DescricaoCategoria'
      'FROM produtos as p'
      '     LEFT JOIN categorias as c on c.categoriaId = p.categoriaId')
    object qryListagemprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      Origin = 'p'
      ReadOnly = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'p'
      Size = 60
    end
    object qryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'p'
      Size = 255
    end
    object qryListagemvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Origin = 'p'
    end
    object qryListagemquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Origin = 'p'
    end
    object qryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'd. Categoria'
      FieldName = 'categoriaId'
      Origin = 'p'
    end
    object qryListagemDescricaoCategoria: TWideStringField
      DisplayLabel = 'Descri'#231#227'o da  Categoria'
      FieldName = 'DescricaoCategoria'
      Origin = 'c.descricao'
      Size = 30
    end
  end
  object qryCategoria: TZQuery
    Connection = dmConexao.conexaoDB
    Active = True
    SQL.Strings = (
      'SELECT categoriaId, descricao from categorias')
    Params = <>
    Left = 404
    Top = 40
    object qryCategoriacategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object qryCategoriadescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dsCategoria: TDataSource
    DataSet = qryCategoria
    Left = 468
    Top = 40
  end
end
