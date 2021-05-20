unit fxLogin;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Buttons, TFlatButtonUnit,
  TFlatEditUnit, TFlatComboBoxUnit;

type
  TfLogin = class(TForm)
    Bevel1: TBevel;
    Image1: TImage;
    btCancel: TFlatButton;
    btOK: TFlatButton;
    edUser: TFlatComboBox;
    edPass: TFlatEdit;
    pnError: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure edPassKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edUserChange(Sender: TObject);
  private
    procedure CheckUser;
  public
  end;

function DoLogin: boolean;

implementation

{$R *.dfm}

uses
  uxADO,
  uxParams;

function DoLogin: boolean;
begin
	with TFLogin.Create(nil) do
    try
		Result := (ShowModal = mrOK);
    finally
        Free;
    end;
end;

procedure TfLogin.btOKClick(Sender: TObject);
begin
	CheckUser;
end;

procedure TfLogin.CheckUser;
var R: OleVariant;
begin
  NewRec(R);
  fCon.CheckUser(edUser.Tag, edUser.Text, edPass.Text, R);
  if AsInt(R, 1) = 1 then
  begin
    fParams.AsInt['userid'] := AsInt(R, 0);
    fParams.AsStr['user'] := edUser.Text;
    ModalResult := 1;
    pnError.Visible := False;
  end
  else
  begin
    pnError.Visible := True;
  end;
end;

procedure TfLogin.edPassKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=VK_RETURN then CheckUser;
end;

procedure TfLogin.edUserChange(Sender: TObject);
begin
  edUser.Tag := 0;
end;

procedure TfLogin.FormCreate(Sender: TObject);
var R: OleVariant;
begin
  NewRec(R);
  fCon.GetUserList(R);
  while not R.EOF do
  begin
    edUser.Items.Add(AsStr(R, 1));
    R.MoveNext;
  end;
  edUser.Text := fParams.AsStr['user'];
  edUser.Tag := fParams.AsInt['userid'];
end;

end.

