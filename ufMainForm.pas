unit ufMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VirtualTrees, uxADO, System.Win.ComObj, fxLogin, uxParams,
  ActiveX, SyncObjs, uBase, uSysCtrls, System.Notification, Vcl.AppEvnts,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, System.UITypes, TFlatSplitterUnit,
  Vcl.StdCtrls, TFlatPanelUnit, TFlatCheckBoxUnit, Vcl.WinXCtrls,
  TFlatComboBoxUnit, TFlatButtonUnit, Vcl.Clipbrd, Winapi.ShellAPI, ufEmailSender;

type

  TForm1 = class(TForm)
    SQL: TStringContainer;
    SQL1: TStringContainer;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    sbMain: TStatusBar;
    MainTree: TVirtualStringTree;
    OrdersTree: TVirtualStringTree;
    TabControl1: TTabControl;
    MainTreePopupmenu: TPopupMenu;
    miTake: TMenuItem;
    miOpen: TMenuItem;
    TrayIconPopupmenu: TPopupMenu;
    miOpenProgram: TMenuItem;
    N4: TMenuItem;
    miCloseProgram: TMenuItem;
    FlatSplitter1: TFlatSplitter;
    SearchPanel: TPanel;
    Edit1: TEdit;
    scUpdateOrderInfo: TStringContainer;
    miAssign: TMenuItem;
    N9: TMenuItem;
    scUpdateManager: TStringContainer;
    OrdersTreePopupmenu: TPopupMenu;
    miDeleteItemFromOrder: TMenuItem;
    scDeleteItemFromOrder: TStringContainer;
    miOrdersCopyValue: TMenuItem;
    miOpenURL: TMenuItem;
    TTopInfoPanel: TFlatPanel;
    Panel3: TPanel;
    lbPrim: TLabel;
    edPrim: TEdit;
    Panel4: TPanel;
    lbDDost: TLabel;
    lbAddr: TLabel;
    dtDost: TDateTimePicker;
    edAddr: TEdit;
    Panel5: TPanel;
    lbSklad: TLabel;
    lbOplat: TLabel;
    lbSkid: TLabel;
    lbDost: TLabel;
    lbStatus: TLabel;
    cbSklad: TFlatComboBox;
    cbSkid: TFlatComboBox;
    cbDost: TFlatComboBox;
    cbOplat: TFlatComboBox;
    cbStatus: TFlatComboBox;
    Panel2: TPanel;
    InfoPanelBtSave: TFlatButton;
    InfoPanelBtClose: TFlatButton;
    TBottomInfoPanel: TFlatPanel;
    ContactsTree: TVirtualStringTree;
    SuppliersComboBox: TFlatComboBox;
    Label1: TLabel;
    FlatButton1: TFlatButton;
    scLoadSuppliers: TStringContainer;
    scLoadContacts: TStringContainer;
    TOrderPanel: TFlatPanel;
    FlatPanel1: TFlatPanel;
    ContactsTreePopupmenu: TPopupMenu;
    miContactsCopyValue: TMenuItem;
    miRequestItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MainTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure MainTreeBeforeCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure MainTreeFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex);
    procedure OrdersTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure ShowPanel(I: integer; Text: AnsiString);
    procedure TabControl1Change(Sender: TObject);
    procedure MainTreeEditing(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; var Allowed: Boolean);
    procedure miTakeClick(Sender: TObject);
    procedure MainTreeCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure MainTreeHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
    procedure miCloseProgramClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MainTreeEdited(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex);
    function MainTreeCheckFilter(Node: PVirtualNode): Boolean;
    procedure miOpenClick(Sender: TObject);
    procedure InfoPanelBtSaveClick(Sender: TObject);
    procedure InfoPanelBtCloseClick(Sender: TObject);
    procedure dtDostClick(Sender: TObject);
    procedure MainTreePopupmenuPopup(Sender: TObject);
    procedure edEnter(Sender: TObject);
    procedure edExit(Sender: TObject);
    procedure SubmenuInsert(manager: AnsiString);
    procedure SubmenuManagerOnClick(Sender: TObject);
    procedure miDeleteItemFromOrderClick(Sender: TObject);
    procedure OrdersTreePopupmenuPopup(Sender: TObject);
    procedure miOrdersCopyValueClick(Sender: TObject);
    procedure miOpenURLClick(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure SuppliersComboBoxChange(Sender: TObject);
    procedure ContactsTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure OrdersTreeFocusChanged(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex);
    procedure miOpenInfoClick(Sender: TObject);
	procedure miRequestItemClick(Sender: TObject);
end;

var
  Form1:		TForm1;
  fCon:			OLEVariant;
  fLastNode:	PVirtualNode;
  
const
  adoCon = 'ADODB.Connection';
  adoRec = 'ADODB.Recordset';

implementation

{$R *.dfm}

uses uxUpdater, uxOrders, uxThread, uxSuppliers, uxOrderedItems, uxFilter, uxNotifications, uxTabs,
Math, AnsiStrings;

procedure TForm1.ApplicationEvents1Minimize(Sender: TObject);
begin
	Form1.Visible := false;
    TrayIcon1.Icon := Application.Icon;
    TrayIcon1.Visible := True;
end;

procedure TForm1.FlatButton1Click(Sender: TObject);
begin
    TBottomInfoPanel.Visible := false;
end;

{$REGION 'InfoPanel Buttons'}
procedure TForm1.InfoPanelBtCloseClick(Sender: TObject);
begin
    TTopInfoPanel.Visible := false;
end;

procedure TForm1.InfoPanelBtSaveClick(Sender: TObject);
var
    pid: integer;
begin
	pid := Orders[fLastNode.RowIndex].pid;

    try
    	fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [7, pid, cbStatus.Text]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [14, pid, cbSklad.Text]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [15, pid, cbOplat.Text]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [16, pid, cbDost.Text]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [17, pid, cbSkid.Text]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [18, pid, FormatDateTime('dd.MM.yyyy', dtDost.Date)]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [19, pid, edAddr.Text]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [20, pid, edPrim.Text]));

		Orders[fLastNode.RowIndex].status := cbStatus.Text;
		Orders[fLastNode.RowIndex].warehouse := cbSklad.Text;
		Orders[fLastNode.RowIndex].payment_method := cbOplat.Text;
		Orders[fLastNode.RowIndex].delivery_method := cbDost.Text;
		Orders[fLastNode.RowIndex].discount := cbSkid.Text;
		Orders[fLastNode.RowIndex].delivery_date := FormatDateTime('dd.MM.yyyy', dtDost.Date);
		Orders[fLastNode.RowIndex].delivery_address := edAddr.Text;
		Orders[fLastNode.RowIndex].manager_comment := edPrim.Text;

        ShowMessage('Информация сохранена!');
    finally
    end;
end;
{$ENDREGION}

procedure TForm1.dtDostClick(Sender: TObject);
begin
	dtDost.Format := 'dd.MM.yyyy';
    dtDost.Date := Now;
end;

procedure TForm1.edEnter(Sender: TObject);
begin
  KeyPreview := False;
end;

procedure TForm1.edExit(Sender: TObject);
begin
  KeyPreview := True;
end;

{$REGION 'MainTree'}
procedure TForm1.MainTreeBeforeCellPaint(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
begin
	var R := CellRect;
    if Node.Index mod 2 = 0 then TargetCanvas.Brush.Color := $E0FFE0 else TargetCanvas.Brush.Color := $E0FFFF;
    if (Node=Sender.FocusedNode) or (Column=Sender.FocusedColumn) then TargetCanvas.Brush.Color := TargetCanvas.Brush.Color - $200020;
    if (Node=Sender.FocusedNode) and (Column=Sender.FocusedColumn) then TargetCanvas.Brush.Color := $FFFFFF;
    TargetCanvas.FillRect(R);
end;

function TForm1.MainTreeCheckFilter(Node: PVirtualNode): Boolean;
begin
	Result := CheckStrFilter(Node.RowIndex);
end;

procedure TForm1.MainTreeCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
    D1, D2: int64;
begin
    if Column < 0 then Exit;

	case Column of
		0: Result := Sign(Orders[Node1.RowIndex].order_number - Orders[Node2.RowIndex].order_number);
		2: Result := AnsiCompareText(Orders[Node1.RowIndex].name, Orders[Node2.RowIndex].name);
		3: Result := AnsiCompareText(Orders[Node1.RowIndex].number, Orders[Node2.RowIndex].number);
		4: Result := AnsiCompareText(Orders[Node1.RowIndex].email, Orders[Node2.RowIndex].email);
		5: Result := AnsiCompareText(Orders[Node1.RowIndex].manager, Orders[Node2.RowIndex].manager);
		6: Result := AnsiCompareText(Orders[Node1.RowIndex].status, Orders[Node2.RowIndex].status);
		7: Result := AnsiCompareText(Orders[Node1.RowIndex].comment, Orders[Node2.RowIndex].comment);
    else
		D1 := StrToInt64Def(Orders[Node1.RowIndex].date, 0);
		D2 := StrToInt64Def(Orders[Node2.RowIndex].date, 0);
        Result := Sign(D1 - D2);
    end;
end;

procedure TForm1.MainTreeHeaderClick(Sender: TVTHeader;
  HitInfo: TVTHeaderHitInfo);
begin
	if MainTree.Header.SortColumn <> HitInfo.Column then
    begin
        MainTree.Header.SortColumn := HitInfo.Column;
        MainTree.Header.SortDirection := sdAscending;
    end
    else
    begin
    	if MainTree.Header.SortDirection = sdAscending then
            MainTree.Header.SortDirection := sdDescending
        else
            MainTree.Header.SortDirection := sdAscending;
    end;
    MainTree.SortTree(MainTree.Header.SortColumn, MainTree.Header.SortDirection, false);
end;

procedure TForm1.MainTreeEdited(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex);
begin
    FSkipChar := false;
end;

procedure TForm1.MainTreeEditing(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; var Allowed: Boolean);
begin
    Allowed := false;
    fSkipChar := true;
end;

procedure TForm1.MainTreeFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
begin
    TTopInfoPanel.Visible := false;
    SuppliersComboBox.Clear;
    ContactsTree.Clear;

    if Node <> fLastNode then
    begin
    	fLastNode := Node;
        DrawOrderedItems;
        DrawOrderInformation;
        OrdersTree.FocusedNode := OrdersTree.GetFirst;
    end;
end;
{$ENDREGION}

{$REGION 'SUBMENU'}
procedure TForm1.SubmenuManagerOnClick(Sender: TObject);
begin
    SetManager((Sender as TMenuItem).Caption);
end;

procedure TForm1.SuppliersComboBoxChange(Sender: TObject);
var
	K:	integer;
begin
    try
        if not Assigned(fLastNode) or (SuppliersComboBox.Items.Count = 0) or (fParams.AsInt['userid'] = 75615) then Exit;

        ContactsTree.Clear;
        ContactsTree.BeginUpdate;

        K := 0;
        while K < Length(Suppliers[SuppliersComboBox.ItemIndex].contacts) do
        begin
            ContactsTree.AddChild(nil, pointer(K));
            Inc(K);
        end;

    finally
        ContactsTree.EndUpdate;
        ContactsTree.Invalidate;
	end;
end;

procedure TForm1.SubmenuInsert(manager: AnsiString);
var
	N: TMenuItem;
begin
	N := TMenuItem.Create(self.miAssign);
    N.Caption := manager;
    N.OnClick := SubmenuManagerOnClick;
    miAssign.Add(N);
end;
{$ENDREGION}

{$REGION 'TVGetText'}
procedure TForm1.ContactsTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
begin
	case Column of
        0: CellText := Suppliers[SuppliersComboBox.ItemIndex].contacts[Node.RowIndex].name;
        1: CellText := Suppliers[SuppliersComboBox.ItemIndex].contacts[Node.RowIndex].post;
        2: CellText := Suppliers[SuppliersComboBox.ItemIndex].contacts[Node.RowIndex].mobile;
        3: CellText := Suppliers[SuppliersComboBox.ItemIndex].contacts[Node.RowIndex].landline;
        4: CellText := Suppliers[SuppliersComboBox.ItemIndex].contacts[Node.RowIndex].ext.ToString;
        5: CellText := Suppliers[SuppliersComboBox.ItemIndex].contacts[Node.RowIndex].email;
        6: CellText := Suppliers[SuppliersComboBox.ItemIndex].contacts[Node.RowIndex].birthday;
        7: CellText := Suppliers[SuppliersComboBox.ItemIndex].contacts[Node.RowIndex].note;
    end;
end;

procedure TForm1.OrdersTreeFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
begin
    DrawContactsInformation;
end;

procedure TForm1.OrdersTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
begin
	case Column of
	0: CellText := OrderedItems[Node.RowIndex].number.ToString;
    1: CellText := OrderedItems[Node.RowIndex].mid.ToString;
	2: CellText := OrderedItems[Node.RowIndex].item_name;
	3: CellText := FormatFloat('#,##0.00', OrderedItems[Node.RowIndex].price);
	4: CellText := FormatFloat('#,##0.00', OrderedItems[Node.RowIndex].price_in);
	5: CellText := OrderedItems[Node.RowIndex].quantity.ToString;
	6: CellText := FormatFloat('#,##0.00', OrderedItems[Node.RowIndex].sum);
	7: CellText := FormatFloat('#,##0.00', OrderedItems[Node.RowIndex].sum_in);
	8: CellText := FormatFloat('#,##0.00', OrderedItems[Node.RowIndex].sum - OrderedItems[Node.RowIndex].sum_in);
	9: CellText := OrderedItems[Node.RowIndex].contract_name;
	10: CellText := OrderedItems[Node.RowIndex].stock.ToString;
  end;
end;

procedure TForm1.OrdersTreePopupmenuPopup(Sender: TObject);
var
    UserId:		integer;
    Username:   AnsiString;
begin
    if not Assigned(OrdersTree.FocusedNode) then
    begin
        miDeleteItemFromOrder.Enabled := false;
        miOpenURL.Enabled := false;
        miOrdersCopyValue.Enabled := false;
        Exit;
    end;

    UserId := fParams.AsInt['userid'];
    Username := fParams.AsStr['user'];

    miOrdersCopyValue.Enabled := true;
    miOpenURL.Enabled := true;
	miDeleteItemFromOrder.Enabled := ((UserId = 75565) or (UserId = 75567) or (UserId = 336207) or (Username = Orders[fLastNode.RowIndex].manager));
end;

procedure TForm1.MainTreePopupmenuPopup(Sender: TObject);
var
	R: OleVariant;
    UserId: integer;
begin
    if not Assigned(MainTree.FocusedNode) then
    begin
    	miAssign.Enabled := false;
        miTake.Enabled := false;
        miOpen.Enabled := false;
        Exit;
    end;

    UserId := fParams.AsInt['userid'];

    miAssign.Enabled := ((UserId = 75565) or (UserId = 75567) or (UserId = 336207));
	miTake.Enabled := (Orders[fLastNode.RowIndex].manager = 'Не назначен') or miAssign.Enabled;
	miOpen.Enabled := (Orders[fLastNode.RowIndex].manager = fParams.AsStr['user']) or miAssign.Enabled;

    try
    	miAssign.Clear;
    	R := fcon.Execute('select linkid, dbo.AsStr(linkid, 3742, 0) from spr_prop where metaid = 6063');
        while not R.EOF do
        begin
            SubMenuInsert(AsStr(R, 1));
            R.MoveNext;
        end;
    finally
        R.Close;
    end;
end;

procedure TForm1.MainTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
function ConvertDate(N: PVirtualNode): string;
var D, T: int64;
begin
  D := StrToInt64Def(Orders[N.RowIndex].date, 0) Div 100000;
  T := StrToInt64Def(Orders[N.RowIndex].date, 0) Mod 100000;
  If D > 0 then
  begin
    Result := format('%.2d-%.2d-%.4d', [D mod 100, (D div 100) mod 100, D div 10000]);
    Result := Result + format('  %.2d:%.2d:%.2d', [T div 3600, (T div 60) mod 60, T mod 60]);
  end
    else Result := '';
end;

begin
  case MainTree.Header.Columns[Column].Tag of
	1: CellText := Orders[Node.RowIndex].order_number.ToString;
	3: CellText := ConvertDate(Node);
	2: CellText := Orders[Node.RowIndex].name;
	4: CellText := Orders[Node.RowIndex].number;
	5: CellText := Orders[Node.RowIndex].email;
	8: CellText := Orders[Node.RowIndex].manager;
	7: CellText := Orders[Node.RowIndex].status;
	6: CellText := Orders[Node.RowIndex].comment;
	9: CellText := FormatFloat('#,##0.00', Orders[Node.RowIndex].order_sum);
	10: CellText := FormatFloat('#,##0.00', Orders[Node.RowIndex].order_sum - Orders[Node.RowIndex].order_sum_in);
  end;
end;
{$ENDREGION}

{$REGION 'MainPopup Buttons'}
procedure TForm1.miTakeClick(Sender: TObject);
begin
    SetManager(fParams.AsStr['user']);
end;

procedure TForm1.miOpenClick(Sender: TObject);
begin
    TTopInfoPanel.Visible := true;
end;

procedure TForm1.miOpenInfoClick(Sender: TObject);
begin
    TBottomInfoPanel.Visible := true;
end;
{$ENDREGION}

{$REGION 'OrdersTree PopupMenu'}
procedure TForm1.miOrdersCopyValueClick(Sender: TObject);
begin
	With OrdersTree do
    	Clipboard.AsText := Text[FocusedNode, FocusedColumn];
end;

procedure TForm1.miOpenURLClick(Sender: TObject);
begin
    ShellExecute(handle, 'open', PChar('https://wtc.ru/Catalogue?Relate=' + OrderedItems[OrdersTree.FocusedNode.RowIndex].mid.ToString), nil, nil, SW_SHOW);
end;

procedure TForm1.miRequestItemClick(Sender: TObject);
function AssembleMessage: AnsiString;
begin
	for var i := Low(Orders) to High(Orders) do
    begin
        Result := Result + OrderedItems[i].item_name + #$D#$A;
    end;
end;

begin
    with TForm2.Create(nil) do
    try
        Form2.edRecipient.Text := Trim(ContactsTree.Text[ContactsTree.FocusedNode, 5]);
        Form2.edSubject.Text := 'Запрос от ООО "ВТК"';
        Form2.edSign.Text := fParams.AsStr['user'];
        Form2.Memo1.Text := 'Здравствуйте. Прошу Вас сообщить наличие следующих позиций:' + #$D#$A + AssembleMessage;

        if Form2.ShowModal= mrOK then
            ShowMessage('Письмо успешно отправлено!')
        else
            ShowMessage('Ошибка при отправке письма.');
    finally
    	Free;
    end;
end;

procedure TForm1.miDeleteItemFromOrderClick(Sender: TObject);
begin
    DeleteOrderedItem;
end;
{$ENDREGION}

procedure TForm1.miCloseProgramClick(Sender: TObject);
begin
    Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
	UserId:	integer;
begin
	ShowPanel(0, fParams.AsStr['user']);
	ShowPanel(1, fParams.AsInt['userid'].ToString);
	ShowPanel(2, 'Сборка: ' + fIniFile.Values['data']);

	fSect := TCriticalSection.Create;

	fThread := txSyncThread.Create(True);
	fThread.FreeOnTerminate := True;
	//fThread.SyncProc := SyncProc;
	fThread.Start;

	UserId := fParams.AsInt['userid'];
	if UserId = 75615 then
	begin
		MainTree.Header.Columns[3].Options := MainTree.Header.Columns[3].Options - [coVisible];
		OrdersTree.Header.Columns[4].Options := OrdersTree.Header.Columns[4].Options - [coVisible];
		OrdersTree.Header.Columns[7].Options := OrdersTree.Header.Columns[7].Options - [coVisible];
		OrdersTree.Header.Columns[8].Options := OrdersTree.Header.Columns[8].Options - [coVisible];
	end;
	
	ConnectSQL(fcon);
    LoadOrders;
    fSkipChar := false;

    LoadFilteredOrders('', '');
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	case Key of
    VK_F2: Filter := '';
    VK_SPACE: Key := 0;
  	else
    	Exit;
  end;
  Key := 0;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if fSkipChar then
    	fSkipChar := False
    else
    begin
		if (Key < #32) and (Key <> #8) then Exit;
		if (Key = #32) and (Filter = '') then Exit;
		case Key of
      		#8: Filter := LeftStr(Filter, Length(Filter) - 1);
    	else
      		Filter := Filter + Key;
    	end;
    	Key := #0;
    end;
end;

procedure TForm1.ShowPanel(I: integer; Text: AnsiString);
begin
  sbMain.Panels[I].Text := Text;
  sbMain.Panels[I].Width := sbMain.Canvas.TextWidth(Text) + 16;
  sbMain.Panels[I].Alignment := taCenter;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
    LoadTab;
end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
	Form1.Visible := True;
    Form1.FormStyle := fsStayOnTop;
    SendMessage(Form1.Handle, WM_SYSCOMMAND, SC_RESTORE, 0);
  	SetForegroundWindow(Form1.Handle);
    Form1.WindowState := wsMaximized;

	MainTree.FocusedNode := MainTree.GetLast;
end;

end.
