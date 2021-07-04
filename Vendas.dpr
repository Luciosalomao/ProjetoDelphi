program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {dmConexao: TDataModule},
  uTelaHeranca in 'Heranca\uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategorias in 'Cadastro\uCadCategorias.pas' {frmCadCategoria},
  Enter in 'terceiros\Enter.pas',
  uEnum in 'Heranca\uEnum.pas',
  uCadCategoria in 'Classes\uCadCategoria.pas',
  uTelaDeCliente in 'uTelaDeCliente.pas' {frmTelaDeCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmTelaDeCliente, frmTelaDeCliente);
  Application.Run;
end.
