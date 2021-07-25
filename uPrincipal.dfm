object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 449
  ClientWidth = 762
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
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 648
    Top = 144
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Categoria1: TMenuItem
        Caption = 'Categoria'
        OnClick = Categoria1Click
      end
      object Produto1: TMenuItem
        Caption = 'Produto'
        OnClick = Produto1Click
      end
      object N2: TMenuItem
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
