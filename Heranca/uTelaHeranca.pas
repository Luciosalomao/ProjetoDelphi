unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,   Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDM, uEnum, RxToolEdit, RxCurrEdit, cUsuarioLogado,
  ZAbstractConnection, ZConnection;

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
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    SelectOriginal : String;
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
    function Excluir:Boolean; virtual; //método virtual
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean; virtual;
    procedure BloqueiaCTRL_DEL_DBGrid(var key: Word; Shift: TShiftState);
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

uses uPrincipal;

Function DataIng(Data:String):String;
begin
  {converte data de dd/mm/yyyy para mm/dd/yyyy}
  Result := Copy(Data,4,3) + Copy(Data,1,3) + Copy(Data,7,4);
end;

{$region 'Observações'}
//Tag = 1 - Chave primária
//Tab = 2 - Campos obrigatórios
{$endregion}

{$region 'Procedures e Funções'}

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
      ' é um campo obrigatório', mtInformation, [mbOK], 0);
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
       TEdit(Components[i]).Text:=EmptyStr
    else if (Components[i] is TMaskEdit) then
       TMaskEdit(Components[i]).Text:=EmptyStr
    else if (Components[i] is TMemo) then
       TMemo(Components[i]).Lines.Clear
    else if (Components[i] is TCurrencyEdit) then
       TCurrencyEdit(Components[i]).Text:=EmptyStr
    else if (Components[i] is TDBLookupComboBox) then
       TDBLookupComboBox(Components[i]).keyvalue:=NULL
    End;
End;

{$endregion}

{$region 'Métodos Virtuais'}
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

   if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, dmConexao.conexaoDB) then
   begin
      MessageDlg('Usuário: '+ oUsuarioLogado.nome +', não tem permissão de acesso', mtWarning, [mbOK], 0);
      Abort;
   end;

   ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
   btnNavegator, pgcPrincipal, false);
   EstadoDoCadastro:=ecInserir;
   LimparEdits;
end;


procedure TfrmTelaHeranca.btnPesquisarClick(Sender: TObject);
var i: integer;
     TipoCampo:TFieldType;
     NomeCampo: String;
     WhereOrAnd: String;
     CondicaoSQL: String;
     strData: string;
begin
 if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, dmConexao.conexaoDB) then
   begin
      MessageDlg('Usuário: '+ oUsuarioLogado.nome +', não tem permissão de acesso', mtWarning, [mbOK], 0);
      Abort;
   end;

   if mskPesquisar.Text='' then
   begin
     qryListagem.Close;
     qryListagem.SQL.Clear;
     qryListagem.SQL.Add(SelectOriginal);
     qryListagem.Open;
     Abort;
   end;

   for i := 0 to qryListagem.FieldCount-1 do
   begin
     if qryListagem.Fields[i].FieldName=IndiceAtual then
       begin
          TipoCampo := qryListagem.Fields[i].DataType;
          if qryListagem.Fields[i].Origin<>'' then
            begin
              if pos('.', qryListagem.Fields[i].Origin) > 0 then
                 NomeCampo := qryListagem.Fields[i].Origin
              else
                  NomeCampo:=qryListagem.Fields[i].Origin+'.'+qryListagem.Fields[i].FieldName
            end
            else
            NomeCampo:=qryListagem.Fields[i].FieldName;
            Break;
       end;

   end;


   if Pos('where', LowerCase(SelectOriginal)) > 1 then
   begin
     WhereOrAnd := ' and ';
   end
   else
   begin
      WhereOrAnd := ' where ';
   end;

   if (TipoCampo = ftString) or (TipoCampo = ftWideString) then
      begin
        CondicaoSQL := WhereOrAnd + ' ' + NomeCampo + ' LIKE ' + QuotedStr('%'+ mskPesquisar.Text + '%')
      end
      else if (TipoCampo = ftInteger) or (TipoCampo = ftSmallint)then
      begin
        CondicaoSQL :=  WhereOrAnd + ' ' + NomeCampo + '=' + DataIng(mskPesquisar.Text)
      end
      else if (TipoCampo = ftDate) or (TipoCampo = ftDateTime)then
      begin
        strData:=DataIng(mskPesquisar.Text);
        CondicaoSQL :=  WhereOrAnd + ' ' + NomeCampo + '=' + QuotedStr(strData);
      end
      else if (TipoCampo = ftFloat) or (TipoCampo = ftCurrency)then
      begin
         CondicaoSQL :=  WhereOrAnd + ' ' + NomeCampo + '=' +
         StringReplace(mskPesquisar.Text,',','.',[rfReplaceAll]);
      end;

        qryListagem.close;
        qryListagem.SQL.Clear;
        qryListagem.SQL.Add(SelectOriginal);
        qryListagem.SQL.Add(CondicaoSQL);
        qryListagem.Open;


        mskPesquisar.Text:='';
        mskPesquisar.SetFocus;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin

   if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, dmConexao.conexaoDB) then
   begin
      MessageDlg('Usuário: '+ oUsuarioLogado.nome +', não tem permissão de acesso', mtWarning, [mbOK], 0);
      Abort;
   end;

   ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
   btnNavegator, pgcPrincipal, false);
   EstadoDoCadastro:=ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin

if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, dmConexao.conexaoDB) then
   begin
      MessageDlg('Usuário: '+ oUsuarioLogado.nome +', não tem permissão de acesso', mtWarning, [mbOK], 0);
      Abort;
   end;

try
   if Excluir then
   begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
      btnNavegator, pgcPrincipal, true);
      ControlarIndiceTab(pgcPrincipal, 0);
      qryListagem.Refresh;
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
   btnNavegator, pgcPrincipal, true);   //Desabilita os botões alternando
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

   if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, dmConexao.conexaoDB) then
   begin
      MessageDlg('Usuário: '+ oUsuarioLogado.nome +', não tem permissão de acesso', mtWarning, [mbOK], 0);
      Abort;
   end;

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
       qryListagem.Refresh;
     end
     else
     begin
       MessageDlg('Erro na gravação', mtError, [mbOk], 0);
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
    SelectOriginal := qryListagem.SQL.Text;
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

procedure TfrmTelaHeranca.grdListagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   BloqueiaCTRL_DEL_DBGrid(Key, Shift);
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  indiceAtual:=Column.FieldName; //seta a variavel com o índice do grid
  qryListagem.IndexFieldNames:=indiceAtual; //ordena o grid conforme o índiceAtual
  ExibeIndiceLabel(indiceAtual, lblIndice);
end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
  qryListagem.Locate(indiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
end;

procedure TfrmTelaHeranca.BloqueiaCTRL_DEL_DBGrid(var key: Word; Shift: TShiftState);
begin
  //Bloqueia o CTRL + DEL
  if (Shift = [ssCtrl]) and (Key = 46) then
      key := 0;
end;




end.
