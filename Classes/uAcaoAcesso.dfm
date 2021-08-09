inherited frmCadAcaoAcesso: TfrmCadAcaoAcesso
  Caption = 'Cadastro de A'#231#227'o de Acesso'
  ClientWidth = 809
  ExplicitWidth = 815
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 809
    ActivePage = TabManutencao
    ExplicitWidth = 809
    inherited TabListagem: TTabSheet
      inherited pnlListagemTopo: TPanel
        Width = 801
        ExplicitWidth = 801
      end
      inherited grdListagem: TDBGrid
        Width = 801
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 801
      ExplicitHeight = 369
      object edtAcaoAcessoId: TLabeledEdit
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
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 96
        Width = 710
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 100
        TabOrder = 1
      end
      object edtChave: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 152
        Width = 510
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Chave'
        MaxLength = 60
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    Width = 809
    ExplicitWidth = 809
    inherited btnFechar: TBitBtn
      Left = 729
      ExplicitLeft = 729
    end
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT  acaoAcessoId, descricao, chave FROM acaoAcesso')
    object qryListagemacaoAcessoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'acaoAcessoId'
      ReadOnly = True
    end
    object qryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 71
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryListagemchave: TWideStringField
      DisplayLabel = 'Chave'
      DisplayWidth = 60
      FieldName = 'chave'
      Required = True
      Size = 60
    end
  end
end
