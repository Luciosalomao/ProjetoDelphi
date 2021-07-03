unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,   Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDM, uEnum;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    TabListagem: TTabSheet;
    TabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavegator: TDBNavigator;
    qryListagem: TZQuery;
    dsListagem: TDataSource;
    lblIndice: TLabel;
    mskPesquisar: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
        btnApagar: TBitBtn; btnNavegator: TDBNavigator; pgcPrincipal: TPageControl; Flag:Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; indice: Integer);
    function RetornaCampoTraduzido(Campo: String): String;
    procedure ExibeIndiceLabel(Campo: String; aLabel: TLabel);
    function ExisteCampoObrigatorio: boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdits;
  public
    { Public declarations }
    EstadoDoCadastro: TEstadoDoCadastro;
    indiceAtual: String;
    function Excluir:Boolean; virtual; //m�todo virtual
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean; virtual;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

{$region 'Observa��es'}
//Tag = 1 - Chave prim�ria
//Tab = 2 - Campos obrigat�rios
{$endregion}

{$region 'Procedures e Fun��es'}

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal: TPageControl; indice: Integer);
begin
  if (pgcPrincipal.Pages[indice].TabVisible) then
        pgcPrincipal.TabIndex:=indice;
end;

procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
btnApagar: TBitBtn; btnNavegator: TDBNavigator; pgcPrincipal: TPageControl; Flag:Boolean);
Begin
  btnNovo.Enabled:=Flag;
  btnApagar.Enabled:=Flag;
  btnAlterar.Enabled :=Flag;
  btnNavegator.Enabled:=Flag;
  pgcPrincipal.Pages[0].TabVisible:=Flag;
  btnCancelar.Enabled:=not(Flag);
  btnGravar.Enabled:=not(Flag);
End;

procedure TfrmTelaHeranca.ExibeIndiceLabel(Campo: String; aLabel:TLabel);
Begin
  aLabel.Caption:=RetornaCampoTraduzido(Campo);
End;


function TfrmTelaHeranca.RetornaCampoTraduzido(Campo: String):String;
var
  I: integer;
Begin
   for I := 0 to qryListagem.Fields.Count-1 do
   begin
      if lowercase(qryListagem.Fields[I].FieldName)=lowercase(Campo) then
      Begin
        Result:= qryListagem.Fields[I].DisplayLabel;
        break;
      End;
   end;
End;

function TfrmTelaHeranca.ExisteCampoObrigatorio: boolean;
var i: integer;
Begin
  Result:=false;
  for i := 0 to ComponentCount - 1 do
  Begin
  if (Components[i] is TLabeledEdit) then
  Begin
    if (TLabeledEdit(Components[i]).Tag = 2) and
    (TLabeledEdit(Components[i]).Text = EmptyStr)then
    begin
      MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption +
      ' � um campo obrigat�rio', mtInformation, [mbOK], 0);
      TLabeledEdit(Components[i]).SetFocus;
      Result:=true;
      break;
    end;

  End;
  End;
End;

procedure TfrmTelaHeranca.DesabilitarEditPK;
  var i: integer;
Begin
  for i := 0 to ComponentCount - 1 do
    Begin
    if (Components[i] is TLabeledEdit) then
      Begin
        if (TLabeledEdit(Components[i]).Tag = 1)then
        begin
          TLabeledEdit(Components[i]).Enabled:=false;
          break;
        end;
      End;
    End;
End;

procedure TfrmTelaHeranca.LimparEdits;
  var i: integer;
Begin
  for i := 0 to ComponentCount - 1 do
    Begin
    if (Components[i] is TLabeledEdit) then
       TLabeledEdit(Components[i]).Text:=EmptyStr
    else if (Components[i] is TEdit) then
       TEdit(Components[i]).Text:=EmptyStr;
    End;
End;

{$endregion}

{$region 'M�todos Virtuais'}
function TfrmTelaHeranca.Excluir: Boolean;
begin
  ShowMessage('DELETADO');
  Result:=true;
end;

function TfrmTelaHeranca.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
   if(EstadoDoCadastro=ecInserir) then
     ShowMessage('INSERIR')
   else if (EstadoDoCadastro=ecAlterar) then
     ShowMessage('ALTERARADO');
   Result:=true;
end;

{$endregion}

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
   btnNavegator, pgcPrincipal, false);
   EstadoDoCadastro:=ecInserir;
   LimparEdits;
end;


procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
   btnNavegator, pgcPrincipal, false);

   EstadoDoCadastro:=ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
try
   if Excluir then
   begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
      btnNavegator, pgcPrincipal, true);
      ControlarIndiceTab(pgcPrincipal, 0);
   end
   else
   begin
     MessageDlg('Erro ao Excluir', mtError, [mbOK], 0);
   end;
finally
  EstadoDoCadastro:=ecNenhum;
end;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
   btnNavegator, pgcPrincipal, true);   //Desabilita os bot�es alternando
  ControlarIndiceTab(pgcPrincipal, 0);    //Muda o Tab
  EstadoDoCadastro:=ecNenhum;
  LimparEdits;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
   if (ExisteCampoObrigatorio) then
     Abort;
   Try
     if Gravar(EstadoDoCadastro) then
     begin
       ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
       btnNavegator, pgcPrincipal, true);
       ControlarIndiceTab(pgcPrincipal, 0);
       EstadoDoCadastro:=ecNenhum;
       LimparEdits;
     end
     else
     begin
       MessageDlg('Erro na grava��o', mtError, [mbOk], 0);
     end;
     Finally

   End;

end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  qryListagem.Connection:=dmConexao.conexaoDB;
  dsListagem.DataSet:=qryListagem;
  grdListagem.DataSource:=dsListagem;
  btnNavegator.DataSource:=dsListagem;
  grdListagem.Options:=[dgTitles,dgIndicator,dgColumnResize,dgColLines,
  dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgCancelOnExit,
  dgTitleClick,dgTitleHotTrack];
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
    if (qryListagem.SQL.Text<>EmptyStr)then
  begin
    ControlarIndiceTab(pgcPrincipal, 0);    //Muda o Tab
    qryListagem.IndexFieldNames:=indiceAtual;
    ExibeIndiceLabel(indiceAtual, lblIndice);
    qryListagem.Open;
  end;
  DesabilitarEditPK;
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
  btnNavegator, pgcPrincipal, true);
end;

procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  indiceAtual:=Column.FieldName; //seta a variavel com o �ndice do grid
  qryListagem.IndexFieldNames:=indiceAtual; //ordena o grid conforme o �ndiceAtual
  ExibeIndiceLabel(indiceAtual, lblIndice);
end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
  qryListagem.Locate(indiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
end;

end.