object frmRelVendaPorData: TfrmRelVendaPorData
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Venda por Data'
  ClientHeight = 572
  ClientWidth = 849
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
        Width = 260
        Height = 24
        Caption = 'Listagem Venda por Data'
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
      Top = 233
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
      Height = 106
      DataFields = 'datavenda'
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
          Width = 37
          Height = 16
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 38
          Top = 6
          Width = 71
          Height = 16
          DataField = 'datavenda'
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
          object RLLabel9: TRLLabel
            Left = 464
            Top = 3
            Width = 103
            Height = 16
            Caption = 'Valor da Venda'
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
      object rlbDetalhesDaVenda: TRLBand
        Left = 0
        Top = 50
        Width = 718
        Height = 25
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
          Left = 76
          Top = 3
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = dtsVenda
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 505
          Top = 3
          Width = 62
          Height = 16
          Alignment = taRightJustify
          DataField = 'totalvenda'
          DataSource = dtsVenda
          DisplayMask = '#0.00'
          Text = ''
        end
      end
      object rlbSumarioVenda: TRLBand
        Left = 0
        Top = 75
        Width = 718
        Height = 26
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 455
          Top = 7
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
        object RLLabel6: TRLLabel
          Left = 326
          Top = 6
          Width = 163
          Height = 16
          Alignment = taRightJustify
          Caption = 'Total da Venda por Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw3: TRLDraw
          Left = 312
          Top = 0
          Width = 406
          Height = 7
          DrawKind = dkLine
        end
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 203
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
        Left = 372
        Top = 8
        Width = 117
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total das Vendas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw4: TRLDraw
        Left = 312
        Top = 2
        Width = 406
        Height = 7
        DrawKind = dkLine
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
      'WHERE vendas.datavenda BETWEEN :DataInicio AND :DataFinal'
      'ORDER BY vendas.datavenda, vendas.clienteId'
      '')
    Params = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptInput
        Value = 44378d
      end
      item
        DataType = ftDate
        Name = 'DataFinal'
        ParamType = ptInput
        Value = 44407d
      end>
    Left = 656
    Top = 40
    ParamData = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptInput
        Value = 44378d
      end
      item
        DataType = ftDate
        Name = 'DataFinal'
        ParamType = ptInput
        Value = 44407d
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
  object dtsVenda: TDataSource
    DataSet = qryVenda
    Left = 664
    Top = 248
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
end
