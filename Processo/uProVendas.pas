unit uProVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, cFuncao,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, uConProduto,
  uDM, uDtmVendas, Vcl.ComCtrls, RxToolEdit, RxCurrEdit, cProdVenda, uEnum;

type
  TfrmProVendas = class(TfrmTelaHeranca)
    edtVendaId: TLabeledEdit;
    edtCliente: TDBLookupComboBox;
    lblCliente: TLabel;
    lblDataDeNascimento: TLabel;
    edtDataVenda: TDateEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    lblValor: TLabel;
    edtValorTotal: TCurrencyEdit;
    dbgridItensVendas: TDBGrid;
    lblProduto: TLabel;
    dblProduto: TDBLookupComboBox;
    lblQuantidade: TLabel;
    edtQuantidade: TCurrencyEdit;
    edtPrecoUnitario: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnAdicionarItem: TBitBtn;
    btnApagarItem: TBitBtn;
    qryListagemvendaId: TIntegerField;
    qryListagemclienteId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemdataVenda: TDateTimeField;
    qryListagemtotalVenda: TFloatField;
    dblCliente: TDBLookupComboBox;
    btnAdicionarCliente: TSpeedButton;
    btnPesquisarCliente: TSpeedButton;
    btnPesquisarProduto: TSpeedButton;
    btnAdicionarProduto: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure dblProdutoExit(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarItemClick(Sender: TObject);
    procedure dbgridItensVendasDblClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnPesquisarClienteClick(Sender: TObject);
    procedure btnAdicionarClienteClick(Sender: TObject);
    procedure btnPesquisarProdutoClick(Sender: TObject);
    procedure btnAdicionarProdutoClick(Sender: TObject);
  private
    { Private declarations }
     dtmVendas: TdtmVendas;
     oVenda: TVenda;
    function Excluir:Boolean; override; //m?todo virtual
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean; override;
    function TotalizarProduto(valorUnitario, Quantidade: Double): double;
    procedure LimparComponenteItem;
    procedure LimparCds;
    procedure CarregarRegistrosSelecionados;
    function TotalizarVenda: Double;

  public
    { Public declarations }
  end;

var
  frmProVendas: TfrmProVendas;

implementation

{$R *.dfm}

uses uRelProVenda, uConCliente, uTelaDeCliente, uPrincipal, uTelaDeProduto;

{$region 'Override'}

procedure TfrmProVendas.btnAdicionarClienteClick(Sender: TObject);
begin
  inherited;
   TFuncao.CriarForm(TfrmTelaDeCliente, oUsuarioLogado, dmConexao.conexaoDB);
   dtmVendas.qryCliente.Refresh;
end;

procedure TfrmProVendas.btnAdicionarItemClick(Sender: TObject);
begin
  inherited;
  if dblProduto.KeyValue=Null then
  begin
    MessageDlg('Produto ? um campo obrigat?rio', mtInformation, [mbOK], 0);
    dblProduto.SetFocus;
    abort;
  end;

  if edtQuantidade.Value<=0  then
  begin
    MessageDlg('Quantidade n?o pode ser zero', mtInformation, [mbOK], 0);
    edtQuantidade.SetFocus;
    abort;
  end;

  if edtPrecoUnitario.Value<=0 then
  begin
    MessageDlg('Valor Unit?rio n?o pode ser zero', mtInformation, [mbOK], 0);
    edtPrecoUnitario.SetFocus;
    abort;
  end;

  if (dtmVendas.cdsItensVenda.Locate('produtoId', dblProduto.KeyValue, [])) then
  begin
    MessageDlg('Este Produto j? foi selecionado', mtInformation, [mbOK], 0);
    dblProduto.SetFocus;
    abort;
  end;

  edtTotalProduto.Value := TotalizarProduto(edtQuantidade.Value, edtPrecoUnitario.Value);

  dtmVendas.cdsItensVenda.Append;
  dtmVendas.cdsItensVenda.FieldByName('produtoId').AsString:=dblProduto.KeyValue;
  dtmVendas.cdsItensVenda.FieldByName('nomeProduto').AsString:=dtmVendas.qryProdutos.FieldByName('nome').AsString;
  dtmVendas.cdsItensVenda.FieldByName('quantidade').AsFloat:=edtQuantidade.Value;
  dtmVendas.cdsItensVenda.FieldByName('valorUnitario').AsFloat:=edtPrecoUnitario.Value;
  dtmVendas.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat:=edtTotalProduto.Value;
  dtmVendas.cdsItensVenda.Post;
  edtValorTotal.Value := TotalizarVenda;
  LimparComponenteItem;

  dblProduto.SetFocus;
  end;

procedure TfrmProVendas.btnAdicionarProdutoClick(Sender: TObject);
begin
  inherited;
  TFuncao.CriarForm(TfrmTelaProdutos, oUsuarioLogado, dmConexao.conexaoDB);
  dtmVendas.qryProdutos.Refresh;
end;

procedure TfrmProVendas.LimparComponenteItem;
begin
   dblProduto.KeyValue := null;
   edtQuantidade.Value := 0;
   edtPrecoUnitario.Value := 0;
   edtTotalProduto.Value := 0;

end;

procedure TfrmProVendas.LimparCds;
begin
  dtmVendas.cdsItensVenda.First;
  while not dtmVendas.cdsItensVenda.Eof do
  dtmVendas.cdsItensVenda.Delete;
end;

function TfrmProVendas.TotalizarProduto(valorUnitario, Quantidade: Double): double;
begin
  result := valorUnitario * Quantidade;
end;

procedure TfrmProVendas.btnAlterarClick(Sender: TObject);
begin
     if oVenda.Selecionar(qryListagem.FieldByName('vendaId').AsInteger, dtmVendas.cdsItensVenda) then
     begin
       edtVendaId.Text      := IntToStr(oVenda.VendaId);
       dblCliente.KeyValue  := ovenda.clienteId;
       edtDataVenda.Date    := oVenda.dataVenda;
       edtValorTotal.Value  := ovenda.totalVenda;
     end
     else
     begin
       btnCancelar.Click;
       Abort;
     end;
  inherited;
end;

procedure TfrmProVendas.btnApagarClick(Sender: TObject);
begin
  inherited;
  edtValorTotal.Value := TotalizarVenda;
end;

procedure TfrmProVendas.btnApagarItemClick(Sender: TObject);
begin
  inherited;
  if dblProduto.KeyValue=Null then
  begin
    MessageDlg('Selecione o produto a ser exclu?do', mtInformation, [mbOK], 0);
    dbgridItensVendas.SetFocus;
    abort;
  end;

  if dtmVendas.cdsItensVenda.Locate('produtoId', dblProduto.KeyValue, []) then
  begin
     dtmVendas.cdsItensVenda.Delete;
     edtValorTotal.Value := TotalizarVenda;
     LimparComponenteItem;
  end;
end;

procedure TfrmProVendas.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVendas.btnGravarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVendas.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataVenda.Date := date;
  dblCliente.SetFocus;
  LimparCds;
end;

procedure TfrmProVendas.btnPesquisarClienteClick(Sender: TObject);
begin
  inherited;
  try
  frmConCliente:= TfrmConCliente.create(self);
  if dblCliente.KeyValue<>Null then
     frmConCliente.aIniciarPesquisaId := dblCliente.KeyValue;

     frmConCliente.ShowModal;

  if frmConCliente.aRetornarIdSelecionado<>Unassigned then
     dblCliente.KeyValue := frmConCliente.aRetornarIdSelecionado;

  finally
      frmConCliente.Release;
  end;
end;

procedure TfrmProVendas.btnPesquisarProdutoClick(Sender: TObject);
begin
  inherited;
  try
  frmConProduto := TfrmConProduto.create(self);
  if dblProduto.KeyValue<>Null then
     frmConProduto.aIniciarPesquisaId := dblProduto.KeyValue;

     frmConProduto.ShowModal;

  if frmConProduto.aRetornarIdSelecionado<>Unassigned then
     dblProduto.KeyValue := frmConProduto.aRetornarIdSelecionado;

  finally
      frmConProduto.Release;
  end;
end;

procedure TfrmProVendas.dbgridItensVendasDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistrosSelecionados;
end;

procedure TfrmProVendas.dblProdutoExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(Sender).KeyValue<>Null then
  begin
    edtPrecoUnitario.Value:=dtmVendas.qryProdutos.FieldByName('valor').AsFloat;
    edtQuantidade.Value:=1;
    edtTotalProduto.Value := TotalizarProduto(edtQuantidade.Value, edtPrecoUnitario.Value);
  end;
end;

procedure TfrmProVendas.edtQuantidadeEnter(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value := TotalizarProduto(edtQuantidade.Value, edtPrecoUnitario.Value);
end;

procedure TfrmProVendas.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value := TotalizarProduto(edtQuantidade.Value, edtPrecoUnitario.Value);
end;

function TfrmProVendas.Excluir: Boolean;
begin
    if ovenda.Selecionar(qryListagem.FieldByName('vendaId').AsInteger, dtmVendas.cdsItensVenda) then
    begin
       Result:= ovenda.Apagar;
    end
    else
    begin
       btnCancelar.Click;
       Abort;
    end;
end;

function TfrmProVendas.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
   if (edtVendaId.Text <> EmptyStr ) then
       ovenda.VendaId := StrToInt(edtVendaId.Text)
   else
       ovenda.VendaId := 0;
       ovenda.clienteId := dblCliente.KeyValue;
       ovenda.dataVenda := edtDataVenda.Date;
       ovenda.totalVenda := edtValorTotal.Value;

   if (EstadoDoCadastro = ecInserir) then
    oVenda.VendaId := oVenda.Inserir(dtmVendas.cdsItensVenda)
   else if (EstadoDoCadastro = ecAlterar) then
     oVenda.Atualizar(dtmVendas.cdsItensVenda);

     //Imprimir o relat?rio
     frmRelProVenda := TfrmRelProVenda.create(Self);
     frmRelProVenda.qryVenda.Close;
     frmRelProVenda.qryVenda.ParamByName('vendaId').AsInteger:=oVenda.VendaId;
     frmRelProVenda.qryVenda.Open;

     frmRelProVenda.qryVendasItens.Close;
     frmRelProVenda.qryVendasItens.ParamByName('vendaId').AsInteger:=oVenda.VendaId;
     frmRelProVenda.qryVendasItens.Open;

     frmRelProVenda.Relatorio.PreviewModal;
     frmRelProVenda.Release;

     Result := true;
end;

{$endregion}

procedure TfrmProVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(dtmVendas) then
    FreeAndNil(dtmVendas);

  if Assigned(ovenda) then
    FreeAndNil(ovenda);

end;

procedure TfrmProVendas.FormCreate(Sender: TObject);
begin
  inherited;
   dtmVendas := TdtmVendas.Create(Self);
   ovenda := TVenda.Create(dmConexao.conexaoDB);
   IndiceAtual := 'clienteId';
end;

procedure TfrmProVendas.grdListagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   BloqueiaCTRL_DEL_DBGrid(Key, Shift);
end;


procedure TfrmProVendas.CarregarRegistrosSelecionados;
begin
 dblProduto.KeyValue :=  dtmVendas.cdsItensVenda.FieldByName('produtoId').AsString;
 edtQuantidade.Value := dtmVendas.cdsItensVenda.FieldByName('quantidade').AsFloat;
 edtPrecoUnitario.Value := dtmVendas.cdsItensVenda.FieldByName('valorUnitario').AsFloat;
 edtTotalProduto.Value := dtmVendas.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat;
end;

function TfrmProVendas.TotalizarVenda:Double;
begin
  result:=0;
  dtmVendas.cdsItensVenda.First;
  while not dtmVendas.cdsItensVenda.Eof do
  begin
    result :=   result + dtmVendas.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat;
    dtmVendas.cdsItensVenda.Next;
  end;

end;

end.

