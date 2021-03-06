unit uDtmVendas;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDM, Datasnap.DBClient;

type
  TdtmVendas = class(TDataModule)
    qryCliente: TZQuery;
    qryClienteclienteId: TIntegerField;
    qryClientenome: TWideStringField;
    qryProdutos: TZQuery;
    qryProdutosprodutoId: TIntegerField;
    qryProdutosnome: TWideStringField;
    qryProdutosvalor: TFloatField;
    qryProdutosquantidade: TFloatField;
    dtsCliente: TDataSource;
    dtsProdutos: TDataSource;
    cdsItensVenda: TClientDataSet;
    dtsItensVenda: TDataSource;
    cdsItensVendaprodutoId: TIntegerField;
    cdsItensVendaNomeProduto: TStringField;
    cdsItensVendaQuantidade: TFloatField;
    cdsItensVendaValorUnitario: TFloatField;
    cdsItensVendaValorTotalProduto: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVendas: TdtmVendas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmVendas.DataModuleCreate(Sender: TObject);
begin
    cdsItensVenda.CreateDataSet;
    qryCliente.Open;
    qryProdutos.Open;
end;

procedure TdtmVendas.DataModuleDestroy(Sender: TObject);
begin
    cdsItensVenda.close;
    qryCliente.close;
    qryProdutos.close;
end;

end.
