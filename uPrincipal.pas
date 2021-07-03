unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDM, Enter;

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
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TeclaEnter: TMREnter; //Código que troca o tab pelo enter e muda a cor - componente de terceiro
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategorias;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
  frmCadCategoria:=TfrmCadCategoria.create(self);
  frmCadCategoria.showModal;
  frmCadCategoria.release;  {Destroi o componente}
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {Destruindo os componentes}
  FreeAndNil(dmConexao);
  FreeAndNil(TeclaEnter);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  dmConexao:= TdmConexao.Create(Self);     //cria o formulario
 { dmConexao.conexaoDB.SQLHourGlass:=true;  //muda a ampulheta
  dmConexao.conexaoDB.Protocol:='mssql';
  dmConexao.conexaoDB.LibraryLocation:='C:\ProjetoDelphi\ntwdblib.dll';
  dmConexao.conexaoDB.HostName:='localhost\SQL2017EL';
  dmConexao.conexaoDB.Port:=1433;
  dmConexao.conexaoDB.User:='sa';
  dmConexao.conexaoDB.Password:='cidadao';
  dmconexao.conexaoDB.Database:='Vendas';
  dmConexao.conexaoDB.Connected:=true;   //cria o banco  }

  with dmConexao.conexaoDB do begin    //O with é usado para evitar repetição de código
    SQLHourGlass:=true;  //muda a ampulheta
    Protocol:='mssql';
    LibraryLocation:='C:\ProjetoDelphi\ntwdblib.dll';
    HostName:='localhost\SQL2017EL';
    Port:=1433;
    User:='sa';
    Password:='cidadao';
    Database:='Vendas';
    Connected:=true;   //cria o banco
  end;

  TeclaEnter:= TMREnter.Create(Self);
  TeclaEnter.FocusEnabled:=true;
  TeclaEnter.FocusColor:=clInfoBk;
end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
Application.Terminate;
end;

end.
