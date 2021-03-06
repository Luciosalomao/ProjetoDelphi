unit uRelProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, RLXLSXFilter,
  RLXLSFilter, RLFilters, RLPDFFilter, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TfrmRelProVenda = class(TForm)
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
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    rlbDetalhesDaVenda: TRLBand;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    rlbSumarioVendas: TRLBand;
    RLDBResult2: TRLDBResult;
    RLLabel5: TRLLabel;
    RLDraw4: TRLDraw;
    qryVenda: TZQuery;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    dtsVenda: TDataSource;
    qryVendasItens: TZQuery;
    dtsVendasItens: TDataSource;
    RLLabel8: TRLLabel;
    RLDBText7: TRLDBText;
    qryVendavendaId: TIntegerField;
    qryVendaclienteId: TIntegerField;
    qryVendanome: TWideStringField;
    qryVendadatavenda: TDateTimeField;
    qryVendatotalvenda: TFloatField;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLLabel7: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLDBText8: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText9: TRLDBText;
    RLDraw3: TRLDraw;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProVenda: TfrmRelProVenda;

implementation

{$R *.dfm}

procedure TfrmRelProVenda.FormDestroy(Sender: TObject);
begin
    qryVendasItens.Close;
    qryVenda.Close;
end;

end.
