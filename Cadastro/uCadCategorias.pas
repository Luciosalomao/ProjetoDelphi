unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  uCadCategoria, Vcl.ComCtrls, uDM, uEnum;

type
  TfrmCadCategoria = class(TfrmTelaHeranca)
    qryListagemcategoriaId: TIntegerField;
    qryListagemdescricao: TWideStringField;
    qryListagemstatus: TBooleanField;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    oCategoria: TCategoria;
    function Excluir:Boolean; override; //m�todo virtual
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}
{$region 'Override'}
function TfrmCadCategoria.Excluir: Boolean;
begin
  Result:= oCategoria.Apagar;
end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
   if (EstadoDoCadastro=ecInserir) then
     Result:=oCategoria.Gravar
   else if (EstadoDoCadastro=ecAlterar) then
     Result:=oCategoria.Atualizar;
end;
{$endregion}

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then   //Verifica se existe o objeto
     FreeAndNil(oCategoria);     //Apaga o objeto da mem�ria
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  oCategoria:=TCategoria.Create(dmConexao.conexaoDB);
  indiceAtual:='descricao';
end;
end.