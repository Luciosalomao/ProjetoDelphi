unit uTelaDeProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, cFuncao,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, RxCurrEdit, cCadProduto, uEnum, uDM, uCadCategorias;

type
  TfrmTelaProdutos = class(TfrmTelaHeranca)
    qryListagemprodutoId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemdescricao: TWideStringField;
    qryListagemvalor: TFloatField;
    qryListagemquantidade: TFloatField;
    qryListagemcategoriaId: TIntegerField;
    qryListagemDescricaoCategoria: TWideStringField;
    edtProdutoId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtDescricao: TMemo;
    lblDescricao: TLabel;
    edtValor: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    lblValor: TLabel;
    lblQuantidade: TLabel;
    edtCategoriaId: TDBLookupComboBox;
    lblCategoria: TLabel;
    qryCategoria: TZQuery;
    dsCategoria: TDataSource;
    qryCategoriacategoriaId: TIntegerField;
    qryCategoriadescricao: TWideStringField;
    btnAdicionarCategoria: TSpeedButton;
    btnPesquisarCategoria: TSpeedButton;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarCategoriaClick(Sender: TObject);
    procedure btnPesquisarCategoriaClick(Sender: TObject);
  private
    { Private declarations }
    oProduto: TProduto;
    function Excluir:Boolean; override; //m?todo virtual
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean; override;
  public
    { Public declarations }
  end;

var
  frmTelaProdutos: TfrmTelaProdutos;

implementation

uses uPrincipal, uConCategoria;

{$R *.dfm}

{ TfrmTelaProdutos }

procedure TfrmTelaProdutos.btnAlterarClick(Sender: TObject);
begin
     if oProduto.Selecionar(qryListagem.FieldByName('produtoId').AsInteger) then
     begin
       edtProdutoId.Text:=IntToStr(oProduto.ProdutoId);
       edtNome.Text:=oProduto.Nome;
       edtDescricao.Text:=oProduto.Descricao;
       edtValor.Value:=oProduto.Valor;
       edtQuantidade.Value:=oProduto.Quantidade;
       edtCategoriaId.KeyValue:=oProduto.CategoriaID;
     end
     else
     begin
       btnCancelar.Click;
       Abort;
     end;
  inherited;

end;

procedure TfrmTelaProdutos.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
  edtValor.Text:='';
end;

procedure TfrmTelaProdutos.btnPesquisarCategoriaClick(Sender: TObject);
begin
  inherited;
  try
  frmConCategoria:= TfrmConCategoria.create(self);
  if edtCategoriaId.KeyValue<>Null then
     frmConCategoria.aIniciarPesquisaId := edtCategoriaId.KeyValue;

     frmConCategoria.ShowModal;

  if frmConCategoria.aRetornarIdSelecionado<>Unassigned then
     edtCategoriaId.KeyValue := frmConCategoria.aRetornarIdSelecionado;

  finally
      frmConCategoria.Release;
  end;
end;

function TfrmTelaProdutos.Excluir: Boolean;
begin
 if oProduto.Selecionar(qryListagem.FieldByName('produtoId').AsInteger) then
    begin
      Result:= oProduto.Apagar;
    end
    else
    begin
       btnCancelar.Click;
       Abort;
    end;
end;

procedure TfrmTelaProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oProduto) then
  FreeAndNil(oProduto);
end;

procedure TfrmTelaProdutos.FormCreate(Sender: TObject);
begin
  inherited;
   oProduto:=TProduto.Create(dmConexao.conexaoDB);
   indiceAtual:='nome';
end;

procedure TfrmTelaProdutos.FormShow(Sender: TObject);
begin
  inherited;
  qryCategoria.Open;
end;

function TfrmTelaProdutos.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
   if(edtProdutoId.Text <> EmptyStr)then
      oProduto.produtoId := StrToInt(edtProdutoId.Text)
      else
      oProduto.ProdutoId         := 0;
      oProduto.Nome              := edtNome.Text;
      oProduto.Descricao         := edtDescricao.Text;
      oProduto.Valor             := edtValor.Value;
      oProduto.Quantidade        := edtQuantidade.Value;
      oProduto.CategoriaID       := edtCategoriaId.KeyValue;

   if (EstadoDoCadastro = ecInserir) then
     Result := oProduto.Inserir
   else if (EstadoDoCadastro = ecAlterar) then
     Result := oProduto.Atualizar;

end;

procedure TfrmTelaProdutos.btnAdicionarCategoriaClick(Sender: TObject);
begin
  inherited;
  TFuncao.CriarForm(TfrmCadCategoria, oUsuarioLogado, dmConexao.conexaoDB);
  qryCategoria.Refresh;
end;

end.
