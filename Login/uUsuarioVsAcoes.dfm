object frmUsuarioVsAcoes: TfrmUsuarioVsAcoes
  Left = 0
  Top = 0
  Caption = 'Usu'#225'rio Vs A'#231#245'es'
  ClientHeight = 482
  ClientWidth = 849
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 249
    Top = 0
    Height = 434
    ExplicitLeft = 232
    ExplicitTop = 136
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 434
    Align = alLeft
    TabOrder = 0
    object grdUsuarios: TDBGrid
      Left = 1
      Top = 1
      Width = 247
      Height = 432
      Align = alClient
      DataSource = dtsUsuario
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'usuarioId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Width = 178
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 252
    Top = 0
    Width = 597
    Height = 434
    Align = alClient
    TabOrder = 1
    object grdAcoes: TDBGrid
      Left = 1
      Top = 1
      Width = 595
      Height = 432
      Align = alClient
      DataSource = dtsUsuariosAcaoAcess
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = grdAcoesDrawColumnCell
      OnDblClick = grdAcoesDblClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 434
    Width = 849
    Height = 48
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      849
      48)
    object btnFechar: TBitBtn
      Left = 763
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Fechar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF244E6E
        0A6B9BA6B2F19FA4DAA29CBFAD9BAAB69E9EB69E9EB69F9FB69F9FB69F9FB69F
        9F3C9DBE244E6EFF00FFFF00FF244E6E0A6B9B95AAFC8199FC6F8BFC5D7DFC56
        72F06272D47A79B899879CAB9090AB90903FA0BF244E6EFF00FFFF00FF244E6E
        0A6B9B849CFC728DFC607FFC4E71FC3C62FC2A54FC1745FC0A3AFAA08181A081
        8142A3C1244E6EFF00FFFF00FF244E6E0D6E9D7490FC6282FC5074FC3E64FC2C
        56FC1A48FC0A3BFC0A34F095727295727245A6C2244E6EFF00FFFF00FF244E6E
        10719F6684FC5475FC4267FC3059FC1E4AFC0C3CFC0A36F20A2FE58963638963
        6348A9C4244E6EFF00FFFF00FF244E6E1374A15778FC4569FC335BFC214DFC0F
        3EFC0A37F40A2FE60A2ADA7E54547E54544BACC6244E6EFF00FFFF00FF244E6E
        1575A3486CFC365EFC244FFC1240FC0A37F50A31E80A2ADC0A24D07446467446
        464EAEC8244E6EFF00FFFF00FF244E6E1778A53960FC2751FC1543FC0A38F70A
        32EA0A2BDE0A7ED80AA0E16A3C3C6B3B3B50B1CA244E6EFF00FFFF00FF244E6E
        1A7BA72A54FC1744FC0A39F90A33ED0A2CE00A27D30B91EA4DC9F3693D3E6B3B
        3B53B4CC244E6EFF00FFFF00FF244E6E1D7EA91947FC0A3AFB0A34EF0A2DE30A
        28D50A21C90A1BBD0A15B06B3B3B6B3B3B56B7CE244E6EFF00FFFF00FF244E6E
        2081AB0A3BFC0A35F10A2EE40A29D80A22CB0A1CBF0A16B20A0EA56B3B3B6B3B
        3B59BAD0244E6EFF00FFFF00FF244E6E2384AC0A36F30A2FE60A2ADA0A23CE0A
        1DC00A15B10A0FA40A0A9B6B3B3B6B3B3B5CBDD1244E6EFF00FFFF00FF244E6E
        2687AE0A31E80A2ADC0A24D00A1BBE0A13AD0A0EA30A0A9C0A0A9B6B3B3B6B3B
        3B5EBFD3244E6EFF00FFFF00FF244E6E2989B00A2BDE0A21C90A17B40A11AA0A
        0EA20A0B9C0A0A9B0A0A9B6B3B3B6B3B3B61C1D5244E6EFF00FFFF00FF244E6E
        2B8CB23192B53697B93C9CBC3FA0BF45A6C24AABC64FB0C954B5CD59BAD15FBF
        D363C4D7244E6EFF00FFFF00FF244E6E244E6E244E6E244E6E244E6E244E6E24
        4E6E244E6E244E6E244E6E244E6E244E6E244E6E244E6EFF00FF}
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object qryUsuario: TZQuery
    Connection = dmConexao.conexaoDB
    AfterScroll = qryUsuarioAfterScroll
    CachedUpdates = True
    Active = True
    SQL.Strings = (
      'Select usuarioId,'
      '           nome'
      'from usuarios')
    Params = <>
    Left = 132
    Top = 80
    object qryUsuariousuarioId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'usuarioId'
      ReadOnly = True
    end
    object qryUsuarionome: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'nome'
      Required = True
      Size = 50
    end
  end
  object qryUsuariosAcaoAcess: TZQuery
    Connection = dmConexao.conexaoDB
    Active = True
    SQL.Strings = (
      'Select ua.usuarioId,'
      '           ua.acaoAcessoId,'
      '           a.descricao,'
      '          ua.ativo'
      'from usuariosAcaoAcesso as ua'
      'Inner Join acaoAcesso As a On a.acaoAcessoId  =  ua.acaoAcessoId'
      'Where  ua.usuarioId=:usuarioId')
    Params = <
      item
        DataType = ftWideString
        Name = 'usuarioId'
        ParamType = ptUnknown
        Value = '1'
      end>
    Left = 372
    Top = 104
    ParamData = <
      item
        DataType = ftWideString
        Name = 'usuarioId'
        ParamType = ptUnknown
        Value = '1'
      end>
    object qryUsuariosAcaoAcessdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 100
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryUsuariosAcaoAcessusuarioId: TIntegerField
      FieldName = 'usuarioId'
      Required = True
      Visible = False
    end
    object qryUsuariosAcaoAcessacaoAcessoId: TIntegerField
      FieldName = 'acaoAcessoId'
      Required = True
      Visible = False
    end
    object qryUsuariosAcaoAcessativo: TBooleanField
      FieldName = 'ativo'
      Required = True
      Visible = False
    end
  end
  object dtsUsuario: TDataSource
    DataSet = qryUsuario
    Left = 128
    Top = 160
  end
  object dtsUsuariosAcaoAcess: TDataSource
    DataSet = qryUsuariosAcaoAcess
    Left = 396
    Top = 160
  end
end
