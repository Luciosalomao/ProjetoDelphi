object frmRelProdutoCategoria: TfrmRelProdutoCategoria
  Left = 0
  Top = 0
  Caption = 'frmRelProdutoCategoria'
  ClientHeight = 596
  ClientWidth = 822
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      AutoExpand = False
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 0
        Top = 10
        Width = 372
        Height = 24
        Caption = 'Listagem de Produtos por Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 40
        Width = 718
        Height = 19
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 200
      Width = 718
      Height = 27
      AutoExpand = False
      BandType = btFooter
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 7
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 7
        Width = 60
        Height = 20
        Align = faLeft
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 349
        Top = 6
        Width = 32
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 388
        Top = 6
        Width = 38
        Height = 16
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 380
        Top = 6
        Width = 8
        Height = 16
        Alignment = taCenter
        Caption = '/'
      end
      object RLLabel3: TRLLabel
        Left = 300
        Top = 6
        Width = 49
        Height = 16
        Caption = 'P'#225'gina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object BandaDeGrupo: TRLGroup
      Left = 38
      Top = 97
      Width = 718
      Height = 103
      DataFields = 'categoriaId'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 25
        BandType = btHeader
        Color = clBtnFace
        ParentColor = False
        Transparent = False
        object RLLabel4: TRLLabel
          Left = 3
          Top = 6
          Width = 103
          Height = 16
          Caption = 'Cod. Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 321
          Top = 6
          Width = 128
          Height = 16
          DataField = 'DescricaoCategoria'
          DataSource = dtsProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 110
          Top = 6
          Width = 76
          Height = 16
          DataField = 'categoriaId'
          DataSource = dtsProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLLabel5: TRLLabel
          Left = 187
          Top = 6
          Width = 131
          Height = 16
          Caption = 'Nome da Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 25
        Width = 718
        Height = 25
        AutoExpand = False
        BandType = btColumnHeader
        object RLPanel2: TRLPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 25
          Align = faClient
          AutoSize = True
          Color = clInfoBk
          ParentColor = False
          Transparent = False
          object RLLabel8: TRLLabel
            Left = 442
            Top = 3
            Width = 41
            Height = 16
            Caption = 'Pre'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel9: TRLLabel
            Left = 489
            Top = 4
            Width = 78
            Height = 16
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLLabel10: TRLLabel
          Left = 76
          Top = 3
          Width = 115
          Height = 16
          Caption = 'Nome de Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel11: TRLLabel
          Left = 3
          Top = 3
          Width = 49
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 50
        Width = 718
        Height = 22
        AutoExpand = False
        object RLDBText5: TRLDBText
          Left = 3
          Top = 3
          Width = 57
          Height = 16
          DataField = 'produtoId'
          DataSource = dtsProdutos
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 76
          Top = 3
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = dtsProdutos
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 448
          Top = 3
          Width = 30
          Height = 16
          Alignment = taRightJustify
          DataField = 'valor'
          DataSource = dtsProdutos
          DisplayMask = '#0.00'
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 500
          Top = 3
          Width = 67
          Height = 16
          Alignment = taRightJustify
          DataField = 'quantidade'
          DataSource = dtsProdutos
          DisplayMask = '#0.00'
          Text = ''
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 72
        Width = 718
        Height = 28
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 490
          Top = 7
          Width = 77
          Height = 16
          Alignment = taRightJustify
          DataField = 'valor'
          DataSource = dtsProdutos
          DisplayMask = '#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLLabel6: TRLLabel
          Left = 309
          Top = 7
          Width = 180
          Height = 16
          Alignment = taRightJustify
          Caption = 'Total Estoque da Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 111
          Top = 7
          Width = 88
          Height = 16
          Alignment = taRightJustify
          Caption = 'Pre'#231'o M'#233'dio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult2: TRLDBResult
          Left = 201
          Top = 7
          Width = 101
          Height = 16
          Alignment = taRightJustify
          DataField = 'valor'
          DataSource = dtsProdutos
          DisplayMask = '#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riAverage
          ParentFont = False
          Text = ''
        end
        object RLDraw3: TRLDraw
          Left = 0
          Top = 0
          Width = 718
          Height = 7
          Align = faTop
          DrawKind = dkLine
        end
      end
    end
  end
  object qryProdutos: TZQuery
    Connection = dmConexao.conexaoDB
    AutoCalcFields = False
    Active = True
    SQL.Strings = (
      'SELECT produtos.produtoId, '
      '       produtos.nome,'
      '       produtos.descricao,'
      '       produtos.valor,'
      '       produtos.quantidade,'
      '       produtos.categoriaId,'
      '       categorias.descricao AS DescricaoCategoria'
      '       FROM produtos'
      
        'LEFT JOIN categorias ON categorias.categoriaId = produtos.catego' +
        'riaId'
      'ORDER BY produtos.categoriaId, produtos.produtoId'
      '')
    Params = <>
    Left = 656
    Top = 40
    object qryProdutosprodutoId: TIntegerField
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object qryProdutosnome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryProdutosdescricao: TWideStringField
      FieldName = 'descricao'
      Size = 255
    end
    object qryProdutosvalor: TFloatField
      FieldName = 'valor'
    end
    object qryProdutosquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object qryProdutoscategoriaId: TIntegerField
      FieldName = 'categoriaId'
    end
    object qryProdutosDescricaoCategoria: TWideStringField
      FieldName = 'DescricaoCategoria'
      Size = 30
    end
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 584
    Top = 24
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 523
    Top = 24
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 435
    Top = 24
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 355
    Top = 24
  end
end
