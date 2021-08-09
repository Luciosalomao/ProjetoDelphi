unit udtmGrafico;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TdtmGrafico = class(TDataModule)
    dstProdutoEstoque: TDataSource;
    qryProdutoEstoque: TZQuery;
    qryProdutoEstoqueLabel: TWideStringField;
    qryProdutoEstoqueValue: TFloatField;
    qryVendaValorPorCliente: TZQuery;
    qryVendaValorPorClienteLabel: TWideStringField;
    qryVendaValorPorClienteValue: TFloatField;
    qryVendasMaiores: TZQuery;
    qryVendasMaioresLabel: TWideStringField;
    qryVendasMaioresValue: TFloatField;
    qryVendasUltimaSemana: TZQuery;
    qryVendasUltimaSemanaLabel: TDateTimeField;
    qryVendasUltimaSemanaValue: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmGrafico: TdtmGrafico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
