object frmRelCadProduto: TfrmRelCadProduto
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rios de Produtos'
  ClientHeight = 549
  ClientWidth = 781
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
    Left = -21
    Top = -6
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
        Width = 229
        Height = 24
        Caption = 'Listagem de Produtos'
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
      Top = 144
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
    object RLBand1: TRLBand
      Left = 38
      Top = 122
      Width = 718
      Height = 22
      AutoExpand = False
      object RLDBText1: TRLDBText
        Left = 3
        Top = 3
        Width = 57
        Height = 16
        DataField = 'produtoId'
        DataSource = dtsProdutos
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 76
        Top = 3
        Width = 36
        Height = 16
        DataField = 'nome'
        DataSource = dtsProdutos
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 445
        Top = 3
        Width = 30
        Height = 16
        Alignment = taRightJustify
        DataField = 'valor'
        DataSource = dtsProdutos
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 500
        Top = 3
        Width = 67
        Height = 16
        Alignment = taRightJustify
        DataField = 'quantidade'
        DataSource = dtsProdutos
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 25
      AutoExpand = False
      BandType = btColumnHeader
      object RLPanel1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 25
        Align = faClient
        AutoSize = True
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object RLLabel4: TRLLabel
          Left = 434
          Top = 4
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
        object RLLabel7: TRLLabel
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
      object RLLabel6: TRLLabel
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
      object RLLabel5: TRLLabel
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
  end
  object qryProdutos: TZQuery
    Connection = dmConexao.conexaoDB
    AutoCalcFields = False
    SQL.Strings = (
      'select '
      'produtoId, '
      'nome,'
      'descricao,'
      'valor,'
      'quantidade'
      'from produtos'
      'order by nome')
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
      DisplayFormat = '#0.00'
    end
    object qryProdutosquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '#0.00'
    end
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 600
    Top = 192
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 603
    Top = 272
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 611
    Top = 344
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 483
    Top = 328
  end
end
