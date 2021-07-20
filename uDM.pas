unit uDM;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdmConexao = class(TDataModule)
    conexaoDB: TZConnection;
    qryScriptCategorias: TZQuery;
    qryScriptProdutos: TZQuery;
    qryScriptVendas: TZQuery;
    qryScriptClientes: TZQuery;
    qryScriptVendasItens: TZQuery;
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
