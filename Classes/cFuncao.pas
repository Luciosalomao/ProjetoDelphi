unit cFuncao;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  ZAbstractConnection,
  ZConnection,
  ZAbstractRODataset,
  ZAbstractDataset,
  ZDataset,
  System.SysUtils,
  Vcl.Forms,
  Vcl.Buttons,
  cAcaoAcesso,
  cUsuarioLogado,
  RLReport;

Type
   TFuncao = class

 private

 public
   class procedure CriarForm(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aConexao: TZConnection); static;
   class procedure CriarRelatorio(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aConexao: TZConnection); static;
 end;

implementation

{ TFuncao }

class procedure TFuncao.CriarForm(aNomeForm: TFormClass;
  oUsuarioLogado: TUsuarioLogado; aConexao: TZConnection);
var form: TForm;
begin
  try
      form := aNomeForm.Create(Application);
      if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, form.Name,  aConexao) then
          begin
            form.ShowModal;
          end
      else
          begin
            MessageDlg('Usu?rio: ' + oUsuarioLogado.nome + ' N?o tem permiss?o de Acesso', mtWarning, [mbOK],0);
          end;
  finally
  if Assigned(form) then
     form.Release;
end;
end;

class procedure TFuncao.CriarRelatorio(aNomeForm: TFormClass;
  oUsuarioLogado: TUsuarioLogado; aConexao: TZConnection);
var form: TForm;
    aRelatorio: TRLReport;
    i: Integer;
begin
   try
     form := aNomeForm.Create(Application);
     if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, form.Name, aConexao) then
       begin
       for i := 0 to form.ComponentCount - 1 do
         begin
            if form.Components[i] is TRLReport then
            begin
              TRLReport(form.Components[i]).previewModal;
              break;
            end;
         end;
       end
     else
     begin
        MessageDlg('Usu?rio: '+oUsuarioLogado.nome +' N?o tem permiss?o', mtWarning, [mbOK],0);
     end;
   finally
     if Assigned(form) then
        form.Release;
   end;
end;
end.
