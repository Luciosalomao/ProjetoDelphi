unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, uDM;

type
  TfrmLogin = class(TForm)
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnFechar: TBitBtn;
    btnAcessar: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
  private
    { Private declarations }
    bFechar: Boolean;
    procedure FecharAplicacao;
    procedure FecharFormulario;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses cUsuario, uPrincipal;

{$R *.dfm}

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  FecharAplicacao;  //Termina a aplica??o
end;

procedure TfrmLogin.btnAcessarClick(Sender: TObject);
var
   oUsuario : TUsuario;
begin
   try
      oUsuario:=TUsuario.Create(dmConexao.conexaoDB);
      if oUsuario.Logar(edtUsuario.Text, edtSenha.Text) then
      begin
         oUsuarioLogado.codigo := oUsuario.UsuarioId;
         oUsuarioLogado.nome := oUsuario.Nome;
         oUsuarioLogado.senha := oUsuario.Senha;
         FecharFormulario;     //Fecha o login
      end
      else
      begin
         MessageDlg('Usu?rio ou Senha Inv?lido', mtInformation, [mbOK],0);
         edtUsuario.SetFocus;
      end;

   finally
      if Assigned(oUsuario)  then
          FreeAndNil(oUsuario);
   end;
end;

procedure TfrmLogin.FecharAplicacao;
begin
  bFechar := true;
  Application.Terminate;
end;

procedure TfrmLogin.FecharFormulario;
begin
  bFechar := true;
  close;
end;

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose:=bFechar;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
   bFechar:=false;
end;

end.
