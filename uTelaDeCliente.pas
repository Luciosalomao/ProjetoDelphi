unit uTelaDeCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, cCadCliente, uEnum, uDM;

type
  TfrmTelaDeCliente = class(TfrmTelaHeranca)
    edtNome: TLabeledEdit;
    edtClienteId: TLabeledEdit;
    edtCep: TMaskEdit;
    lblCep: TLabel;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtTelefone: TMaskEdit;
    ldlTelefone: TLabel;
    edtEmail: TLabeledEdit;
    edtDataDeNascimento: TDateEdit;
    lblDataDeNascimento: TLabel;
    qryListagemclienteId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemendereco: TWideStringField;
    qryListagemcidade: TWideStringField;
    qryListagembairro: TWideStringField;
    qryListagemcep: TWideStringField;
    qryListagemtelefone: TWideStringField;
    qryListagememail: TWideStringField;
    qryListagemdatadenascimento: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCliente: TCliente;
    function Excluir:Boolean; override; //método virtual
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean; override;
  public
    { Public declarations }
  end;

var
  frmTelaDeCliente: TfrmTelaDeCliente;

implementation

{$R *.dfm}


{ TfrmTelaDeCliente }

procedure TfrmTelaDeCliente.btnAlterarClick(Sender: TObject);
begin
    if oCliente.Selecionar(qryListagem.FieldByName('clienteId').AsInteger) then
  begin
    edtClienteId.Text:=IntToStr(oCliente.ClienteId);
    edtNome.Text:=oCliente.nome;
    edtEndereco.Text:=oCliente.endereco;
    edtCEP.Text:=oCliente.cep;
    edtBairro.Text:=oCliente.bairro;
    edtCidade.Text:=oCliente.cidade;
    edtTelefone.Text:=oCliente.telefone;
    edtEmail.Text:=oCliente.email;
    edtCEP.Text:=oCliente.cep;
    edtDataDeNascimento.Date:=oCliente.DataDeNascimento;
  end
  else
  begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;
end;

procedure TfrmTelaDeCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataDeNascimento.Date:=Date;
  edtNome.SetFocus;
end;

function TfrmTelaDeCliente.Excluir: Boolean;
begin
  if oCliente.Selecionar(qryListagem.FieldByName('clienteId').AsInteger) then
  begin
    Result:= oCliente.Apagar;
  end
  else
    begin
       btnCancelar.Click;
       Abort;
    end;
end;

procedure TfrmTelaDeCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCliente) then
  FreeAndNil(oCliente);
end;

procedure TfrmTelaDeCliente.FormCreate(Sender: TObject);
begin
  inherited;
    oCliente:=TCliente.Create(dmConexao.conexaoDB);
    indiceAtual:='nome';
end;

function TfrmTelaDeCliente.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
   if(edtClienteId.Text <> EmptyStr)then
      oCliente.clienteId := StrToInt(edtClienteId.Text)
      else
      oCliente.ClienteId         := 0;
      oCliente.nome              := edtNome.Text;
      oCliente.Endereco          := edtEndereco.Text;
      oCliente.Cidade            := edtCidade.Text;
      oCliente.Bairro            := edtBairro.Text;
      oCliente.CEP               := edtCep.Text;
      oCliente.Telefone          := edtTelefone.Text;
      oCliente.Email             := edtEmail.Text;
      oCliente.DataDeNascimento  := edtDataDeNascimento.Date;

   if (EstadoDoCadastro = ecInserir) then
     Result := oCliente.Inserir
   else if (EstadoDoCadastro = ecAlterar) then
     Result := oCliente.Atualizar;
end;

end.
