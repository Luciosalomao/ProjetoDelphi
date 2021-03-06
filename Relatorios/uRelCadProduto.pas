unit uRelCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, RLXLSXFilter,
  RLXLSFilter, RLFilters, RLPDFFilter, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TfrmRelCadProduto = class(TForm)
    Relatorio: TRLReport;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    Rodape: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand2: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel6: TRLLabel;
    RLLabel5: TRLLabel;
    qryProdutos: TZQuery;
    dtsProdutos: TDataSource;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    qryProdutosprodutoId: TIntegerField;
    qryProdutosnome: TWideStringField;
    qryProdutosdescricao: TWideStringField;
    qryProdutosvalor: TFloatField;
    qryProdutosquantidade: TFloatField;
    RLLabel4: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadProduto: TfrmRelCadProduto;

implementation

{$R *.dfm}

procedure TfrmRelCadProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryProdutos.Close;
end;

procedure TfrmRelCadProduto.FormCreate(Sender: TObject);
begin
   qryProdutos.Open;
end;

end.
