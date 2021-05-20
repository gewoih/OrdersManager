unit ufEmailSender;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  Vcl.ComCtrls, smtpsend, mimemess, mimepart, blcksock, synachar, synautil,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdMessage;

type
  TForm2 = class(TForm)
    edRecipient: TEdit;
    edSubject: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btSendEmail: TButton;
    Label3: TLabel;
    Label4: TLabel;
    edSign: TEdit;
    Memo1: TMemo;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    procedure btSendEmailClick(Sender: TObject);
  private

  public

  end;

var
  	Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btSendEmailClick(Sender: TObject);
begin
    try
        IdSMTP1.Connect;
        if IdSMTP1.Connected then
        begin
        	IdMessage1.Recipients.EMailAddresses := edRecipient.Text;
        	IdMessage1.Subject := edSubject.Text;
            IdMessage1.Body.Text := Memo1.Text;
        	IdMessage1.From.Address := 'request@wtc.ru';
            IdMessage1.From.Name := edSign.Text;
            IdMessage1.ContentType:='text/plain; charset=windows-1251';
			IdMessage1.ContentTransferEncoding:='8bit';

            IdSMTP1.Send(IdMessage1);

            ShowMessage('Письмо успешно отправлено.');
        end
		else
        	raise Exception.Create('Ошибка соединения с сервером');
    finally
        ModalResult := mrOk;
    end;
end;

end.
