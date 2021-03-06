unit uUsuarioVsAcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, uDM, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmUsuarioVsAcoes = class(Tform)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    grdUsuarios: TDBGrid;
    grdAcoes: TDBGrid;
    qryUsuario: TZQuery;
    qryUsuariosAcaoAcess: TZQuery;
    dtsUsuario: TDataSource;
    dtsUsuariosAcaoAcess: TDataSource;
    qryUsuariousuarioId: TIntegerField;
    qryUsuarionome: TWideStringField;
    qryUsuariosAcaoAcessdescricao: TWideStringField;
    qryUsuariosAcaoAcessusuarioId: TIntegerField;
    qryUsuariosAcaoAcessacaoAcessoId: TIntegerField;
    qryUsuariosAcaoAcessativo: TBooleanField;
    btnFechar: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure qryUsuarioAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure grdAcoesDblClick(Sender: TObject);
    procedure grdAcoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure SelecionarAcoesAcessoPorUsuario;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuarioVsAcoes: TfrmUsuarioVsAcoes;

implementation

{$R *.dfm}

procedure TfrmUsuarioVsAcoes.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmUsuarioVsAcoes.grdAcoesDblClick(Sender: TObject);
var qry:TZQuery;
    bmRegistroAtual:TBookmark;
begin
   try
   bmRegistroAtual := qryUsuariosAcaoAcess.GetBookmark; //Marcar o registro Selecionado
   qry:=TZQuery.Create(nil);
   qry.Connection:=dmConexao.conexaoDB;
   qry.SQL.Clear;
   qry.SQL.Add('update usuariosAcaoAcesso ' +
               ' set ativo=:ativo ' +
               ' where usuarioId=:usuarioId '+
               ' and acaoAcessoId=:acaoAcessoId ');
   qry.ParamByName('usuarioId').AsInteger := qryUsuariosAcaoAcess.FieldByName('usuarioId').AsInteger;
   qry.ParamByName('acaoAcessoId').AsInteger := qryUsuariosAcaoAcess.FieldByName('acaoAcessoId').AsInteger;
   qry.ParamByName('ativo').AsBoolean := not qryUsuariosAcaoAcess.FieldByName('ativo').AsBoolean;
   try
     dmConexao.conexaoDB.StartTransaction;
     qry.ExecSQL;
     dmConexao.conexaoDB.Commit;
   except
     dmConexao.conexaoDB.Rollback;
   end;

   finally
      SelecionarAcoesAcessoPorUsuario;
      qryUsuariosAcaoAcess.GotoBookmark(bmRegistroAtual);  //Faz o retorno do registro dep
      if Assigned(qry) then
         FreeAndNil(qry);
   end;
end;

procedure TfrmUsuarioVsAcoes.grdAcoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if not qryUsuariosAcaoAcess.FieldByName('ativo').AsBoolean then
   begin
      TDBGrid(Sender).Canvas.Font.Color := clWhite;
      TDBGrid(Sender).Canvas.Brush.Color := clRed;
   end;
   TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[datacol].Field, State);
end;

procedure TfrmUsuarioVsAcoes.FormShow(Sender: TObject);
begin
   try
     qryUsuario.DisableControls;
     qryUsuario.open;
     SelecionarAcoesAcessoPorUsuario;
   finally
     qryUsuario.EnableControls;
   end;
end;

procedure TfrmUsuarioVsAcoes.qryUsuarioAfterScroll(DataSet: TDataSet);
begin
   SelecionarAcoesAcessoPorUsuario;
end;

procedure TfrmUsuarioVsAcoes.SelecionarAcoesAcessoPorUsuario;
begin
   qryUsuariosAcaoAcess.Close;
   qryUsuariosAcaoAcess.ParamByName('usuarioId').AsInteger := qryUsuario.FieldByName('usuarioId').AsInteger;
   qryUsuariosAcaoAcess.Open;
end;

end.
