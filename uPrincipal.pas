unit uPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  uDM,
  Enter,
  ufrmAtualizaDB,
  Vcl.ComCtrls,
  cUsuarioLogado,
  ZDbcIntfs,
  cAtualizacaoBancoDeDados;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentao1: TMenuItem;
    Relatrios1: TMenuItem;
    Cliente1: TMenuItem;
    N1: TMenuItem;
    Categoria1: TMenuItem;
    Produto1: TMenuItem;
    N2: TMenuItem;
    mnuFechar: TMenuItem;
    Venda1: TMenuItem;
    Cliente2: TMenuItem;
    N3: TMenuItem;
    Produto2: TMenuItem;
    N4: TMenuItem;
    Vendapordata1: TMenuItem;
    Categoria2: TMenuItem;
    FichadoCliente1: TMenuItem;
    ProdutoporCategoria1: TMenuItem;
    Usurio1: TMenuItem;
    N5: TMenuItem;
    AlterarSenha1: TMenuItem;
    stbPrincipal: TStatusBar;
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cliente1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure Categoria2Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure FichadoCliente1Click(Sender: TObject);
    procedure Produto2Click(Sender: TObject);
    procedure ProdutoporCategoria1Click(Sender: TObject);
    procedure Vendapordata1Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AlterarSenha1Click(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB); //Código que troca o tab pelo enter e muda a cor - componente de terceiro
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  oUsuarioLogado : TUsuarioLogado;

implementation

{$R *.dfm}

uses uCadCategorias, uTelaDeCliente, uTelaDeProduto, uProVendas, uRelCategoria,
  uRelCadCliente, uRelCadClienteFicha, uRelCadProduto, uRelProdutoCategoria,
  uSelecionarData, uRelVendaPorData, uTelaUsuarios, uLogin, uAlterarSenha;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
  frmCadCategoria:=TfrmCadCategoria.create(self);
  frmCadCategoria.showModal;
  frmCadCategoria.release;  {Destroi o componente}
end;

procedure TfrmPrincipal.Categoria2Click(Sender: TObject);
begin
   frmRelCategoria:=TfrmRelCategoria.create(Self);
   frmRelCategoria.Relatorio.PreviewModal;
   frmRelCategoria.Release;
end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  frmTelaDeCliente:=TfrmTelaDeCliente.create(self);
  frmTelaDeCliente.showModal;
  frmTelaDeCliente.release;
end;

procedure TfrmPrincipal.Cliente2Click(Sender: TObject);
begin
  frmRelCadCliente:=TfrmRelCadCliente.create(self);
  frmRelCadCliente.Relatorio.PreviewModal;
  frmRelCadCliente.Release;
end;

procedure TfrmPrincipal.FichadoCliente1Click(Sender: TObject);
begin
  frmRelCadClienteFicha:=TfrmRelCadClienteFicha.create(self);
  frmRelCadClienteFicha.Relatorio.PreviewModal;
  frmRelCadClienteFicha.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {Destruindo os componentes}
  FreeAndNil(dmConexao);
  FreeAndNil(TeclaEnter);

  if Assigned(oUsuarioLogado) then
      FreeAndNil(oUsuarioLogado);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmAtualizaDB := TfrmAtualizaDB.create(Self);  {Cria o form de atualização}
  frmAtualizaDB.Show;
  frmAtualizaDB.Refresh;

  dmConexao:= TdmConexao.Create(Self);

  with dmConexao.conexaoDB do begin    //O with é usado para evitar repetição de código
    Connected:=False;
    SQLHourGlass:=true;  //muda a ampulheta
    Protocol:='mssql';
    LibraryLocation:='C:\ProjetoDelphi\ntwdblib.dll';
    HostName:='localhost\SQL2017EL';
    Port:=1433;
    User:='sa';
    Password:='cidadao';
    Database:='vendasII';  //'Vendas';
    AutoCommit:=true;
    TransactIsolationLevel:=tiReadCommitted;
    Connected:=true;   //cria o banco
  end;
  AtualizacaoBancoDados(frmAtualizaDB);
  frmAtualizaDB.Free;  {destroi o form de atualização}

  TeclaEnter:= TMREnter.Create(Self);
  TeclaEnter.FocusEnabled:=true;
  TeclaEnter.FocusColor:=clInfoBk;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   try
      oUsuarioLogado := TUsuarioLogado.Create;
      frmLogin:= TfrmLogin.Create(Self);
      frmLogin.ShowModal;
   finally
       frmLogin.Release;
       stbPrincipal.Panels[0].Text:='USUÁRIO: ' + oUsuarioLogado.nome;
   end;

end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TfrmPrincipal.Produto1Click(Sender: TObject);
begin
  frmTelaProdutos:=TfrmTelaProdutos.create(self);
  frmTelaProdutos.showModal;
  frmTelaProdutos.release;
end;

procedure TfrmPrincipal.Produto2Click(Sender: TObject);
begin
   frmRelCadProduto:=TfrmRelCadProduto.create(Self);
   frmRelCadProduto.Relatorio.PreviewModal;
   frmRelCadProduto.Release;
end;

procedure TfrmPrincipal.ProdutoporCategoria1Click(Sender: TObject);
begin
   frmRelProdutoCategoria:=TfrmRelProdutoCategoria.create(Self);
   frmRelProdutoCategoria.Relatorio.PreviewModal;
   frmRelProdutoCategoria.Release;
end;

procedure TfrmPrincipal.Usurio1Click(Sender: TObject);
begin
  frmTelaUsuarios:=TfrmTelaUsuarios.create(self);
  frmTelaUsuarios.showModal;
  frmTelaUsuarios.release;
end;

procedure TfrmPrincipal.Venda1Click(Sender: TObject);
begin
  //crtl + F9 para adicionar as uses
  frmProVendas:=TfrmProVendas.create(self);
  frmProVendas.showModal;
  frmProVendas.release;
end;

procedure TfrmPrincipal.Vendapordata1Click(Sender: TObject);
begin
   try
     frmSelecionarData := TfrmSelecionarData.Create(Self);
     frmSelecionarData.ShowModal;

     frmRelVendaPorData := TfrmRelVendaPorData.Create(Self);
     frmRelVendaPorData.qryVenda.Close;
     frmRelVendaPorData.qryVenda.ParamByName('DataInicio').AsDate:=frmSelecionarData.edtDataInicio.Date;
     frmRelVendaPorData.qryVenda.ParamByName('DataFinal').AsDate:=frmSelecionarData.edtDataFinal.Date;
     frmRelVendaPorData.qryVenda.Open;
     frmRelVendaPorData.Relatorio.PreviewModal;
   finally
     frmSelecionarData.Release;
     frmRelVendaPorData.Release;
   end;

end;

procedure TfrmPrincipal.AlterarSenha1Click(Sender: TObject);
begin
   frmMudarSenha:= TfrmMudarSenha.Create(Self);
   frmMudarSenha.ShowModal;
   frmMudarSenha.Release;
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
var
    oAtualizarMSSQL: TAtualizaBancoDeDadosMSSQL;
//Atualiza o banco de dados
begin

    aForm.refresh;

    try
       oAtualizarMSSQL := TAtualizaBancoDeDadosMSSQL.Create(dmConexao.conexaoDB);
       oAtualizarMSSQL.AtualizarBancoDeDadosMSSQL;

    finally
       if Assigned(oAtualizarMSSQL) then
          FreeAndNil(oAtualizarMSSQL);
    end;

end;

end.
