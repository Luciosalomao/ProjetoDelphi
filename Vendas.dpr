program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {dmConexao: TDataModule},
  uTelaHeranca in 'Heranca\uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategorias in 'Cadastro\uCadCategorias.pas' {frmCadCategoria},
  Enter in 'terceiros\Enter.pas',
  uEnum in 'Heranca\uEnum.pas',
  uTelaDeCliente in 'uTelaDeCliente.pas' {frmTelaDeCliente},
  uTelaDeProduto in 'uTelaDeProduto.pas' {frmTelaProdutos},
  cCadProduto in 'Classes\cCadProduto.pas',
  cCadCliente in 'Classes\cCadCliente.pas',
  cCadCategoria in 'Classes\cCadCategoria.pas',
  ufrmAtualizaDB in 'Atualizador\ufrmAtualizaDB.pas' {frmAtualizaDB},
  uDtmVendas in 'uDtmVendas.pas' {dtmVendas: TDataModule},
  uProVendas in 'Processo\uProVendas.pas' {frmProVendas},
  cProdVenda in 'Classes\cProdVenda.pas',
  cControleEstoque in 'Classes\cControleEstoque.pas',
  uRelCategoria in 'Relatorios\uRelCategoria.pas' {frmRelCategoria},
  uRelCadCliente in 'Relatorios\uRelCadCliente.pas' {frmRelCadCliente},
  uRelCadClienteFicha in 'Relatorios\uRelCadClienteFicha.pas' {frmRelCadClienteFicha},
  uRelCadProduto in 'Relatorios\uRelCadProduto.pas' {frmRelCadProduto},
  uRelProdutoCategoria in 'uRelProdutoCategoria.pas' {frmRelProdutoCategoria},
  uSelecionarData in 'Relatorios\uSelecionarData.pas' {frmSelecionarData},
  uRelVendaPorData in 'Relatorios\uRelVendaPorData.pas' {frmRelVendaPorData},
  uRelProVenda in 'Relatorios\uRelProVenda.pas' {frmRelProVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
