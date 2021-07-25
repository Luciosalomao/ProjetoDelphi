unit cCadCliente;

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
    TCliente = class
 private
    conexaoDB: TZConnection;
    F_ClienteId: integer;
    F_Nome: string;
    F_Endereco: string;
    F_Cidade: string;
    F_Bairro: string;
    F_CEP: string;
    F_Telefone: string;
    F_Email: string;
    F_DataDeNascimento: TDateTime;
    function getBairro: string;
    function getCEP: string;
    function getCidade: string;
    function getClienteId: integer;
    function getDataDeNascimento: TDateTime;
    function getEmail: string;
    function getEndereco: string;
    function getTelefone: string;
    procedure setBairro(const Value: string);
    procedure setCEP(const Value: string);
    procedure setCidade(const Value: string);
    procedure setClienteId(const Value: integer);
    procedure setDataDeNascimento(const Value: TDateTime);
    procedure setEmail(const Value: string);
    procedure setEndereco(const Value: string);
    procedure setTelefone(const Value: string);
    function getNome: string;
    procedure setNome(const Value: string);


 public
   constructor Create(aConexao: TZConnection);
   destructor Destroy; override;
   function Inserir: boolean;
   function Apagar: boolean;
   function Atualizar: boolean;
   function Selecionar(id: integer): boolean;

 published
   property ClienteId: integer read getClienteId write setClienteId;
   property Nome: string read getNome write setNome;
   property Endereco: string read getEndereco write setEndereco;
   property Cidade: string read getCidade write setCidade;
   property Bairro: string read getBairro write setBairro;
   property CEP: string read getCEP write setCEP;
   property Telefone: string read getTelefone write setTelefone;
   property Email: string read getEmail write setEmail;
   property DataDeNascimento: TDateTime read getDataDeNascimento write setDataDeNascimento;

 end;

implementation

{$region 'Constructor e Destructor'}
constructor TCliente.Create(aConexao: TZConnection);
begin
   conexaoDB:=aConexao;
end;

destructor TCliente.Destroy;
begin
  inherited;
end;

{$endregion}

{$region 'CRUDS'}
function TCliente.Apagar: boolean;
  var
    qry: TZQuery;
  begin
     if MessageDlg('Apagar o Registro: '+#13+#13+
                   'Código: ' + IntToStr(F_ClienteId)+#13+
                     'Descrição: '+F_Nome, mtConfirmation,[mbYes, mbNo],0)=mrNo then
       begin
          Result:=false;
          abort;
       end;

     try
       Result:=true;
       qry:=TZQuery.Create(nil);
       qry.Connection:=conexaoDB;
       qry.SQL.Clear;
       qry.SQL.Add('Delete from clientes where ' +
                   'clienteId = :ClienteId');
       qry.ParamByName('ClienteId').AsInteger:=F_ClienteId;
     try
       qry.ExecSQL;
     Except
       Result:=False;
     end;
     finally
       if Assigned(qry) then
       FreeAndNil(qry);
     end;

  end;

function TCliente.Atualizar: boolean;
var
  qry: TZQuery;
begin
  try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('UPDATE clientes '+
                 ' SET nome = :nome, '+
                 ' endereco = :endereco, '+
                 ' cidade = :cidade, '+
                 ' bairro = :bairro, '+
                 ' cep = :cep, '+
                 ' telefone = :telefone, '+
                 ' email = :email, '+
                 ' datadenascimento = :datadenascimento ' +
                 ' WHERE clienteId = :clienteId ');
     qry.ParamByName('clienteId').AsInteger         :=Self.F_ClienteId;
     qry.ParamByName('nome').AsString               :=Self.F_nome;
     qry.ParamByName('endereco').AsString           :=Self.F_endereco;
     qry.ParamByName('cidade').AsString             :=Self.F_cidade;
     qry.ParamByName('bairro').AsString             :=Self.F_bairro;
     qry.ParamByName('cep').AsString                :=Self.F_cep;
     qry.ParamByName('telefone').AsString           :=Self.F_telefone;
     qry.ParamByName('email').AsString              :=Self.F_email;
     qry.ParamByName('datadenascimento').AsDateTime :=Self.F_datadenascimento;

     try
       qry.ExecSQL;
     Except
       Result:=False;
     end;
     finally
     if Assigned(qry) then
     FreeAndNil(qry);
  end;
end;

function TCliente.Selecionar(id: integer): boolean;
var
    qry: TZQuery;
  begin
    try
      Result:=true;
      qry:=TZQuery.Create(nil);
      qry.Connection:=conexaoDB;
      qry.SQL.Clear;
      qry.SQL.Add('Select clienteId, ' +
                  '       nome, ' +
                  '       endereco, ' +
                  '       cidade, ' +
                  '       bairro, ' +
                  '       cep, ' +
                  '       telefone, ' +
                  '       email, ' +
                  '       datadenascimento ' +
                  ' from clientes ' +
                  ' where clienteId = :clienteId');
      qry.ParamByName('clienteId').AsInteger:=id;
      try
        qry.Open;
        Self.F_ClienteId              := qry.FieldByName('clienteId').AsInteger;
        Self.F_Nome                   := qry.FieldByName('nome').AsString;
        Self.F_Endereco               := qry.FieldByName('endereco').AsString;
        Self.F_Cidade                 := qry.FieldByName('cidade').AsString;
        Self.F_Bairro                 := qry.FieldByName('bairro').AsString;
        Self.F_CEP                    := qry.FieldByName('cep').AsString;
        Self.F_Telefone               := qry.FieldByName('telefone').AsString;
        Self.F_Email                  := qry.FieldByName('email').AsString;
        Self.F_DataDeNascimento       := qry.FieldByName('datadenascimento').AsDateTime;
      Except
        Result:=false;
      end;
    finally
      if Assigned(qry) then
        FreeAndNil(qry);
    end;

end;

function TCliente.Inserir: boolean;
var
  qry: TZQuery;
begin
  try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=conexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('Insert into clientes (nome, ' +
                 '                      endereco, ' +
                 '                      cidade, ' +
                 '                      bairro, ' +
                 '                      cep, ' +
                 '                      telefone, ' +
                 '                      email, ' +
                 '                      datadenascimento) '+
                 ' values               (:nome, ' +
                 '                      :endereco, ' +
                 '                      :cidade, ' +
                 '                      :bairro, ' +
                 '                      :cep, ' +
                 '                      :telefone, ' +
                 '                      :email, ' +
                 '                      :datadenascimento)' );
     qry.ParamByName('nome').AsString               := Self.F_nome;
     qry.ParamByName('endereco').AsString           := Self.F_endereco;
     qry.ParamByName('cidade').AsString             := Self.F_cidade;
     qry.ParamByName('bairro').AsString             := Self.F_bairro;
     qry.ParamByName('cep').AsString                := Self.F_cep;
     qry.ParamByName('telefone').AsString           := Self.F_telefone;
     qry.ParamByName('email').AsString              := Self.F_email;
     qry.ParamByName('datadenascimento').AsDateTime := Self.F_datadenascimento;

     try
       qry.ExecSQL;
     Except
       Result:=False;
     end;
     finally
     if Assigned(qry) then
     FreeAndNil(qry);
  end;
end;

{$endregion}

{$region 'Gets e Sets'}

procedure TCliente.setBairro(const Value: string);
begin
  Self.F_Bairro:=Value;
end;

function TCliente.getBairro: string;
begin
  Result:= Self.F_Bairro;
end;

function TCliente.getCEP: string;
begin
  Result:= Self.F_CEP;
end;

function TCliente.getCidade: string;
begin
  Result:= Self.F_Cidade;
end;

function TCliente.getClienteId: integer;
begin
  Result:= Self.F_ClienteId;
end;

function TCliente.getDataDeNascimento: TDateTime;
begin
  Result:= Self.F_DataDeNascimento;
end;

function TCliente.getEmail: string;
begin
   Result:= Self.F_Email;
end;

function TCliente.getEndereco: string;
begin
   Result:= Self.F_Endereco;
end;

function TCliente.getNome: string;
begin
   Result:= Self.F_Nome;
end;

function TCliente.getTelefone: string;
begin
   Result:= Self.F_Telefone;
end;

procedure TCliente.setCEP(const Value: string);
begin
   Self.F_CEP:=Value;
end;

procedure TCliente.setCidade(const Value: string);
begin
   Self.F_Cidade:=Value;
end;

procedure TCliente.setClienteId(const Value: integer);
begin
   Self.F_ClienteId:=Value;
end;

procedure TCliente.setDataDeNascimento(const Value: TDateTime);
begin
   Self.F_DataDeNascimento:=Value;
end;

procedure TCliente.setEmail(const Value: string);
begin
   Self.F_Email:=Value;
end;

procedure TCliente.setEndereco(const Value: string);
begin
   Self.F_Endereco:=Value;
end;

procedure TCliente.setNome(const Value: string);
begin
   Self.F_Nome:=Value;
end;

procedure TCliente.setTelefone(const Value: string);
begin
   Self.F_Telefone:=Value;
end;

{$endregion}

end.
