unit uRelVendaPorData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLXLSXFilter, RLXLSFilter,
  RLFilters, RLPDFFilter, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TfrmRelVendaPorData = class(TForm)
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
    BandaDeGrupo: TRLGroup;
    rlbCabecalhoVenda: TRLBand;
    RLLabel4: TRLLabel;
    RLDBText2: TRLDBText;
    rlbCabecalhoColunasVenda: TRLBand;
    RLPanel2: TRLPanel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    rlbDetalhesDaVenda: TRLBand;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText8: TRLDBText;
    rlbSumarioVenda: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel6: TRLLabel;
    RLDraw3: TRLDraw;
    qryVenda: TZQuery;
    dtsVenda: TDataSource;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    qryVendavendaId: TIntegerField;
    qryVendaclienteId: TIntegerField;
    qryVendanome: TWideStringField;
    qryVendadatavenda: TDateTimeField;
    qryVendatotalvenda: TFloatField;
    RLBand1: TRLBand;
    RLDBResult2: TRLDBResult;
    RLLabel5: TRLLabel;
    RLDraw4: TRLDraw;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendaPorData: TfrmRelVendaPorData;

implementation

{$R *.dfm}

procedure TfrmRelVendaPorData.FormDestroy(Sender: TObject);
begin
    qryVenda.Close;
end;

end.
