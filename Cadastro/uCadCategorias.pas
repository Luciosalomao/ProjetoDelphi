unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uTelaHeranca, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, cCadCategoria, Vcl.ComCtrls, uDM, uEnum;

type
  TfrmCadCategoria = class(TfrmTelaHeranca)
    qryListagemcategoriaId: TIntegerField;
    qryListagemdescricao: TWideStringField;
    qryListagemstatus: TBooleanField;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure grdListagemTitleClick(Column: TColumn);
  private
    { Private declarations }
    oCategoria: TCategoria; //Criado com a unit uCadCategoria
    function Excluir:Boolean; override; //método virtual
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}
{$region 'Override'}
procedure TfrmCadCategoria.btnAlterarClick(Sender: TObject);
begin
  if oCategoria.Selecionar(qryListagem.FieldByName('categoriaId').AsInteger) then
  begin
    edtCategoriaId.Text:=IntToStr(oCategoria.codigo);
    edtDescricao.Text:=oCategoria.descricao;
  end
  else
  begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;

end;

function TfrmCadCategoria.Excluir: Boolean;
begin
  if oCategoria.Selecionar(qryListagem.FieldByName('categoriaId').AsInteger) then
  begin
      Result:= oCategoria.Apagar;
  end
  else
  begin
     btnCancelar.Click;
     Abort;
  end;

end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
   if(edtCategoriaId.Text<>EmptyStr)then
      oCategoria.codigo:=StrToInt(edtCategoriaId.Text)
      else
      oCategoria.codigo:=0;
      oCategoria.descricao:=edtDescricao.Text;

   if (EstadoDoCadastro=ecInserir) then
     Result:=oCategoria.Inserir
   else if (EstadoDoCadastro=ecAlterar) then
     Result:= oCategoria.Atualizar;
end;

procedure TfrmCadCategoria.grdListagemTitleClick(Column: TColumn);
begin
  inherited;

end;

{$endregion}

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then   //Verifica se existe o objeto
     FreeAndNil(oCategoria);     //Apaga o objeto da memória
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  oCategoria:=TCategoria.Create(dmConexao.conexaoDB);
  indiceAtual:='descricao';
end;
end.
