object frmRelProVenda: TfrmRelProVenda
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Venda'
  ClientHeight = 458
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsVenda
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
        Width = 69
        Height = 24
        Caption = 'Venda'
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
      Top = 297
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
      Height = 82
      DataFields = 'vendaId'
      object rlbCabecalhoVenda: TRLBand
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
          Width = 49
          Height = 16
          Caption = 'Venda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 51
          Top = 6
          Width = 55
          Height = 16
          DataField = 'vendaId'
          DataSource = dtsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
      end
      object rlbCabecalhoColunasVenda: TRLBand
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
            Left = 469
            Top = 3
            Width = 98
            Height = 16
            Caption = 'Data da Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLLabel10: TRLLabel
          Left = 96
          Top = 3
          Width = 110
          Height = 16
          Caption = 'Nome do Cliente'
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
          Width = 82
          Height = 16
          Caption = 'C'#243'd. Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object rlbDetalhesDaVenda: TRLBand
        Left = 0
        Top = 50
        Width = 718
        Height = 26
        AutoExpand = False
        object RLDBText5: TRLDBText
          Left = 3
          Top = 3
          Width = 52
          Height = 16
          DataField = 'clienteId'
          DataSource = dtsVenda
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 96
          Top = 3
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = dtsVenda
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 505
          Top = 3
          Width = 62
          Height = 16
          Alignment = taRightJustify
          DataField = 'datavenda'
          DataSource = dtsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDraw3: TRLDraw
          Left = 0
          Top = 21
          Width = 718
          Height = 5
          Align = faBottom
          DrawKind = dkLine
          Pen.Width = 2
        end
      end
    end
    object rlbSumarioVendas: TRLBand
      Left = 38
      Top = 267
      Width = 718
      Height = 30
      BandType = btSummary
      object RLDBResult2: TRLDBResult
        Left = 455
        Top = 8
        Width = 112
        Height = 16
        Alignment = taRightJustify
        DataField = 'totalvenda'
        DataSource = dtsVenda
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
      object RLLabel5: TRLLabel
        Left = 386
        Top = 8
        Width = 111
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total das Venda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw4: TRLDraw
        Left = 363
        Top = 3
        Width = 355
        Height = 7
        DrawKind = dkLine
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 179
      Width = 718
      Height = 88
      DataSource = dtsVendasItens
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 25
        BandType = btHeader
        object RLLabel7: TRLLabel
          Left = 3
          Top = 3
          Width = 80
          Height = 16
          Caption = 'C'#243'd. Produto'
        end
        object RLLabel9: TRLLabel
          Left = 89
          Top = 3
          Width = 105
          Height = 16
          Caption = 'Nome do Produto'
        end
        object RLLabel12: TRLLabel
          Left = 355
          Top = 3
          Width = 70
          Height = 16
          Caption = 'Quantidade'
        end
        object RLLabel13: TRLLabel
          Left = 431
          Top = 3
          Width = 69
          Height = 16
          Caption = 'Pre'#231'o Unit.'
        end
        object RLLabel14: TRLLabel
          Left = 506
          Top = 3
          Width = 61
          Height = 16
          Caption = 'Total Item'
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 25
        Width = 718
        Height = 24
        object RLDBText8: TRLDBText
          Left = 506
          Top = 3
          Width = 61
          Height = 16
          Alignment = taRightJustify
          DataField = 'totalProduto'
          DataSource = dtsVendasItens
          DisplayMask = '#0.00'
          Text = ''
        end
        object RLDBText1: TRLDBText
          Left = 431
          Top = 3
          Width = 69
          Height = 16
          Alignment = taRightJustify
          DataField = 'valorUnitario'
          DataSource = dtsVendasItens
          DisplayMask = '#0.00'
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 358
          Top = 3
          Width = 67
          Height = 16
          Alignment = taRightJustify
          DataField = 'quantidade'
          DataSource = dtsVendasItens
          DisplayMask = '#0.00'
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 89
          Top = 3
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = dtsVendasItens
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 3
          Top = 3
          Width = 57
          Height = 16
          DataField = 'produtoId'
          DataSource = dtsVendasItens
          Text = ''
        end
      end
    end
  end
  object qryVenda: TZQuery
    Connection = dmConexao.conexaoDB
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT vendas.vendaId, '
      '             vendas.clienteId,'
      '             clientes.nome,'
      '             vendas.datavenda,'
      '             vendas.totalvenda'
      '       FROM vendas'
      'LEFT JOIN clientes ON clientes.clienteId = vendas.clienteId'
      'WHERE vendas.vendaId = :vendaId'
      'ORDER BY vendas.datavenda, vendas.clienteId'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'vendaId'
        ParamType = ptUnknown
        Value = '2'
      end>
    Left = 656
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'vendaId'
        ParamType = ptUnknown
        Value = '2'
      end>
    object qryVendavendaId: TIntegerField
      FieldName = 'vendaId'
      ReadOnly = True
    end
    object qryVendaclienteId: TIntegerField
      FieldName = 'clienteId'
      Required = True
    end
    object qryVendanome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryVendadatavenda: TDateTimeField
      FieldName = 'datavenda'
      Required = True
    end
    object qryVendatotalvenda: TFloatField
      FieldName = 'totalvenda'
      Required = True
    end
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
    Left = 323
    Top = 8
  end
  object dtsVenda: TDataSource
    DataSet = qryVenda
    Left = 704
    Top = 24
  end
  object qryVendasItens: TZQuery
    Connection = dmConexao.conexaoDB
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT vendasItens.vendaId, '
      '             vendasItens.produtoId,'
      '             produtos.nome,'
      '             vendasItens.valorUnitario,'
      '             vendasItens.quantidade,'
      '            vendasItens.totalProduto'
      '       FROM vendasItens'
      
        'LEFT JOIN  produtos ON  produtos.produtoId = vendasItens.produto' +
        'Id'
      'WHERE vendasItens.vendaId = :vendaId'
      'ORDER BY vendasItens.produtoId'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'vendaId'
        ParamType = ptUnknown
        Value = '2'
      end>
    Left = 632
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'vendaId'
        ParamType = ptUnknown
        Value = '2'
      end>
  end
  object dtsVendasItens: TDataSource
    DataSet = qryVendasItens
    Left = 632
    Top = 352
  end
end
