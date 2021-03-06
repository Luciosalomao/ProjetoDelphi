object frmRelCadCliente: TfrmRelCadCliente
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Cadastro de Clientes'
  ClientHeight = 584
  ClientWidth = 846
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
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      AutoExpand = False
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 1
        Top = 10
        Width = 217
        Height = 24
        Caption = 'Listagem de Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 36
        Width = 718
        Height = 7
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 131
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
        Left = 1
        Top = 8
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 352
        Top = 8
        Width = 30
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 396
        Top = 8
        Width = 37
        Height = 16
        AutoSize = False
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 382
        Top = 8
        Width = 14
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = '/'
      end
      object RLLabel3: TRLLabel
        Left = 303
        Top = 8
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
      Top = 105
      Width = 718
      Height = 26
      AutoExpand = False
      object RLDBText1: TRLDBText
        Left = 3
        Top = 6
        Width = 52
        Height = 16
        DataField = 'clienteId'
        DataSource = dtsClientes
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 79
        Top = 4
        Width = 36
        Height = 16
        DataField = 'nome'
        DataSource = dtsClientes
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 303
        Top = 4
        Width = 35
        Height = 16
        DataField = 'email'
        DataSource = dtsClientes
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 669
        Top = 7
        Width = 49
        Height = 16
        Align = faRightOnly
        Alignment = taRightJustify
        DataField = 'telefone'
        DataSource = dtsClientes
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 24
      AutoExpand = False
      BandType = btColumnHeader
      object RLPanel1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 24
        Align = faClient
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object RLLabel8: TRLLabel
          Left = 303
          Top = 5
          Width = 44
          Height = 16
          Caption = 'E-mail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLLabel6: TRLLabel
        Left = 79
        Top = 5
        Width = 41
        Height = 16
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 1
        Top = 5
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
      object RLLabel7: TRLLabel
        Left = 658
        Top = 5
        Width = 60
        Height = 16
        Align = faRightOnly
        Alignment = taRightJustify
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object qryClientes: TZQuery
    Connection = dmConexao.conexaoDB
    SQL.Strings = (
      
        'select clientes.clienteId, clientes.nome, clientes.email, client' +
        'es.telefone'
      'from clientes order by  clientes.nome')
    Params = <>
    Left = 672
    Top = 224
    object qryClientesclienteId: TIntegerField
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object qryClientesnome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryClientesemail: TWideStringField
      FieldName = 'email'
      Size = 100
    end
    object qryClientestelefone: TWideStringField
      FieldName = 'telefone'
      Size = 14
    end
  end
  object dtsClientes: TDataSource
    DataSet = qryClientes
    Left = 600
    Top = 192
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 664
    Top = 357
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 608
    Top = 309
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 576
    Top = 373
  end
end
