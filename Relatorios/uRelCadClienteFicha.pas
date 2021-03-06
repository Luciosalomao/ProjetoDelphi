unit uRelCadClienteFicha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLPDFFilter, RLXLSXFilter, RLFilters,
  RLXLSFilter, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RLReport,
  Vcl.Imaging.pngimage;

type
  TfrmRelCadClienteFicha = class(TForm)
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
    RLDBText4: TRLDBText;
    qryClientes: TZQuery;
    dtsClientes: TDataSource;
    RLXLSFilter1: TRLXLSFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    RLPDFFilter1: TRLPDFFilter;
    qryClientesclienteId: TIntegerField;
    qryClientesnome: TWideStringField;
    qryClientesendereco: TWideStringField;
    qryClientescidade: TWideStringField;
    qryClientesbairro: TWideStringField;
    qryClientescep: TWideStringField;
    qryClientestelefone: TWideStringField;
    qryClientesemail: TWideStringField;
    qryClientesdataDeNascimento: TDateTimeField;
    RLLabel4: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDraw3: TRLDraw;
    RLImage1: TRLImage;
    RLAngleLabel1: TRLAngleLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadClienteFicha: TfrmRelCadClienteFicha;

implementation

{$R *.dfm}

procedure TfrmRelCadClienteFicha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryClientes.Close;
end;

procedure TfrmRelCadClienteFicha.FormCreate(Sender: TObject);
begin
  qryClientes.Open;
end;

end.
