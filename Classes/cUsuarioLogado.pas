unit cUsuarioLogado;

interface


uses
   System.Classes,
   Vcl.Controls,
   Vcl.Dialogs,
   ExtCtrls,
   ZAbstractConnection,
   ZConnection,
   ZAbstractRODataset,
   ZAbstractDataset,
   System.SysUtils,
   ZDataset;

Type
    TUsuarioLogado = class

 private
    F_usuarioId: Integer;
    F_nome: String;
    F_senha: String;
 public
    class function TenhoAcesso(aUsuarioId: integer; aChave: string;
      aConexao: TZConnection): boolean; static;

 published
    property codigo      :Integer    read F_usuarioId        write F_usuarioId;
    property nome        :string     read F_nome             write F_nome;
    property senha       :string     read F_senha            write F_senha;
 end;

 implementation

 class function TUsuarioLogado.TenhoAcesso(aUsuarioId: integer; aChave: string;
  aConexao: TZConnection): boolean;

var qry: TZQuery;

begin
   try
      Result := true;
      qry := TZQuery.Create(nil);
      qry.Connection := aConexao;
      qry.SQL.Clear;
      qry.SQL.Add('SELECT usuarioId ' +
                  ' FROM usuariosAcaoAcesso '+
                  ' WHERE usuarioId =:usuarioId ' +
                  ' AND acaoAcessoId = (SELECT TOP 1 acaoAcessoId FROM acaoAcesso WHERE chave=:chave) '+
                  ' AND ativo=1');
      qry.ParamByName('usuarioId').AsInteger   :=aUsuarioId;
      qry.ParamByName('chave').AsString        :=aChave;

      qry.Open;

      if qry.IsEmpty then
          Result:=false
   finally
      if Assigned(qry) then
          FreeAndNil(qry);
   end;

end;

end.
