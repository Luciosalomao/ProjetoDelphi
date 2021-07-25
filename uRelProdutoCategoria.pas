unit uRelProdutoCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLXLSXFilter, RLXLSFilter, RLFilters,
  RLPDFFilter, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RLReport;

type
  TfrmRelProdutoCategoria = class(TForm)
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
    qryProdutoscategoriaId: TIntegerField;
    qryProdutosDescricaoCategoria: TWideStringField;
    BandaDeGrupo: TRLGroup;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLPanel2: TRLPanel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLBand5: TRLBand;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand1: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel6: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLDraw3: TRLDraw;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutoCategoria: TfrmRelProdutoCategoria;

implementation

{$R *.dfm}

procedure TfrmRelProdutoCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryProdutos.Close;
end;

procedure TfrmRelProdutoCategoria.FormCreate(Sender: TObject);
begin
   qryProdutos.Open;
end;

end.
