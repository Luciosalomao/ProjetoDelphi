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
  cControleEstoque in 'Classes\cControleEstoque.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
