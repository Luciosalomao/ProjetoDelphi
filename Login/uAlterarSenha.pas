unit uAlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, uDM;

type
  TfrmMudarSenha = class(TForm)
    lblSenha: TLabel;
    edtSenhaAtual: TEdit;
    btnFechar: TBitBtn;
    btnAlterar: TBitBtn;
    Label1: TLabel;
    edtNovaSenha: TEdit;
    edtConfirmarSenha: TEdit;
    Label2: TLabel;
    lblUsuario: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    procedure LimparEdits;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMudarSenha: TfrmMudarSenha;

implementation

{$R *.dfm}
uses cUsuario,  uPrincipal;

procedure TfrmMudarSenha.btnAlterarClick(Sender: TObject);
var oUsuario: TUsuario;
begin
   if (edtSenhaAtual.Text = oUsuarioLogado.senha) then
   begin
     if (edtNovaSenha.Text = edtConfirmarSenha.Text) then
     begin
       try
         oUsuario:=TUsuario.Create(dmConexao.conexaoDB);
         oUsuario.UsuarioId := oUsuarioLogado.codigo;
         oUsuario.Senha := edtNovaSenha.Text;
         oUsuario.AlterarSenha;
         oUsuarioLogado.senha := edtNovaSenha.Text;
         MessageDlg('Senha Alterada.', mtInformation, [mbOk], 0);
         LimparEdits;
       finally
          FreeAndNil(oUsuario);
       end;
     end
     else
     begin
       MessageDlg('Senha digitadas n?o coincidem.', mtInformation, [mbOk], 0);
       edtNovaSenha.SetFocus;
     end;
     end
     else
     begin
      MessageDlg('Senha Atual est? inv?lida.', mtInformation, [mbOk], 0);
     end;
end;

procedure TfrmMudarSenha.btnFecharClick(Sender: TObject);
begin
   close;
end;

procedure TfrmMudarSenha.FormShow(Sender: TObject);
begin
   LimparEdits;
   lblUsuario.Caption:=oUsuarioLogado.nome;
end;

procedure TfrmMudarSenha.LimparEdits;
begin
    edtSenhaAtual.clear;
    edtNovaSenha.clear;
    edtConfirmarSenha.clear;
end;

end.
