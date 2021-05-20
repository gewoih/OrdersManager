program XTrade.OrdersManager;

uses
  Vcl.Forms,
  ufMainForm in 'ufMainForm.pas' {Form1},
  fxLogin in 'fxLogin.pas' {fLogin},
  uxUpdater in 'uxUpdater.pas',
  ufEmailSender in 'ufEmailSender.pas' {Form2};

{$R *.res}

begin
    if DoLogin and CheckVersion then
    begin
        Application.Initialize;
        Application.MainFormOnTaskbar := True;
        Application.CreateForm(TForm1, Form1);
  		Application.CreateForm(TForm2, Form2);
  		Application.Run;
    end;
end.
