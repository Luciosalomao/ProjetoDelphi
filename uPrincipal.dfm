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
