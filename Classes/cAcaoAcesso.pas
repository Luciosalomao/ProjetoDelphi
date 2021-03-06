unit cAcaoAcesso;

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
    ZDataset,
    Vcl.Forms,
    Vcl.Buttons;

Type
   TAcaoAcesso = class

   private
      conexaoDB : TZConnection;
      F_acaoAcessoId : Integer;
      F_chave : String;
      F_descricao : String;

      class procedure PreencherAcoes(aForm : TForm; aConexao : TZConnection); static;
      class procedure VerificarUsuarioAcao(aUsuarioId, aAcaoAcessoId: Integer;
      aConexao: TZConnection); static;

   public
      constructor Create(aConexao : TZConnection);
      destructor Destroy; override;
      function Inserir : boolean;
      function Atualizar : boolean;
      function Apagar : boolean;
      function Selecionar(id : Integer): boolean;
      function ChaveExiste(aChave: string; aId: Integer=0): boolean;
      class procedure CriarAcoes(aNomeForm : TFormClass; aConexao : TZConnection); static;
      class procedure PreencherUsuariosVsAcoes(aConexao : TZConnection); static;

   published
      property  acaoAcessoId : integer read F_acaoAcessoId  write F_acaoAcessoId;
      property  descricao : string     read F_descricao     write F_descricao;
      property  chave : string         read F_chave         write F_chave;
end;


implementation

{ TAcaoAcesso }


{$region 'Constructor - Destructor'}
constructor TAcaoAcesso.Create(aConexao: TZConnection);
begin
   conexaoDB := aConexao;
end;

destructor TAcaoAcesso.Destroy;
begin

  inherited;
end;
{$endregion}

function TAcaoAcesso.ChaveExiste(aChave: string; aId: Integer): boolean;
var
  qry: TZQuery;
begin
    try
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('Select  count(acaoAcessoId) as qtde '+
                 ' from acaoAcesso ' +
                 ' where chave = :chave');

     if aId > 0 then
     begin
       qry.sql.Add(' And acaoAcessoId <> :acaoAcessoId');
       qry.ParamByName('acaoAcessoId').AsInteger := aId;
     end;

     qry.ParamByName('chave').AsString:=aChave;
    try
     qry.Open;

     if qry.FieldByName('qtde').AsInteger > 0 then
        result := true
     else
       result := false;
    except
       result := false;
    end;
    finally
       if Assigned(qry) then
         FreeAndNil(qry);
    end;
end;


class procedure TAcaoAcesso.CriarAcoes(aNomeForm: TFormClass;
  aConexao: TZConnection);
var
   form: TForm;

begin
   try
     form := aNomeForm.Create(Application);
     PreencherAcoes(form, aConexao);
   finally
     if Assigned(form) then
        form.Release;
   end;
end;

class procedure TAcaoAcesso.PreencherAcoes(aForm: TForm;
  aConexao: TZConnection);
var
    i : Integer;
    oAcaoAcesso : TAcaoAcesso;

begin
   try
      oAcaoAcesso := TAcaoAcesso.Create(aConexao);
      oAcaoAcesso.descricao := aForm.Caption;
      oAcaoAcesso.chave := aForm.Name;
      if not oAcaoAcesso.ChaveExiste(oAcaoAcesso.chave) then
          oAcaoAcesso.Inserir;

      for i := 0 to aForm.ComponentCount -1 do
      begin
      if (aForm.Components[i] is TBitBtn) then
          begin
             if (aForm.Components[i].tag = 99) then
             begin
                oAcaoAcesso.descricao := '     - BOT?O ' + StringReplace(TBitBtn(aForm.Components[i]).Caption,'&','',[rfReplaceAll]);
                oAcaoAcesso.chave := aForm.Name+'_'+ TBitBtn(aForm.Components[i]).Name;
                if not oAcaoAcesso.ChaveExiste(oAcaoAcesso.chave) then
                    oAcaoAcesso.Inserir;
             end;
          end;
      end;

   finally
      if Assigned(oAcaoAcesso) then
          FreeAndNil(oAcaoAcesso);
   end;

end;


function TAcaoAcesso.Apagar: boolean;
var
  qry: TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
               'C?digo: ' + IntToStr(F_acaoAcessoId)+#13+
                 'Descri??o: '+F_descricao, mtConfirmation,[mbYes, mbNo],0)=mrNo then
     begin
        Result:=false;
        abort;
     end;

  try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('Delete from acaoAcesso where ' +
                   'acaoAcessoId= :acaoAcessoId');
     qry.ParamByName('acaoAcessoId').AsInteger:=F_acaoAcessoId;
  try
     conexaoDB.StartTransaction;
     qry.ExecSQL;
     conexaoDB.Commit;
  Except
     conexaoDB.Rollback;
     Result:=False;
  end;
  finally
     if Assigned(qry) then
     FreeAndNil(qry);
  end;

end;

function TAcaoAcesso.Atualizar: boolean;
var
  qry: TZQuery;
begin
   try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('UPDATE acaoAcesso SET ' +
                 'descricao = :descricao, '+
                 'chave = :chave ' +
                 'WHERE acaoAcessoId = :acaoAcessoId');
     qry.ParamByName('acaoAcessoId').AsInteger         :=Self.F_acaoAcessoId;
     qry.ParamByName('descricao').AsString             :=Self.F_descricao;
     qry.ParamByName('chave').AsString                 :=Self.F_chave;

  try
     conexaoDB.StartTransaction;
     qry.ExecSQL;
     conexaoDB.Commit;
  Except
     conexaoDB.Rollback;
     Result:=False;
  end;
   finally
     if Assigned(qry) then
     FreeAndNil(qry);
   end;

end;

function TAcaoAcesso.Inserir: boolean;
var
  qry: TZQuery;
begin
   try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('INSERT INTO acaoAcesso (descricao, chave) '+
                 ' VALUES ( :descricao, :chave )' );
     qry.ParamByName('descricao').AsString               := Self.F_descricao;
     qry.ParamByName('chave').AsString                   := Self.F_chave;

    try
       conexaoDB.StartTransaction;
       qry.ExecSQL;
       conexaoDB.Commit;
    Except
       conexaoDB.Rollback;
       Result:=False;
    end;
   finally
     if Assigned(qry) then
     FreeAndNil(qry);
   end;

end;

function TAcaoAcesso.Selecionar(id: Integer): boolean;
var qry:TZQuery;
begin
    try
      Result:=true;
      qry:=TZQuery.Create(nil);
      qry.Connection:=conexaoDB;
      qry.SQL.Clear;
      qry.SQL.Add('Select  acaoAcessoId, descricao, chave '+
            ' from acaoAcesso where acaoAcessoId = :acaoAcessoId');
      qry.ParamByName('acaoAcessoId').AsInteger:=id;
      try
        qry.Open;

        Self.F_acaoAcessoId := qry.FieldByName('acaoAcessoId').AsInteger;
        Self.F_descricao    := qry.FieldByName('descricao').AsString;
        Self.F_chave        := qry.FieldByName('chave').AsString;
      Except
        Result := false;
      end;
    finally
       if Assigned(qry) then
       FreeAndNil(qry);
    end;

end;

class procedure TAcaoAcesso.VerificarUsuarioAcao(aUsuarioId,
  aAcaoAcessoId: Integer; aConexao: TZConnection);
var qry:TZQuery;
begin
      try
      qry:=TZQuery.Create(nil);
      qry.Connection:=aConexao;
      qry.SQL.Clear;
      qry.SQL.Add('Select  usuarioId '+
                  ' from usuariosAcaoAcesso '+
                  ' where usuarioId=:usuarioId '+
                  ' and acaoAcessoId =:acaoAcessoId');
      qry.ParamByName('usuarioId').AsInteger:=aUsuarioId;
      qry.ParamByName('acaoAcessoId').AsInteger:=aAcaoAcessoId;
      qry.Open;

      if qry.IsEmpty then
      begin
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('Insert into usuariosAcaoAcesso ( '+
                  ' usuarioId, acaoAcessoId, ativo ) '  +
                  ' values ( :usuarioId, :acaoAcessoId, :ativo )');
         qry.ParamByName('usuarioId').AsInteger := aUsuarioId;
         qry.ParamByName('acaoAcessoId').AsInteger := aAcaoAcessoId;
         qry.ParamByName('ativo').AsBoolean := true;
      try
        aConexao.StartTransaction;
        qry.ExecSQL;
        aConexao.Commit;
      except
        aConexao.Rollback;
      end;
      end;
      finally
      if Assigned(qry) then
           FreeAndNil(qry);
      end;
end;

class procedure TAcaoAcesso.PreencherUsuariosVsAcoes(aConexao: TZConnection);
var
  qry: TZQuery;
  qryAcaoAcesso: TZQuery;
begin
   try
     qry:=TZQuery.Create(nil);
     qry.Connection:=aConexao;
     qry.SQL.Clear;

     qryAcaoAcesso:=TZQuery.Create(nil);
     qryAcaoAcesso.Connection:=aConexao;
     qryAcaoAcesso.SQL.Clear;

     qry.SQL.add('select usuarioId from usuarios');
     qry.Open;

     qryAcaoAcesso.SQL.add('select acaoAcessoId from acaoAcesso');
     qryAcaoAcesso.Open;

     qry.First;
     while not qry.Eof do
        begin
          qryAcaoAcesso.First;

          while not qryAcaoAcesso.Eof do
             begin
               VerificarUsuarioAcao(qry.FieldByName('usuarioId').AsInteger,
               qryAcaoAcesso.FieldByName('acaoAcessoId').AsInteger, aConexao);
               qryAcaoAcesso.Next;
             end;
             qry.Next;
        end;

   finally
     if Assigned(qry) then
         FreeAndNil(qry);

     if Assigned(qryAcaoAcesso) then
         FreeAndNil(qryAcaoAcesso);
   end;

end;

end.
