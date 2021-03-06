unit uSelecionarData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, System.DateUtils,
  RxToolEdit;

type
  TfrmSelecionarData = class(TForm)
    edtDataFinal: TDateEdit;
    lblDataInicio: TLabel;
    Label1: TLabel;
    edtDataInicio: TDateEdit;
    btnConfirmar: TBitBtn;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionarData: TfrmSelecionarData;

implementation

{$R *.dfm}

procedure TfrmSelecionarData.btnConfirmarClick(Sender: TObject);
begin
   if (edtDataInicio.Date) > (edtDataFinal.Date) then
   begin
     MessageDlg('Data Inicial n?o pode ser maior que a data final', mtInformation, [mbOk], 0);
     edtDataFinal.SetFocus;
     abort;
   end;

   if (edtDataInicio.Date=0) OR (edtDataFinal.Date=0) then
   begin
     MessageDlg('Data final ou inicial ? campo obrigat?rio', mtInformation, [mbOk], 0);
     edtDataInicio.SetFocus;
     abort;
   end;

   frmSelecionarData.Close;
end;

procedure TfrmSelecionarData.FormShow(Sender: TObject);
begin
   edtDataInicio.Date := StartOfTheMonth(Date);
   edtDataFinal.Date :=  EndOfTheMonth(Date);
end;

end.
