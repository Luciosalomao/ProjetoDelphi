inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de categorias'
  ClientHeight = 363
  ClientWidth = 642
  ExplicitWidth = 648
  ExplicitHeight = 392
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 642
    Height = 322
    ActivePage = TabManutencao
    ExplicitWidth = 642
    ExplicitHeight = 322
    inherited TabListagem: TTabSheet
      ExplicitWidth = 634
      ExplicitHeight = 294
      inherited pnlListagemTopo: TPanel
        Width = 634
        ExplicitWidth = 634
      end
      inherited grdListagem: TDBGrid
        Width = 634
        Height = 237
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitWidth = 634
      ExplicitHeight = 294
      object edtCategoriaId: TLabeledEdit
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
        Width = 403
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 322
    Width = 642
    ExplicitTop = 322
    ExplicitWidth = 642
    inherited btnFechar: TBitBtn
      Left = 562
      ExplicitLeft = 562
    end
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'Select categoriaId, descricao, status from categorias')
    Left = 420
    object qryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object qryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryListagemstatus: TBooleanField
      DisplayLabel = 'Status'
      FieldName = 'status'
    end
  end
  inherited dsListagem: TDataSource
    Left = 476
  end
end
