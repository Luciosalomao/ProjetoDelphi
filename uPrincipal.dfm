object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 539
  ClientWidth = 828
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object stbPrincipal: TStatusBar
    Left = 0
    Top = 520
    Width = 828
    Height = 19
    Panels = <
      item
        Width = 150
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 828
    Height = 33
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 114
      Height = 25
      Caption = 'Dashboard'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label1Click
    end
  end
  object pnGraficos: TPanel
    Left = 0
    Top = 33
    Width = 828
    Height = 487
    Align = alClient
    TabOrder = 2
    ExplicitTop = 27
    object Splitter1: TSplitter
      Left = 409
      Top = 1
      Height = 485
      ExplicitLeft = 560
      ExplicitTop = 88
      ExplicitHeight = 100
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 408
      Height = 485
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = -1
      ExplicitTop = 2
      object Splitter2: TSplitter
        Left = 1
        Top = 249
        Width = 406
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitTop = 201
        ExplicitWidth = 283
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 406
        Height = 248
        Align = alTop
        TabOrder = 0
        object DBChart1: TDBChart
          Left = 1
          Top = 1
          Width = 404
          Height = 246
          Title.Text.Strings = (
            'Produtos em Estoque')
          Align = alClient
          TabOrder = 0
          ExplicitTop = 4
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series1: TBarSeries
            Marks.Brush.Gradient.Colors = <
              item
                Color = clRed
              end
              item
                Color = 819443
                Offset = 0.067915690866510540
              end
              item
                Color = clYellow
                Offset = 1.000000000000000000
              end>
            Marks.Brush.Gradient.Direction = gdTopBottom
            Marks.Brush.Gradient.EndColor = clYellow
            Marks.Brush.Gradient.MidColor = 819443
            Marks.Brush.Gradient.StartColor = clRed
            Marks.Brush.Gradient.Visible = True
            Marks.Font.Color = 159
            Marks.Font.Name = 'Tahoma'
            Marks.Font.Style = [fsBold, fsItalic]
            Marks.Frame.Color = 33023
            Marks.RoundSize = 14
            Marks.Visible = False
            DataSource = dtmGrafico.qryProdutoEstoque
            Title = 'ProdutoEstoque'
            XLabelsSource = 'Label'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            YValues.ValueSource = 'Value'
          end
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 252
        Width = 406
        Height = 232
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 176
        ExplicitTop = 312
        ExplicitWidth = 185
        ExplicitHeight = 41
        object DBChart4: TDBChart
          Left = 1
          Top = 1
          Width = 404
          Height = 230
          Title.Text.Strings = (
            'Vendas da '#218'ltima Semana')
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = -2
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series3: TFastLineSeries
            DataSource = dtmGrafico.qryVendasUltimaSemana
            Title = 'Vendas da '#218'ltima Semana'
            XLabelsSource = 'Label'
            LinePen.Color = 10708548
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'Value'
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 412
      Top = 1
      Width = 415
      Height = 485
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 415
      ExplicitTop = -4
      object Splitter3: TSplitter
        Left = 1
        Top = 249
        Width = 413
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitTop = 201
        ExplicitWidth = 283
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 413
        Height = 248
        Align = alTop
        TabOrder = 0
        object DBChart2: TDBChart
          Left = 1
          Top = 1
          Width = 411
          Height = 246
          Title.Text.Strings = (
            'Valor de Venda por Cliente na '#218'ltima Semana')
          Legend.TextStyle = ltsLeftPercent
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 5
          ExplicitTop = -8
          ExplicitWidth = 400
          ExplicitHeight = 250
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series2: TPieSeries
            Marks.Brush.Gradient.Colors = <
              item
                Color = clRed
              end
              item
                Color = 819443
                Offset = 0.067915690866510540
              end
              item
                Color = clYellow
                Offset = 1.000000000000000000
              end>
            Marks.Brush.Gradient.Direction = gdTopBottom
            Marks.Brush.Gradient.EndColor = clYellow
            Marks.Brush.Gradient.MidColor = 819443
            Marks.Brush.Gradient.StartColor = clRed
            Marks.Brush.Gradient.Visible = True
            Marks.Font.Color = 159
            Marks.Font.Name = 'Tahoma'
            Marks.Font.Style = [fsBold, fsItalic]
            Marks.Frame.Color = 33023
            Marks.RoundSize = 14
            Marks.Visible = False
            Marks.Style = smsLabelPercentTotal
            Marks.Callout.Length = 20
            DataSource = dtmGrafico.qryVendaValorPorCliente
            Title = 'Valor de Venda por Cliente na '#218'ltima Semana'
            XLabelsSource = 'Label'
            XValues.Order = loAscending
            YValues.Name = 'Pie'
            YValues.Order = loNone
            YValues.ValueSource = 'Value'
            Frame.InnerBrush.BackColor = clRed
            Frame.InnerBrush.Gradient.EndColor = clGray
            Frame.InnerBrush.Gradient.MidColor = clWhite
            Frame.InnerBrush.Gradient.StartColor = 4210752
            Frame.InnerBrush.Gradient.Visible = True
            Frame.MiddleBrush.BackColor = clYellow
            Frame.MiddleBrush.Gradient.EndColor = 8553090
            Frame.MiddleBrush.Gradient.MidColor = clWhite
            Frame.MiddleBrush.Gradient.StartColor = clGray
            Frame.MiddleBrush.Gradient.Visible = True
            Frame.OuterBrush.BackColor = clGreen
            Frame.OuterBrush.Gradient.EndColor = 4210752
            Frame.OuterBrush.Gradient.MidColor = clWhite
            Frame.OuterBrush.Gradient.StartColor = clSilver
            Frame.OuterBrush.Gradient.Visible = True
            Frame.Width = 4
            OtherSlice.Legend.Visible = False
          end
        end
      end
      object Panel7: TPanel
        Left = 1
        Top = 252
        Width = 413
        Height = 232
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 280
        ExplicitTop = 328
        ExplicitWidth = 185
        ExplicitHeight = 41
        object DBChart3: TDBChart
          Left = 1
          Top = 1
          Width = 411
          Height = 230
          Title.Text.Strings = (
            'Os 10 Produtos Mais Vendidos na '#218'ltima Semana')
          Legend.TextStyle = ltsLeftPercent
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 2
          ExplicitTop = 2
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object PieSeries1: TPieSeries
            Marks.Brush.Gradient.Colors = <
              item
                Color = clRed
              end
              item
                Color = 819443
                Offset = 0.067915690866510540
              end
              item
                Color = clYellow
                Offset = 1.000000000000000000
              end>
            Marks.Brush.Gradient.Direction = gdTopBottom
            Marks.Brush.Gradient.EndColor = clYellow
            Marks.Brush.Gradient.MidColor = 819443
            Marks.Brush.Gradient.StartColor = clRed
            Marks.Brush.Gradient.Visible = True
            Marks.Font.Color = 159
            Marks.Font.Name = 'Tahoma'
            Marks.Font.Style = [fsBold, fsItalic]
            Marks.Frame.Color = 33023
            Marks.RoundSize = 14
            Marks.Visible = False
            Marks.Style = smsLabelPercentTotal
            Marks.Callout.Length = 20
            DataSource = dtmGrafico.qryVendasMaiores
            Title = 'Os 10 Produtos Mais Vendidos na '#218'ltima Semana'
            XLabelsSource = 'Label'
            XValues.Order = loAscending
            YValues.Name = 'Pie'
            YValues.Order = loNone
            YValues.ValueSource = 'Value'
            Frame.InnerBrush.BackColor = clRed
            Frame.InnerBrush.Gradient.EndColor = clGray
            Frame.InnerBrush.Gradient.MidColor = clWhite
            Frame.InnerBrush.Gradient.StartColor = 4210752
            Frame.InnerBrush.Gradient.Visible = True
            Frame.MiddleBrush.BackColor = clYellow
            Frame.MiddleBrush.Gradient.EndColor = 8553090
            Frame.MiddleBrush.Gradient.MidColor = clWhite
            Frame.MiddleBrush.Gradient.StartColor = clGray
            Frame.MiddleBrush.Gradient.Visible = True
            Frame.OuterBrush.BackColor = clGreen
            Frame.OuterBrush.Gradient.EndColor = 4210752
            Frame.OuterBrush.Gradient.MidColor = clWhite
            Frame.OuterBrush.Gradient.StartColor = clSilver
            Frame.OuterBrush.Gradient.Visible = True
            Frame.Width = 4
            OtherSlice.Legend.Visible = False
          end
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 432
    Top = 40
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        ShortCut = 16451
        OnClick = Cliente1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Categoria1: TMenuItem
        Caption = 'Categoria'
        ShortCut = 16468
        OnClick = Categoria1Click
      end
      object Produto1: TMenuItem
        Caption = 'Produto'
        ShortCut = 16464
        OnClick = Produto1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Usurio1: TMenuItem
        Caption = 'Usu'#225'rio'
        ShortCut = 16469
        OnClick = Usurio1Click
      end
      object AoAcesso1: TMenuItem
        Caption = 'A'#231#227'o Acesso'
        ShortCut = 16449
        OnClick = AoAcesso1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object UsuriosVsAes1: TMenuItem
        Caption = 'Usu'#225'rios Vs A'#231#245'es'
        OnClick = UsuriosVsAes1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object AlterarSenha1: TMenuItem
        Caption = 'Alterar Senha'
        OnClick = AlterarSenha1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuFechar: TMenuItem
        Caption = 'Fechar'
        OnClick = mnuFecharClick
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Venda1: TMenuItem
        Caption = 'Venda'
        ShortCut = 120
        OnClick = Venda1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Categoria2: TMenuItem
        Caption = 'Categoria'
        OnClick = Categoria2Click
      end
      object Cliente2: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente2Click
      end
      object FichadoCliente1: TMenuItem
        Caption = 'Ficha do Cliente'
        OnClick = FichadoCliente1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Produto2: TMenuItem
        Caption = 'Produto'
        OnClick = Produto2Click
      end
      object ProdutoporCategoria1: TMenuItem
        Caption = 'Produto por Categoria'
        OnClick = ProdutoporCategoria1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Vendapordata1: TMenuItem
        Caption = 'Venda por data'
        OnClick = Vendapordata1Click
      end
    end
  end
end
