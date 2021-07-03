object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 377
  Width = 561
  object conexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    Connected = True
    SQLHourGlass = True
    HostName = 'localhost\SQL2017EL'
    Port = 1433
    Database = 'vendas'
    User = 'sa'
    Password = 'cidadao'
    Protocol = 'mssql'
    LibraryLocation = 'C:\ProjetoDelphi\ntwdblib.dll'
    Left = 488
    Top = 56
  end
end
