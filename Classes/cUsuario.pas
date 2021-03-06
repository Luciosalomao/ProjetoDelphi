unit cUsuario;

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
   uFuncaoCriptografia;

 Type
    TUsuario = class
 private
   conexaoDB : TZConnection;
   F_UsuarioId : integer;
   F_Nome: string;
   F_Senha: string;
   function getSenha: String;
   procedure setSenha(const Value: String);


 public
   constructor Create(aConexao: TZConnection);
   destructor Destroy; override;
   function Inserir: boolean;
   function Atualizar: boolean;
   function Apagar: boolean;
   function Selecionar(id: integer): boolean;
   function Logar(aUsuario, aSenha: String): Boolean;
   function UsuarioExiste(aUsuario: String): Boolean;
   function AlterarSenha: Boolean;

 published
   property UsuarioId: integer read    F_UsuarioId     write F_UsuarioId;
   property Nome: string       read    F_Nome          write F_Nome;
   property Senha: string      read    getSenha        write setSenha;
   
 end;
implementation


{$region 'Constructor e Destructor'}
constructor TUsuario.Create(aConexao: TZConnection);
begin
  conexaoDB:=aConexao;
end;

destructor TUsuario.Destroy;
begin

  inherited;
end;
{$endregion}

{$region 'CRUDS'}
function TUsuario.Apagar: boolean;
var qry: TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
             'C?digo: ' + IntToStr(F_UsuarioId)+#13+
               'Descri??o: '+F_Nome, mtConfirmation,[mbYes, mbNo],0)=mrNo then
   begin
      Result:=false;
      abort;
   end;

   try
       Result:=true;
       qry:=TZQuery.Create(nil);
       qry.Connection := conexaoDB;
       qry.SQL.Clear;
       qry.SQL.Add('Delete from usuarios where ' +
                   'usuarioId = :usuarioId');
       qry.ParamByName('usuarioId').AsInteger:=F_UsuarioId;

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

function TUsuario.Atualizar: boolean;
var
  qry: TZQuery;
begin
  try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('UPDATE usuarios '+
                 ' SET nome = :nome, '+
                 ' senha = :senha '+
                 ' WHERE usuarioId = :usuarioId ');
     qry.ParamByName('usuarioId').AsInteger         :=Self.F_UsuarioId;
     qry.ParamByName('nome').AsString               :=Self.F_Nome;
     qry.ParamByName('senha').AsString              :=Self.F_Senha;
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

function TUsuario.Inserir: boolean;
var
  qry: TZQuery;
begin
  try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('Insert into usuarios (nome, senha) values (:nome, :senha)' );
     qry.ParamByName('nome').AsString               := Self.F_nome;
     qry.ParamByName('senha').AsString              := Self.F_Senha;

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

function TUsuario.Selecionar(id: integer): boolean;
var
    qry: TZQuery;
  begin
    try
      Result:=true;
      qry:=TZQuery.Create(nil);
      qry.Connection:=conexaoDB;
      qry.SQL.Clear;
      qry.SQL.Add('Select usuarioId, nome, senha from usuarios where usuarioId=:usuarioId');
      qry.ParamByName('usuarioId').AsInteger:=id;
      try
        qry.Open;
        Self.F_UsuarioId             := qry.FieldByName('usuarioId').AsInteger;
        Self.F_Nome                  := qry.FieldByName('nome').AsString;
        Self.F_Senha                 := qry.FieldByName('senha').AsString;

      Except
        Result:=false;
      end;
    finally
      if Assigned(qry) then
        FreeAndNil(qry);
    end;

end;

{$endregion}


{$region 'GETS e SETS'}

function TUsuario.getSenha: String;
begin
   Result := Descriptografar(Self.F_Senha);
end;

procedure TUsuario.setSenha(const Value: String);
begin
   Self.F_Senha := Criptografar(Value);
end;

{$endregion}


{$region 'Logar'}
function TUsuario.Logar(aUsuario: String; aSenha:String): Boolean;
var qry: TZQuery;
begin
   try
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('SELECT usuarioId, ' +
                 ' nome, ' +
                 ' senha ' +
                 ' FROM usuarios ' +
                 ' WHERE nome=:nome AND senha=:senha ');
     qry.ParamByName('nome').AsString:=aUsuario;
     qry.ParamByName('senha').AsString:=Criptografar(aSenha);
     try
        qry.Open;
        if (qry.FieldByName('usuarioId').AsInteger > 0) then
        begin
             F_UsuarioId := qry.FieldByName('usuarioId').AsInteger;
             F_Nome := qry.FieldByName('nome').AsString;
             F_Senha := qry.FieldByName('senha').AsString;
             result := true;
        end
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

function TUsuario.UsuarioExiste(aUsuario: String): Boolean;
var qry: TZQuery;
begin
   try
      qry:=TZQuery.Create(nil);
      qry.Connection:=conexaoDB;
      qry.SQL.Clear;
      qry.SQL.Add('SELECT COUNT(usuarioId) AS Qtde ' +
           ' FROM usuarios ' +
           ' WHERE nome=:nome ');
      qry.ParamByName('nome').AsString:=aUsuario;
   try
      qry.Open;
      if qry.FieldByName('Qtde').AsInteger > 0 then
         result := true
      else
         result := false
   except
         result := false;
   end;
   finally
       if Assigned(qry) then
          FreeAndNil(qry);
   end;
end;

function TUsuario.AlterarSenha: Boolean;
var qry: TZQuery;
begin
   try
      result := true;
      qry:=TZQuery.Create(nil);
      qry.Connection:=conexaoDB;
      qry.SQL.Clear;
      qry.SQL.Add('UPDATE usuarios SET senha = :senha ' +
           ' WHERE usuarioId = :usuarioId ');
      qry.ParamByName('usuarioId').AsInteger:=Self.F_UsuarioId;
      qry.ParamByName('senha').AsString:=Self.F_Senha;
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

{$endregion}
end.
