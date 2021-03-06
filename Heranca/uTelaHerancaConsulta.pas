unit uTelaHerancaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons;

type
  TfrmTelaHerancaConsulta = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    mskPesquisa: TMaskEdit;
    lblIndice: TLabel;
    grdPesquisa: TDBGrid;
    qryListagem: TZQuery;
    dsListagem: TDataSource;
    btnFechar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure grdPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdPesquisaTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure grdPesquisaDblClick(Sender: TObject);
    procedure mskPesquisaChange(Sender: TObject);
  private
    function RetornarCampoTraduzido(Campo: String): String;
    procedure ExibirLabelIndice(Campo: String; aLabel: TLabel);
    { Private declarations }
  public
    { Public declarations }
    aRetornarIdSelecionado: Variant;
    aIniciarPesquisaId: Variant;
    aCampoId: String;
    IndiceAtual: String;
  end;

var
  frmTelaHerancaConsulta: TfrmTelaHerancaConsulta;

implementation

{$R *.dfm}

procedure TfrmTelaHerancaConsulta.btnFecharClick(Sender: TObject);
begin
   close;
end;

procedure TfrmTelaHerancaConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if qryListagem.Active then
      qryListagem.Close;
end;

procedure TfrmTelaHerancaConsulta.FormCreate(Sender: TObject);
begin
   if qryListagem.Active then
      qryListagem.Close;
      ExibirLabelIndice(IndiceAtual, lblIndice);
      qryListagem.Open;
end;

procedure TfrmTelaHerancaConsulta.FormShow(Sender: TObject);
begin
   if aIniciarPesquisaId<>Unassigned then
   begin
      qryListagem.Locate(aCampoId, aIniciarPesquisaId, [loPartialKey])
   end;
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaDblClick(Sender: TObject);
begin
   aRetornarIdSelecionado:= qryListagem.FieldByName(aCampoId).AsVariant;
   close;
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     //Bloqueia o CTRL + DEL
  if (Shift = [ssCtrl]) and (Key = 46) then
      key := 0;
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaTitleClick(Column: TColumn);
begin
   IndiceAtual := Column.FieldName;
   qryListagem.IndexFieldNames:=IndiceAtual;
   ExibirLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmTelaHerancaConsulta.mskPesquisaChange(Sender: TObject);
begin
   qryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text,[loPartialKey]);
end;

procedure TfrmTelaHerancaConsulta.ExibirLabelIndice(Campo: String; aLabel:TLabel);
begin
   aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

function TfrmTelaHerancaConsulta.RetornarCampoTraduzido(Campo: String):String;
var
   i: integer;
begin
   for i := 0 to qryListagem.FieldCount -1 do
   begin
      if LowerCase(qryListagem.Fields[i].FieldName) = LowerCase(Campo) then
      begin
         Result:= qryListagem.Fields[i].DisplayLabel;
         break;
      end;
   end;
end;

end.
