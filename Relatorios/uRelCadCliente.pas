unit uRelCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RLReport, RLPDFFilter, RLXLSFilter, RLFilters,
  RLXLSXFilter;

type
  TfrmRelCadCliente = class(TForm)
    Relatorio: TRLReport;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
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
    qryClientes: TZQuery;
    dtsClientes: TDataSource;
    qryClientesclienteId: TIntegerField;
    qryClientesnome: TWideStringField;
    qryClientesemail: TWideStringField;
    qryClientestelefone: TWideStringField;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLXLSXFilter1: TRLXLSXFilter;
    RLXLSFilter1: TRLXLSFilter;
    RLPDFFilter1: TRLPDFFilter;
    RLDraw1: TRLDraw;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadCliente: TfrmRelCadCliente;

implementation

{$R *.dfm}

procedure TfrmRelCadCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryClientes.Close;
end;

procedure TfrmRelCadCliente.FormCreate(Sender: TObject);
begin
  qryClientes.Open;
end;

end.
