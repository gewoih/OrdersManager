unit uxOrders;

interface

procedure FillUpOrders(K: integer; R, R1: OleVariant);
procedure LoadOrders;
procedure SetManager(manager: AnsiString);
procedure DrawOrderInformation;

type
	tOrderRec = record
		pid:			    integer; 
		order_number:	    integer; 
		order_sum:		    double; 
		name:			    AnsiString; 
		date:			    AnsiString; 
		number:             AnsiString;
		email:              AnsiString;
		comment:            AnsiString;
		status:			    AnsiString; 
		manager:		    AnsiString; 
		version:            AnsiString;
		warehouse:          AnsiString;
		payment_method:     AnsiString;
		delivery_method:	AnsiString;
		discount:           AnsiString;
		delivery_date:		AnsiString;
		delivery_address:	AnsiString;
		manager_comment:	AnsiString; 
		order_sum_in:		double;
	end;

var
	Orders:	array of tOrderRec;
	
implementation

uses ufMainForm, uxADO, uxThread, uxOrderedItems,
System.SysUtils, Dialogs, System.UITypes, VirtualTrees, System.Variants, System.AnsiStrings;
		
procedure LoadOrders;
var
	R, R1:	OleVariant;
    K:		integer;
begin
    try
		Form1.MainTree.BeginUpdate;
		Form1.MainTree.Clear;

		SetLength(Orders, 0);

        K := 0;
        R := fCon.Execute(Format(Form1.SQL.Items.Text, ['', 0]));
        while not R.EOF do
        begin
			SetLength(Orders, K + 1);
			Form1.MainTree.AddChild(nil, pointer(K));

			R1 := fcon.Execute(Format(Form1.SQL1.Items.Text, [AsInt(R, 'pid')]));
            FillUpOrders(K, R, R1);

            if fThread.FLast < AsStr(R, 1) then
            	fThread.FLast := AsStr(R, 1);

            Inc(K);
            R.MoveNext;
        end;
    finally
		Form1.MainTree.EndUpdate;
		Form1.MainTree.Invalidate;
    end;
end;

procedure FillUpOrders(K: integer; R, R1: OleVariant);
begin
	Orders[K].order_number := K + 1;
	Orders[K].pid := AsInt(R, 'pid');
	Orders[K].name := AsStr(R, '3');
	Orders[K].date := AsStr(R, '1');
	Orders[K].number := AsStr(R, '4');
	Orders[K].email := AsStr(R, '5');
	Orders[K].comment := AsStr(R, '6');
	Orders[K].status := AsStr(R, '7');
	Orders[K].manager := AsStr(R, '8');
	Orders[K].version := AsStr(R, '0');

	Orders[K].order_sum := 0;
	Orders[K].order_sum_in := 0;
	while not R1.EOF do
	begin
		Orders[K].order_sum := Orders[K].order_sum + AsExt(R1, 'summ');
		Orders[K].order_sum_in := Orders[K].order_sum_in + AsExt(R1, 'summ_in');
		R1.MoveNext;
	end;

	Orders[K].warehouse := AsStr(R, '14');
	Orders[K].payment_method := AsStr(R, '15');
	Orders[K].delivery_method := AsStr(R, '16');
	Orders[K].discount := AsStr(R, '17');
	Orders[K].delivery_date := AsStr(R, '18');
	Orders[K].delivery_address := AsStr(R, '19');
	Orders[K].manager_comment := AsStr(R, '20');
end;

procedure SetManager(manager: AnsiString);
var
	selected, order_number, pid:	integer;
begin
    if not Assigned(Form1.MainTree.FocusedNode) then Exit;

    try
		Form1.MainTree.BeginUpdate;

        order_number := Form1.MainTree.Text[Form1.MainTree.GetFirstSelected, 0].ToInteger;
		pid := Orders[order_number - 1].pid;
        selected := MessageDlg('Вы действительно хотите забрать заказ №' + order_number.ToString, mtConfirmation, mbOKCancel, 0);
        if selected = mrOK then
        begin
			Orders[order_number - 1].manager := manager;
			Orders[order_number - 1].status := 'В обработке';
			fcon.Execute(Format(Form1.scUpdateManager.Items.Text, ['В обработке', manager, pid])); //?
        end
    finally
		Form1.MainTree.EndUpdate;
        Form1.MainTree.Invalidate;
    end;
end;

procedure DrawOrderInformation;
var
	R:				OleVariant;
    pid, row_index:	integer;
begin
    if not Assigned(Form1.MainTree.FocusedNode) then Exit;

    row_index := Form1.MainTree.FocusedNode.RowIndex;
	pid := Orders[fLastNode.RowIndex].pid;
	R := fcon.Execute(Format(Form1.SQL1.Items.Text, [pid]));

	Form1.cbSklad.Text := Orders[row_index].warehouse;
	Form1.cbOplat.Text := Orders[row_index].payment_method;
	Form1.cbDost.Text := Orders[row_index].delivery_method;
	Form1.cbSkid.Text := Orders[row_index].discount;

	if Orders[row_index].delivery_date = '' then
		Form1.dtDost.Format := ''''''
    else
    begin
		Form1.dtDost.Format := 'dd.MM.yyyy';
		Form1.dtDost.Date := VarToDateTime(Orders[row_index].delivery_date);
    end;

	Form1.edAddr.Text := Orders[row_index].delivery_address;
	Form1.edPrim.Text := Orders[row_index].manager_comment;
end;

end.
