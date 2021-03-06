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
  cAtualizacaoBancoDeDados,
  Vcl.StdCtrls,
  cArquivoIni,
  cFuncao,
  RLReport, Vcl.ExtCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.Series, VCLTee.DBChart;

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
    AoAcesso1: TMenuItem;
    N6: TMenuItem;
    UsuriosVsAes1: TMenuItem;
    N7: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    pnGraficos: TPanel;
    pnlEsquerdo: TPanel;
    Splitter1: TSplitter;
    pnlDireito: TPanel;
    pnlEsquerdoSup: TPanel;
    pnlDireitoSup: TPanel;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    pnlEsquerdoInf: TPanel;
    pnlDireitoInf: TPanel;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    DBChart2: TDBChart;
    Series2: TPieSeries;
    DBChart3: TDBChart;
    PieSeries1: TPieSeries;
    DBChart4: TDBChart;
    Series3: TFastLineSeries;
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
    procedure AoAcesso1Click(Sender: TObject);
    procedure UsuriosVsAes1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure pnGraficosResize(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
    procedure AtualizarDashbord; //C?digo que troca o tab pelo enter e muda a cor - componente de terceiro
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
  uSelecionarData, uRelVendaPorData, uTelaUsuarios, uLogin, uAlterarSenha,
  uAcaoAcesso, cAcaoAcesso, uUsuarioVsAcoes, udtmGrafico, uTelaHeranca;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
   TFuncao.CriarForm(TfrmCadCategoria, oUsuarioLogado, dmConexao.conexaoDB);
   //CriarForm(TfrmCadCategoria);
end;

procedure TfrmPrincipal.Categoria2Click(Sender: TObject);
begin
   TFuncao.CriarRelatorio(TfrmRelCategoria, oUsuarioLogado, dmConexao.conexaoDB);
end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmTelaDeCliente,oUsuarioLogado,dmConexao.conexaoDB);
end;

procedure TfrmPrincipal.Cliente2Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCadCliente, oUsuarioLogado, dmConexao.conexaoDB);
end;

procedure TfrmPrincipal.FichadoCliente1Click(Sender: TObject);
begin
   TFuncao.CriarRelatorio(TfrmRelCadClienteFicha, oUsuarioLogado, dmConexao.conexaoDB);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {Destruindo os componentes}
  FreeAndNil(dmConexao);
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmGrafico);

  if Assigned(oUsuarioLogado) then
      FreeAndNil(oUsuarioLogado);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

   if not FileExists(TArquivoIni.ArquivoIni) then
   begin
      TArquivoIni.AtualizarIni('SERVER', 'TipoDataBase', 'MSSQL');
      TArquivoIni.AtualizarIni('SERVER', 'HostName', '.\');
      TArquivoIni.AtualizarIni('SERVER', 'Port', '1433');
      TArquivoIni.AtualizarIni('SERVER', 'User', 'sa');
      TArquivoIni.AtualizarIni('SERVER', 'Password', 'mudar@123');
      TArquivoIni.AtualizarIni('SERVER', 'Database', 'vendas');

      MessageDlg('Arquivo '+ TArquivoIni.ArquivoIni + ' Criado com sucesso. ' +#13+
                 'Configure o arquivo antes de inicializar aplica??o', MtInformation, [mbOK],0);

      Application.Terminate;
   end
   else
   begin
      frmAtualizaDB := TfrmAtualizaDB.create(Self);  {Cria o form de atualiza??o}
      frmAtualizaDB.Show;
      frmAtualizaDB.Refresh;

      dmConexao:= TdmConexao.Create(Self);

      with dmConexao.conexaoDB do begin    //O with ? usado para evitar repeti??o de c?digo
        Connected:=False;
        SQLHourGlass:=true;  //muda a ampulheta
        LibraryLocation:='C:\ProjetoDelphi\ntwdblib.dll';
        if TArquivoIni.LerIni('SERVER', 'TipoDataBase')='MSSQL' then
        Protocol:='mssql';
        HostName:=TArquivoIni.LerIni('SERVER', 'HostName');
        Port:=StrToInt(TArquivoIni.LerIni('SERVER', 'Port'));
        User:=TArquivoIni.LerIni('SERVER', 'User');
        Password:=TArquivoIni.LerIni('SERVER', 'Password');
        Database:=TArquivoIni.LerIni('SERVER', 'Database');
        AutoCommit:=true;
        TransactIsolationLevel:=tiReadCommitted;
        Connected:=true;   //cria o banco
      end;
      AtualizacaoBancoDados(frmAtualizaDB);

      TAcaoAcesso.CriarAcoes(TfrmCadCategoria, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmTelaDeCliente, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmTelaProdutos, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmTelaUsuarios, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmCadAcaoAcesso, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmMudarSenha, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmProVendas, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmRelVendaPorData, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmRelCadClienteFicha, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmRelCadCliente, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmRelProdutoCategoria, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmRelCadProduto, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmRelCategoria, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmUsuarioVsAcoes, dmConexao.conexaoDB);
      TAcaoAcesso.CriarAcoes(TfrmSelecionarData, dmConexao.conexaoDB);

      TAcaoAcesso.PreencherUsuariosVsAcoes(dmConexao.conexaoDB);

      dtmGrafico := TdtmGrafico.Create(Self);
      AtualizarDashbord;

      frmAtualizaDB.Free;  {destroi o form de atualiza??o}

      TeclaEnter:= TMREnter.Create(Self);
      TeclaEnter.FocusEnabled:=true;
      TeclaEnter.FocusColor:=clInfoBk;
   end;



end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   try
      oUsuarioLogado := TUsuarioLogado.Create;
      frmLogin:= TfrmLogin.Create(Self);
      frmLogin.ShowModal;
   finally
       frmLogin.Release;
       stbPrincipal.Panels[0].Text:='USU?RIO: ' + oUsuarioLogado.nome;
   end;

end;

procedure TfrmPrincipal.Label1Click(Sender: TObject);
begin
   AtualizarDashbord;
end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TfrmPrincipal.pnGraficosResize(Sender: TObject);
begin
   //Redimensionando Dashbord
   pnlEsquerdo.Width:=pnGraficos.Width div 2;
   pnlEsquerdoSup.Height:=pnGraficos.Height div 2;
   pnlDireitoSup.Height:=pnGraficos.Height div 2;
end;

procedure TfrmPrincipal.Produto1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmTelaProdutos, oUsuarioLogado, dmConexao.conexaoDB);
end;

procedure TfrmPrincipal.Produto2Click(Sender: TObject);
begin
   TFuncao.CriarRelatorio(TfrmRelCadProduto, oUsuarioLogado, dmConexao.conexaoDB);
end;

procedure TfrmPrincipal.ProdutoporCategoria1Click(Sender: TObject);
begin
   TFuncao.CriarRelatorio(TfrmRelProdutoCategoria, oUsuarioLogado, dmConexao.conexaoDB);
end;

procedure TfrmPrincipal.Usurio1Click(Sender: TObject);
begin
    TFuncao.CriarForm(TfrmTelaUsuarios, oUsuarioLogado, dmConexao.conexaoDB);
end;

procedure TfrmPrincipal.UsuriosVsAes1Click(Sender: TObject);
begin
   TFuncao.CriarForm(TfrmUsuarioVsAcoes, oUsuarioLogado, dmConexao.conexaoDB);
end;

procedure TfrmPrincipal.Venda1Click(Sender: TObject);
begin
  //crtl + F9 para adicionar as uses
    TFuncao.CriarForm(TfrmProVendas, oUsuarioLogado, dmConexao.conexaoDB);
end;

procedure TfrmPrincipal.Vendapordata1Click(Sender: TObject);
begin
   try
     frmSelecionarData := TfrmSelecionarData.Create(Self);
     if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, frmSelecionarData.Name, dmConexao.conexaoDB) then
     begin
       frmSelecionarData.ShowModal;

       frmRelVendaPorData := TfrmRelVendaPorData.Create(Self);
       frmRelVendaPorData.qryVenda.Close;
       frmRelVendaPorData.qryVenda.ParamByName('DataInicio').AsDate:=frmSelecionarData.edtDataInicio.Date;
       frmRelVendaPorData.qryVenda.ParamByName('DataFinal').AsDate:=frmSelecionarData.edtDataFinal.Date;
       frmRelVendaPorData.qryVenda.Open;
       frmRelVendaPorData.Relatorio.PreviewModal;
     end
     else
     begin
       MessageDlg('Usu?rio: '+oUsuarioLogado.nome +' N?o tem permiss?o', mtWarning, [mbOK],0);
     end;
   finally
     if Assigned(frmSelecionarData) then
        frmSelecionarData.Release;
     if Assigned(frmRelVendaPorData) then
        frmRelVendaPorData.Release;
   end;

end;

procedure TfrmPrincipal.AlterarSenha1Click(Sender: TObject);
begin
   TFuncao.CriarForm(TfrmMudarSenha, oUsuarioLogado, dmConexao.conexaoDB);
end;

procedure TfrmPrincipal.AoAcesso1Click(Sender: TObject);
begin
   TFuncao.CriarForm(TfrmCadAcaoAcesso, oUsuarioLogado, dmConexao.conexaoDB);
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

procedure TfrmPrincipal.AtualizarDashbord;
begin

  try
    screen.Cursor:=crSQLWait;
    if (dtmGrafico.qryProdutoEstoque.Active) then
        dtmGrafico.qryProdutoEstoque.Close;

    if (dtmGrafico.qryVendaValorPorCliente.Active) then
        dtmGrafico.qryVendaValorPorCliente.Close;

    if (dtmGrafico.qryVendasMaiores.Active) then
        dtmGrafico.qryVendasMaiores.Close;

    if (dtmGrafico.qryVendasUltimaSemana.Active) then
        dtmGrafico.qryVendasUltimaSemana.Close;

        dtmGrafico.qryProdutoEstoque.open;
        dtmGrafico.qryVendaValorPorCliente.open;
        dtmGrafico.qryVendasMaiores.open;
        dtmGrafico.qryVendasUltimaSemana.open;
  finally
     screen.Cursor:=crDefault;
  end;
end;

end.
