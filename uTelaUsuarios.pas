unit uTelaUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls,
  cUsuario, uEnum, Vcl.ComCtrls, uDM, cAcaoAcesso;

type
  TfrmTelaUsuarios = class(TfrmTelaHeranca)
    qryListagemusuarioId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemsenha: TWideStringField;
    edtUsuarioId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtSenha: TLabeledEdit;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
    oUsuario : TUsuario;
    function Excluir:Boolean; override; //método virtual
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean; override;
  public
    { Public declarations }
  end;

var
  frmTelaUsuarios: TfrmTelaUsuarios;

implementation

{$R *.dfm}

{ TfrmTelaUsuarios }

procedure TfrmTelaUsuarios.btnAlterarClick(Sender: TObject);
begin
   if oUsuario.Selecionar(qryListagem.FieldByName('usuarioId').AsInteger) then
   begin
     edtUsuarioId.Text      := IntToStr(oUsuario.usuarioId);
     edtNome.Text           := oUsuario.nome;
     edtSenha.Text          := oUsuario.senha;
   end
   else
   begin
      btnCancelar.Click;
      Abort;
   end;

  inherited;

end;

procedure TfrmTelaUsuarios.btnGravarClick(Sender: TObject);
begin
   if oUsuario.UsuarioExiste(edtNome.Text) then
   begin
      MessageDlg('Usuário já cadastrado', mtInformation, [mbOK], 0);
      edtNome.SetFocus;
      abort;
   end;

   if(edtUsuarioId.Text <> EmptyStr)then
       oUsuario.usuarioId := StrToInt(edtUsuarioId.Text)
   else
       oUsuario.usuarioId         := 0;
       oUsuario.nome              := edtNome.Text;
       oUsuario.senha             := edtSenha.Text;

  inherited;

end;

procedure TfrmTelaUsuarios.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

function TfrmTelaUsuarios.Excluir: Boolean;
begin
  if oUsuario.Selecionar(qryListagem.FieldByName('usuarioId').AsInteger) then
  begin
    Result:= oUsuario.Apagar;
  end
  else
    begin
       btnCancelar.Click;
       Abort;
    end;
end;

procedure TfrmTelaUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oUsuario) then
  FreeAndNil(oUsuario);
end;

procedure TfrmTelaUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  oUsuario:=TUsuario.Create(dmConexao.conexaoDB);
  indiceAtual:='nome';
end;

function TfrmTelaUsuarios.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
   if (EstadoDoCadastro = ecInserir) then
     Result := oUsuario.Inserir
   else if (EstadoDoCadastro = ecAlterar) then
     Result := oUsuario.Atualizar;

     TAcaoAcesso.PreencherUsuariosVsAcoes(dmConexao.conexaoDB);
end;

end.
