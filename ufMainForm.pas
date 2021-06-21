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

    txSyncThread = class(tThread)
  private
    FLast: string;
    FSyncProc: TThreadMethod;
  public
    property SyncProc: TThreadMethod read FSyncProc write FSyncProc;
    procedure Execute; override;
  end;

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
    procedure LoadOrders;
    procedure MainTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure SyncProc;
    procedure FillUpData(K: integer; R, R1: OleVariant);
    procedure MainTreeBeforeCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure MainTreeFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex);
    procedure OrderDrawing;
    procedure OrdersTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure ShowPanel(I: integer; Text: AnsiString);
    procedure TabControl1Change(Sender: TObject);
    procedure MainTreeEditing(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; var Allowed: Boolean);

    procedure LoadFilteredOrders(status, manager: AnsiString);
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
    procedure InformationDrawing;
    procedure dtDostClick(Sender: TObject);
    procedure MainTreePopupmenuPopup(Sender: TObject);
    procedure edEnter(Sender: TObject);
    procedure edExit(Sender: TObject);
    procedure UpdateFilter;
    procedure SetManager(manager: AnsiString);
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
    procedure ContactsInformationDrawing;
    procedure miOpenInfoClick(Sender: TObject);
    procedure miRequestItemClick(Sender: TObject);

  private
  	fThread:		txSyncThread;
    fSect:			TCriticalSection;
    fLastNode:  	PVirtualNode;
    FSkipChar:		boolean;
    fFilterArr:		array of AnsiString;

  	procedure SetFilter(const Value: AnsiString);
    function CheckStrFilter(R: integer): boolean;

    type
    tOrderRec = record
    	mid:			integer;
    	pid:			integer;
		number: 		integer;
		item_name:     	AnsiString;
		price_in:      	double;
		price:			double;
		quantity:   	integer;
		sum_in:     	double;
		sum:			double;
		margin:			double;
		contract_id:	integer;
        contract_name:  AnsiString;
        stock:          integer;
    end;

    tContactRec = record
        name:       	AnsiString;
        post:       	AnsiString;
        mobile:     	AnsiString;
        landline:   	AnsiString;
        ext:        	integer;
        contact_type:   AnsiString;
        email:			AnsiString;
        birthday:       AnsiString;
        note:           AnsiString;
    end;

    tSupplierRec = record
        id:				integer;
        supplier_id:    integer;
        contract:       AnsiString;
        contacts:       array of tContactRec;
    end;

    tFields = (f_pid, f_order_number, f_order_sum, f_name, f_date, f_number,
    		   f_email, f_comment, f_status, f_manager, f_version,
               f_warehouse, f_payment_method, f_delivery_method,
			   f_discount, f_delivery_date, f_delivery_address,
			   f_manager_comment, f_order_sum_in);

    tDataRec = array[tfields] of Variant;

  private
    Suppliers:          array of tSupplierRec;
    Orders:      		array of tOrderRec;
    function GetFilter:	AnsiString;

  public
    Data: 				array of tDataRec;
    property Filter:	AnsiString read GetFilter write SetFilter;
  end;

var
  Form1: TForm1;
  fCon: OLEVariant;

const
  adoCon = 'ADODB.Connection';
  adoRec = 'ADODB.Recordset';

implementation

{$R *.dfm}

uses Math, AnsiStrings, uxUpdater;

procedure TForm1.ApplicationEvents1Minimize(Sender: TObject);
begin
	Form1.Visible := false;
    TrayIcon1.Icon := Application.Icon;
    TrayIcon1.Visible := True;
end;

procedure TForm1.FillUpData(K: integer; R, R1: OleVariant);
begin
	Data[K, f_order_number] := K + 1;
    Data[K, f_pid] := AsInt(R, 'pid');
    Data[K, f_name] := AsStr(R, '3');
    Data[K, f_date] := AsStr(R, '1');
    Data[K, f_number] := AsStr(R, '4');
    Data[K, f_email] := AsStr(R, '5');
    Data[K, f_comment] := AsStr(R, '6');
    Data[K, f_status] := AsStr(R, '7');
    Data[K, f_manager] := AsStr(R, '8');
    Data[K, f_version] := AsStr(R, '0');

	Data[K, f_order_sum] := 0;
	Data[K, f_order_sum_in] := 0;
	while not R1.EOF do
	begin
		Data[K, f_order_sum] := Data[K, f_order_sum] + AsExt(R1, 'summ');
		Data[K, f_order_sum_in] := Data[K, f_order_sum_in] + AsExt(R1, 'summ_in');
		R1.MoveNext;
	end;

    Data[K, f_warehouse] := AsStr(R, '14');
    Data[K, f_payment_method] := AsStr(R, '15');
    Data[K, f_delivery_method] := AsStr(R, '16');
    Data[K, f_discount] := AsStr(R, '17');
    Data[K, f_delivery_date] := AsStr(R, '18');
    Data[K, f_delivery_address] := AsStr(R, '19');
    Data[K, f_manager_comment] := AsStr(R, '20');
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
    pid := Data[fLastNode.RowIndex, f_pid];

    try
    	fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [7, pid, cbStatus.Text]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [14, pid, cbSklad.Text]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [15, pid, cbOplat.Text]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [16, pid, cbDost.Text]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [17, pid, cbSkid.Text]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [18, pid, FormatDateTime('dd.MM.yyyy', dtDost.Date)]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [19, pid, edAddr.Text]));
        fcon.Execute(Format(scUpdateOrderInfo.Items.Text, [20, pid, edPrim.Text]));

        Data[fLastNode.RowIndex, f_status] := cbStatus.Text;
        Data[fLastNode.RowIndex, f_warehouse] := cbSklad.Text;
    	Data[fLastNode.RowIndex, f_payment_method] := cbOplat.Text;
    	Data[fLastNode.RowIndex, f_delivery_method] := cbDost.Text;
    	Data[fLastNode.RowIndex, f_discount] := cbSkid.Text;
    	Data[fLastNode.RowIndex, f_delivery_date] := FormatDateTime('dd.MM.yyyy', dtDost.Date);
    	Data[fLastNode.RowIndex, f_delivery_address] := edAddr.Text;
    	Data[fLastNode.RowIndex, f_manager_comment] := edPrim.Text;

        ShowMessage('Информация сохранена!');
    finally
    end;
end;
{$ENDREGION}

{$REGION 'LoadOrders'}
procedure TForm1.LoadOrders;
var
	R, R1:	OleVariant;
    K:		integer;
begin
    try
        MainTree.BeginUpdate;
        MainTree.Clear;

        SetLength(Data, 0);

        K := 0;
        R := fCon.Execute(Format(SQL.Items.Text, ['', 0]));
        while not R.EOF do
        begin
            SetLength(Data, K + 1);
            MainTree.AddChild(nil, pointer(K));

            R1 := fcon.Execute(Format(SQL1.Items.Text, [AsInt(R, 'pid')]));
            FillUpData(K, R, R1);

            if fThread.FLast < AsStr(R, 1) then
            	fThread.FLast := AsStr(R, 1);

            Inc(K);
            R.MoveNext;
        end;
    finally
        MainTree.EndUpdate;
        MainTree.Invalidate;
    end;
end;

procedure TForm1.LoadFilteredOrders(status, manager: AnsiString);
var
    Node:	PVirtualNode;
begin
	MainTree.BeginUpdate;
  try
    Node := MainTree.GetFirst;

    while Assigned(Node) do
    begin
        if (status = '') and (manager = '') then
            MainTree.IsVisible[Node] := true

        else if (status = '') and (manager <> '') then
        begin
			if MainTree.Text[Node, 7] = manager then
            	MainTree.IsVisible[Node] := true
            else
            	MainTree.IsVisible[Node] := false;
        end

        else if (status <> '') and (manager = '') then
        begin
			if MainTree.Text[Node, 8] = status then
            	MainTree.IsVisible[Node] := true
            else
            	MainTree.IsVisible[Node] := false;
        end

        else if (status <> '') and (manager <> '') then
    	begin
			if (MainTree.Text[Node, 7] = manager) and (MainTree.Text[Node, 8] = status) then
            	MainTree.IsVisible[Node] := true
            else
            	MainTree.IsVisible[Node] := false;
        end;

      	Node := MainTree.GetNext(Node);
    end;
  finally
  	MainTree.EndUpdate;
    MainTree.Invalidate;
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
        0: Result := Sign(Data[Node1.RowIndex, f_order_number] - Data[Node2.RowIndex, f_order_number]);
        2: Result := AnsiCompareText(Data[Node1.RowIndex, f_name], Data[Node2.RowIndex, f_name]);
        3: Result := AnsiCompareText(Data[Node1.RowIndex, f_number], Data[Node2.RowIndex, f_number]);
        4: Result := AnsiCompareText(Data[Node1.RowIndex, f_email], Data[Node2.RowIndex, f_email]);
        5: Result := AnsiCompareText(Data[Node1.RowIndex, f_manager], Data[Node2.RowIndex, f_manager]);
        6: Result := AnsiCompareText(Data[Node1.RowIndex, f_status], Data[Node2.RowIndex, f_status]);
        7: Result := AnsiCompareText(Data[Node1.RowIndex, f_comment], Data[Node2.RowIndex, f_comment]);
    else
		D1 := StrToInt64Def(Data[Node1.RowIndex, f_date], 0);
    	D2 := StrToInt64Def(Data[Node2.RowIndex, f_date], 0);
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

procedure TForm1.OrderDrawing;
var
    pid, K:		integer;
    R:      	OleVariant;
begin
	try
        if not Assigned(fLastNode) then Exit;

        OrdersTree.Clear;
        OrdersTree.BeginUpdate;

        K := 0;
        pid := Data[fLastNode.RowIndex, f_pid];
        R := fcon.Execute(Format(SQL1.Items.Text, [pid]));
        while not R.EOF do
        begin
            SetLength(orders, K + 1);

			orders[K].mid := AsInt(R, 'item_id');
			orders[K].pid := AsInt(R, 'pid');
			orders[K].number := K + 1;
			orders[K].item_name := AsStr(R, 'item_name');
			orders[K].price_in := AsExt(R, 'price_in');
			orders[K].price := AsExt(R, 'price');
			orders[K].quantity := AsInt(R, 'quantity');
			orders[K].sum_in := AsExt(R, 'summ_in');
			orders[K].sum := AsExt(R, 'summ');
			orders[K].margin := AsExt(R, 'margin');
            orders[K].contract_id := AsInt(R, 'contract_id');
            orders[K].contract_name := AsStr(R, 'contract_name');
            orders[K].stock := AsInt(R, 'stock');

            OrdersTree.AddChild(nil, pointer(K));
            Inc(K);
            R.MoveNext;
        end;
    finally
        OrdersTree.EndUpdate;
        OrdersTree.Invalidate;
	end;
end;

procedure TForm1.InformationDrawing;
var
	R:				OleVariant;
    pid, row_index:	integer;
begin
    if not Assigned(MainTree.FocusedNode) then Exit;

    row_index := MainTree.FocusedNode.RowIndex;
    pid := Data[fLastNode.RowIndex, f_pid];
    R := fcon.Execute(Format(SQL1.Items.Text, [pid]));

    cbSklad.Text := Data[row_index, f_warehouse];
	cbOplat.Text := Data[row_index, f_payment_method];
	cbDost.Text := Data[row_index, f_delivery_method];
	cbSkid.Text := Data[row_index, f_discount];

    if Data[row_index, f_delivery_date] = '' then
        dtDost.Format := ''''''
    else
    begin
    	dtDost.Format := 'dd.MM.yyyy';
        dtDost.Date := VarToDateTime(Data[row_index, f_delivery_date]);
    end;

	edAddr.Text := Data[row_index, f_delivery_address];
	edPrim.Text := Data[row_index, f_manager_comment];
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
        OrderDrawing;
        InformationDrawing;
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
    ContactsInformationDrawing;
end;

procedure TForm1.OrdersTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
begin
	case Column of
    0: CellText := orders[Node.RowIndex].number.ToString;
    1: CellText := orders[Node.RowIndex].mid.ToString;
    2: CellText := orders[Node.RowIndex].item_name;
	3: CellText := FormatFloat('#,##0.00', orders[Node.RowIndex].price);
	4: CellText := FormatFloat('#,##0.00', orders[Node.RowIndex].price_in);
	5: CellText := orders[Node.RowIndex].quantity.ToString;
	6: CellText := FormatFloat('#,##0.00', orders[Node.RowIndex].sum);
	7: CellText := FormatFloat('#,##0.00', orders[Node.RowIndex].sum_in);
	8: CellText := FormatFloat('#,##0.00', orders[Node.RowIndex].sum - orders[Node.RowIndex].sum_in);
	9: CellText := orders[Node.RowIndex].contract_name;
	10: CellText := orders[Node.RowIndex].stock.ToString;
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
    miDeleteItemFromOrder.Enabled := ((UserId = 75565) or (UserId = 75567) or (UserId = 336207) or (Username = Data[fLastNode.RowIndex, f_manager]));
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
    miTake.Enabled := (Data[fLastNode.RowIndex, f_manager] = 'Не назначен') or miAssign.Enabled;
    miOpen.Enabled := (Data[fLastNode.RowIndex, f_manager] = fParams.AsStr['user']) or miAssign.Enabled;

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
  D := StrToInt64Def(Data[N.RowIndex, f_date], 0) Div 100000;
  T := StrToInt64Def(Data[N.RowIndex, f_date], 0) Mod 100000;
  If D > 0 then
  begin
    Result := format('%.2d-%.2d-%.4d', [D mod 100, (D div 100) mod 100, D div 10000]);
    Result := Result + format('  %.2d:%.2d:%.2d', [T div 3600, (T div 60) mod 60, T mod 60]);
  end
    else Result := '';
end;

begin
  case MainTree.Header.Columns[Column].Tag of
    1: CellText := Data[Node.RowIndex, f_order_number];
    3: CellText := ConvertDate(Node);
    2: CellText := Data[Node.RowIndex, f_name];
    4: CellText := Data[Node.RowIndex, f_number];
    5: CellText := Data[Node.RowIndex, f_email];
    8: CellText := Data[Node.RowIndex, f_manager];
    7: CellText := Data[Node.RowIndex, f_status];
    6: CellText := Data[Node.RowIndex, f_comment];
	9: CellText := FormatFloat('#,##0.00', Data[Node.RowIndex, f_order_sum]);
	10: CellText := FormatFloat('#,##0.00', Data[Node.RowIndex, f_order_sum] - Data[Node.RowIndex, f_order_sum_in]);
  end;
end;
{$ENDREGION}

procedure TForm1.SetManager(manager: AnsiString);
var
	selected, order_number, pid:	integer;
begin
    if not Assigned(MainTree.FocusedNode) then Exit;

    try
    	MainTree.BeginUpdate;

        order_number := MainTree.Text[MainTree.GetFirstSelected, 0].ToInteger;
        pid := Data[order_number - 1, f_pid];
        selected := MessageDlg('Вы действительно хотите забрать заказ №' + order_number.ToString, mtConfirmation, mbOKCancel, 0);
        if selected = mrOK then
        begin
            Data[order_number - 1, f_manager] := manager;
            Data[order_number - 1, f_status] := 'В обработке';
            fcon.Execute(Format(scUpdateManager.Items.Text, ['В обработке', manager, pid])); //?
        end
    finally
        MainTree.EndUpdate;
        MainTree.Invalidate;
    end;
end;

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
procedure TForm1.ContactsInformationDrawing;
var
    R, R1:				OleVariant;
    contract_id, K, N:	integer;
begin
	try
        if not Assigned(fLastNode) or (fParams.AsInt['userid'] = 75615) then Exit;

		TBottomInfoPanel.Visible := true;
        TBottomInfoPanel.Top := TOrderPanel.Top + 300;
        SuppliersComboBox.Clear;
        ContactsTree.Clear;
        SetLength(Suppliers, 0);

        K := 0;

        R := fcon.Execute(Format(scLoadSuppliers.Items.Text, [Orders[OrdersTree.FocusedNode.Index].contract_id]));
        while not R.EOF do
        begin
        	R1 := fcon.Execute(Format(scLoadContacts.Items.Text, [AsInt(R, 'id')]));

            SetLength(Suppliers, K + 1);

            Suppliers[K].id := AsInt(R, 'id');
            Suppliers[K].supplier_id := AsInt(R, 'supp_id');
            Suppliers[K].contract := AsStr(R, 'contract');

            SuppliersComboBox.Items.Add(Suppliers[K].contract);

            N := 0;
            while not R1.EOF do
            begin
                SetLength(Suppliers[K].contacts, N + 1);

                Suppliers[K].contacts[N].name := AsStr(R1, 'name');
                Suppliers[K].contacts[N].post := AsStr(R1, 'post');
                Suppliers[K].contacts[N].mobile := AsStr(R1, 'mobile');
                Suppliers[K].contacts[N].landline := AsStr(R1, 'landline');
                Suppliers[K].contacts[N].ext := AsInt(R1, 'ext');
                Suppliers[K].contacts[N].contact_type := AsStr(R1, 'type');
                Suppliers[K].contacts[N].email := AsStr(R1, 'email');
                Suppliers[K].contacts[N].birthday := AsStr(R1, 'birthday');
                Suppliers[K].contacts[N].note := AsStr(R1, 'note');

                R1.MoveNext;
                Inc(N);
            end;
            R.MoveNext;
            Inc(K);
        end;
    finally
        SuppliersComboBox.Update;
        SuppliersComboBox.ItemIndex := 0;
        SuppliersComboBox.OnChange(nil);
    end;
end;

procedure TForm1.miOrdersCopyValueClick(Sender: TObject);
begin
	With OrdersTree do
    	Clipboard.AsText := Text[FocusedNode, FocusedColumn];
end;

procedure TForm1.miOpenURLClick(Sender: TObject);
begin
    ShellExecute(handle, 'open', PChar('https://wtc.ru/Catalogue?Relate=' + Orders[OrdersTree.FocusedNode.RowIndex].mid.ToString), nil, nil, SW_SHOW);
end;

procedure TForm1.miRequestItemClick(Sender: TObject);
function AssembleMessage: AnsiString;
begin
	for var i := Low(Orders) to High(Orders) do
    begin
        Result := Result + Orders[i].item_name + #$D#$A;
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
var
	selected, pid, item_number:	integer;
    item_name:                  AnsiString;
begin
    item_name := OrdersTree.Text[OrdersTree.GetFirstSelected, 1];
	item_number := OrdersTree.Text[OrdersTree.GetFirstSelected, 0].ToInteger;
    pid := Orders[item_number - 1].pid;

    selected := MessageDlg('Вы действительно хотите удалить ' + item_number.ToString + ' позицию (' +  item_name + ')?', mtConfirmation, mbOKCancel, 0);
    if selected = mrOK then
    begin
        fcon.Execute(Format(scDeleteItemFromOrder.Items.Text, [pid]));
        OrderDrawing;
    end
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
	fThread.SyncProc := SyncProc;
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

{$REGION 'Filter'}
function TForm1.GetFilter: AnsiString;
begin
    Result := Edit1.Text;
end;

procedure TForm1.UpdateFilter;
var
	N: PVirtualNode;
begin
  if not Assigned(MainTree.OnCheckFilter) then Exit;

  with MainTree do
  try
    BeginUpdate;
    N := GetFirst;
    while Assigned(N) do
    begin
      IsVisible[N] := OnCheckFilter(N);
      N := N.NextSibling;
    end;
    FocusedNode := GetFirstVisible;
  finally
    EndUpdate;
    Invalidate;
  end;
end;

function TForm1.CheckStrFilter(R: integer): boolean;
var
	S, C:	AnsiString;
    K:      integer;
begin
    K := MainTree.FocusedColumn;
    begin
    	S := AnsiString(Data[R, tFields(MainTree.Header.Columns[K].Tag)]);
        Result := True;
        for C in fFilterArr do
        begin
            Result := (C = '') or AnsiContainsText(S, C);
            if not Result then Break;
        end;
    end;
end;

procedure TForm1.SetFilter(const Value: AnsiString);
var C: AnsiChar;
begin
    try
        MainTree.BeginUpdate;

        Edit1.Text := Value;
        SetLength(fFilterArr, 1);
        fFilterArr[0] := '';
        for C in Value do
        begin
        	if (C = #32) and (fFilterArr[High(fFilterArr)] > '' ) then
        	begin
          		SetLength(fFilterArr, Length(fFilterArr) + 1);
          		fFilterArr[High(fFilterArr)] := '';
        	end
        	else
          		fFilterArr[High(fFilterArr)] := fFilterArr[High(fFilterArr)] + C;
        end;
        MainTree.UpdateFilter;
    finally
    	MainTree.EndUpdate;
    	MainTree.Invalidate;
    end;
end;
{$ENDREGION}

procedure TForm1.ShowPanel(I: integer; Text: AnsiString);
begin
  sbMain.Panels[I].Text := Text;
  sbMain.Panels[I].Width := sbMain.Canvas.TextWidth(Text) + 16;
  sbMain.Panels[I].Alignment := taCenter;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
    case TabControl1.TabIndex of
    0: LoadFilteredOrders('', '');

    1: LoadFilteredOrders('Новый', '');

    2: LoadFilteredOrders('В обработке', '');

    3: LoadFilteredOrders('Отправлен на отгрузку', '');

    4: LoadFilteredOrders('', fParams.AsStr['user']);
    end;
end;

{$REGION 'Notifications'}
procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
    Visible := True;
    FormStyle := fsStayOnTop;
    SendMessage(Handle, WM_SYSCOMMAND, SC_RESTORE, 0);
  	SetForegroundWindow(Handle);
    WindowState := wsMaximized;

    MainTree.FocusedNode := MainTree.GetLast;
end;
{$ENDREGION}

{$REGION 'txSyncThread'}
procedure TForm1.SyncProc;
var
    fcon_thread, R, R1:	OleVariant;
    K, temp_id:			Integer;
	N:					PVirtualNode;
begin
  try
  	MainTree.BeginUpdate;
  	fSect.Enter;
  	ConnectSQL(fcon_thread);

  	N := Nil;
    try
        R := fcon_thread.Execute(Format(SQL.Items.Text, [fThread.fLast, 0]));
        if R.Eof then Exit;

        while not R.EOF do
        begin
        	temp_id := AsInt(R, 'pid');
            K := -1;

            R1 := fcon_thread.Execute(Format(SQL1.Items.Text, [temp_id]));

            N := MainTree.GetFirst;
            while Assigned(N) do
            begin
                if (Data[N.RowIndex, f_pid] = temp_id) then
                begin
                    K := N.RowIndex;
                    break;
                end;
                N := N.NextSibling;
            end;

            if K < 0 then
            begin
                K := Length(Data);
                SetLength(Data, K + 1);
                N := MainTree.AddChild(Nil, pointer(K));

                TrayIcon1.BalloonHint := 'Заказ №' + Length(Data).ToString + ' на сумму ' + FormatFloat('#,##0.00', AsExt(R1, 'summ'));
                TrayIcon1.BalloonTitle := 'Заказчик: ' + AsStr(R, 4);
                TrayIcon1.ShowBalloonHint;
            end;

            if fThread.FLast < AsStr(R, 1) then
                fThread.FLast := AsStr(R, 1);

            FillUpData(K, R, R1);
            R.MoveNext;
        end;
    finally
        fSect.Leave;
        fcon_thread.Close;
        MainTree.EndUpdate;
        MainTree.Invalidate;
    end;
  except
    K := K;
  end;
end;

procedure txSyncThread.Execute;
begin
  inherited;
  CoInitializeEx(nil, 0);
  repeat
    try
      try
        Synchronize(Self, SyncProc);
      except
      end;
    finally
      Sleep(5000);
    end;
  until Terminated;
  CoUninitialize;
end;
{$ENDREGION}

end.
