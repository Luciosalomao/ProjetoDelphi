unit uDM;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection;

type
  TdmConexao = class(TDataModule)
    conexaoDB: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
