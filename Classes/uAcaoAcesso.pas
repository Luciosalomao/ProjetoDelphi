unit uAcaoAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, cAcaoAcesso, uDM,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids, uEnum,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmCadAcaoAcesso = class(TfrmTelaHeranca)
    qryListagemacaoAcessoId: TIntegerField;
    qryListagemdescricao: TWideStringField;
    qryListagemchave: TWideStringField;
    edtAcaoAcessoId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtChave: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    oAcaoAcesso : TAcaoAcesso;
    function Excluir:Boolean; override; //m?todo virtual
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean; override;
  end;

var
  frmCadAcaoAcesso: TfrmCadAcaoAcesso;

implementation

{$R *.dfm}

{ TfrmCadAcaoAcesso }

procedure TfrmCadAcaoAcesso.btnAlterarClick(Sender: TObject);
begin

  if oAcaoAcesso.Selecionar(qryListagem.FieldByName('acaoAcessoId').AsInteger) then
     begin
       edtAcaoAcessoId.Text := IntToStr(oAcaoAcesso.acaoAcessoId);
       edtDescricao.Text    := oAcaoAcesso.descricao;
       edtChave.Text        := oAcaoAcesso.chave;
     end
     else begin
       btnCancelar.Click;
       Abort;
     end;

  inherited;

end;

procedure TfrmCadAcaoAcesso.btnGravarClick(Sender: TObject);
begin

  if edtAcaoAcessoId.Text<>EmptyStr then
      oAcaoAcesso.acaoAcessoId := StrToInt(edtAcaoAcessoId.Text)
  else
      oAcaoAcesso.acaoAcessoId := 0;
      oAcaoAcesso.descricao    := edtDescricao.Text;
      oAcaoAcesso.chave        := edtChave.Text;



  if oAcaoAcesso.ChaveExiste(edtChave.Text, oAcaoAcesso.acaoAcessoId) then
   begin
       MessageDlg('Chave j? cadastrado', mtInformation, [mbOk],0);
       edtChave.SetFocus;
       Abort;
   end;


  inherited;

end;

procedure TfrmCadAcaoAcesso.btnNovoClick(Sender: TObject);
begin
  inherited;
      edtDescricao.SetFocus;
end;

function TfrmCadAcaoAcesso.Excluir: Boolean;
begin
    if oAcaoAcesso.Selecionar(qryListagem.FieldByName('acaoAcessoId').AsInteger) then
    begin
       Result := oAcaoAcesso.Apagar;
    end;

end;

procedure TfrmCadAcaoAcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(oAcaoAcesso) then
     FreeAndNil(oAcaoAcesso);
end;

procedure TfrmCadAcaoAcesso.FormCreate(Sender: TObject);
begin
  inherited;
  oAcaoAcesso := TAcaoAcesso.Create(dmConexao.conexaoDB);
  IndiceAtual := 'descricao';
end;

function TfrmCadAcaoAcesso.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
   if EstadoDoCadastro = ecInserir then
       Result := oAcaoAcesso.Inserir
   else if EstadoDoCadastro = ecAlterar then
       Result := oAcaoAcesso.Atualizar;
end;

end.
