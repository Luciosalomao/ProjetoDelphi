inherited frmConCliente: TfrmConCliente
  Caption = 'Consulta de Cliente'
  ExplicitWidth = 697
  ExplicitHeight = 414
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    ExplicitWidth = 691
    inherited mskPesquisa: TMaskEdit
      ExplicitTop = 24
      ExplicitWidth = 689
    end
  end
  inherited Panel2: TPanel
    ExplicitLeft = 0
    ExplicitTop = 49
    ExplicitWidth = 691
    ExplicitHeight = 295
  end
  inherited Panel3: TPanel
    inherited btnFechar: TBitBtn
      ExplicitLeft = 612
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      
        'select clienteId, nome, endereco, cidade, bairro, cep, telefone,' +
        ' email, datadenascimento from clientes'
      '')
    object qryListagemclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      DisplayWidth = 11
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 48
      FieldName = 'nome'
      Size = 60
    end
    object qryListagemendereco: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 60
      FieldName = 'endereco'
      Size = 60
    end
    object qryListagemcidade: TWideStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 50
      FieldName = 'cidade'
      Size = 50
    end
    object qryListagembairro: TWideStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 40
      FieldName = 'bairro'
      Size = 40
    end
    object qryListagemcep: TWideStringField
      DisplayLabel = 'CEP'
      DisplayWidth = 10
      FieldName = 'cep'
      Size = 10
    end
    object qryListagemtelefone: TWideStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'telefone'
      Size = 14
    end
    object qryListagememail: TWideStringField
      DisplayLabel = 'E-mail'
      DisplayWidth = 100
      FieldName = 'email'
      Size = 100
    end
    object qryListagemdatadenascimento: TDateTimeField
      DisplayLabel = 'Data de Nascimento'
      DisplayWidth = 18
      FieldName = 'datadenascimento'
    end
  end
end
