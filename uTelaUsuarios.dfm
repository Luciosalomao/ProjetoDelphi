inherited frmTelaUsuarios: TfrmTelaUsuarios
  Caption = 'Cadastro de Usu'#225'rio'
  ClientWidth = 636
  ExplicitWidth = 642
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 636
    ActivePage = TabManutencao
    ExplicitWidth = 636
    inherited TabListagem: TTabSheet
      ExplicitWidth = 628
      inherited pnlListagemTopo: TPanel
        Width = 628
        ExplicitWidth = 628
      end
      inherited grdListagem: TDBGrid
        Width = 628
        Columns = <
          item
            Expanded = False
            FieldName = 'usuarioId'
            Width = 146
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 455
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitWidth = 628
      object edtUsuarioId: TLabeledEdit
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
        Width = 606
        Height = 21
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Usu'#225'rio'
        MaxLength = 50
        TabOrder = 1
      end
      object edtSenha: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 152
        Width = 403
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Senha'
        MaxLength = 40
        PasswordChar = '*'
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    Width = 636
    ExplicitWidth = 636
    inherited btnFechar: TBitBtn
      Left = 556
      ExplicitLeft = 556
    end
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'Select usuarioId,'
      '           nome,'
      '           senha'
      'from usuarios')
    Left = 508
    Top = 120
    object qryListagemusuarioId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'usuarioId'
      ReadOnly = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object qryListagemsenha: TWideStringField
      DisplayLabel = 'Senha'
      FieldName = 'senha'
      Required = True
      Size = 40
    end
  end
  inherited dsListagem: TDataSource
    Left = 292
    Top = 96
  end
end
