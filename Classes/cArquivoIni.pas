unit cArquivoIni;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  System.SysUtils,
  System.IniFiles,
  Vcl.Forms;


type
   TArquivoIni = class

   private

   public
      class function ArquivoIni : string; static;
      class function LerIni(aSecao : string; aEntrada : string) : string; static;
      class procedure AtualizarIni(aSecao, aEntrada, aValor : string); static;

end;


implementation

{ TArquivoIni }

class function TArquivoIni.ArquivoIni: string;
begin
   result := ChangeFileExt( Application.ExeName, '.INI' ); //pega o nome do execut?vel e coloca a extens?o ini
end;

class procedure TArquivoIni.AtualizarIni(aSecao, aEntrada, aValor: string);
var
   ini: TIniFile;
begin
   try
     ini := TIniFile.Create(ArquivoIni);
     ini.WriteString( aSecao, aEntrada, aValor );
   finally

   end;
end;

class function TArquivoIni.LerIni(aSecao, aEntrada: string): string;
var
   ini: TIniFile;
begin
   try
     ini := TIniFile.Create(ArquivoIni);
     result := ini.ReadString( aSecao, aEntrada, 'N?o Encontrado' );
   finally
     ini.Free;
   end;

end;

end.
