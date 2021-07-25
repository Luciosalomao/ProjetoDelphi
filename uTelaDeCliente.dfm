inherited frmTelaDeCliente: TfrmTelaDeCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 447
  ClientWidth = 846
  ExplicitWidth = 852
  ExplicitHeight = 476
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 846
    Height = 406
    ActivePage = TabManutencao
    ExplicitWidth = 846
    ExplicitHeight = 406
    inherited TabListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 838
      ExplicitHeight = 378
      inherited pnlListagemTopo: TPanel
        Width = 838
        ExplicitWidth = 838
        inherited mskPesquisar: TMaskEdit
          Left = 7
          Top = 26
          ExplicitLeft = 7
          ExplicitTop = 26
        end
      end
      inherited grdListagem: TDBGrid
        Width = 838
        Height = 321
        Columns = <
          item
            Expanded = False
            FieldName = 'clienteId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cep'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 838
      ExplicitHeight = 378
      object lblCep: TLabel
        Left = 628
        Top = 77
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object ldlTelefone: TLabel
        Left = 628
        Top = 173
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object lblDataDeNascimento: TLabel
        Left = 3
        Top = 272
        Width = 95
        Height = 13
        Caption = 'Data de nascimento'
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 96
        Width = 606
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
      end
      object edtClienteId: TLabeledEdit
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
      object edtCep: TMaskEdit
        Left = 628
        Top = 96
        Width = 198
        Height = 21
        EditMask = '99.999-999;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  .   -   '
      end
      object edtEndereco: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 144
        Width = 606
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 60
        TabOrder = 3
      end
      object edtBairro: TLabeledEdit
        Tag = 2
        Left = 628
        Top = 144
        Width = 198
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Bairro'
        MaxLength = 40
        TabOrder = 4
      end
      object edtCidade: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 192
        Width = 606
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade'
        MaxLength = 50
        TabOrder = 5
      end
      object edtTelefone: TMaskEdit
        Left = 628
        Top = 192
        Width = 196
        Height = 21
        EditMask = '!\(99\)00000-0000;1;_'
        MaxLength = 14
        TabOrder = 6
        Text = '(  )     -    '
      end
      object edtEmail: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 245
        Width = 823
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'E-mail'
        MaxLength = 100
        TabOrder = 7
      end
      object edtDataDeNascimento: TDateEdit
        Left = 3
        Top = 291
        Width = 121
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 8
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 406
    Width = 846
    ExplicitTop = 406
    ExplicitWidth = 846
    inherited btnFechar: TBitBtn
      Left = 766
      ExplicitLeft = 766
    end
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    Active = True
    SQL.Strings = (
      
        'select clienteId, nome, endereco, cidade, bairro, cep, telefone,' +
        ' email, datadenascimento from clientes')
    object qryListagemclienteId: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object qryListagemendereco: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Size = 60
    end
    object qryListagemcidade: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 50
    end
    object qryListagembairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 40
    end
    object qryListagemcep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 10
    end
    object qryListagemtelefone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 14
    end
    object qryListagememail: TWideStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 100
    end
    object qryListagemdatadenascimento: TDateTimeField
      DisplayLabel = 'Data de nascimento'
      FieldName = 'datadenascimento'
    end
  end
end
