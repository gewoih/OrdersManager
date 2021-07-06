unit uxOrderedItems;

interface

procedure DrawOrderedItems;
procedure DeleteOrderedItem;

type
	tItemRec = record
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

var
	OrderedItems:	array of tItemRec;
	
implementation

uses ufMainForm, uxOrders, uxThread, uxADO,
System.SysUtils, Dialogs, System.UITypes;

procedure DrawOrderedItems;
var
    pid, K:		integer;
    R:      	OleVariant;
begin
	try
        if not Assigned(fLastNode) then Exit;

		Form1.OrdersTree.Clear;
        Form1.OrdersTree.BeginUpdate;

        K := 0;
		pid := Orders[fLastNode.RowIndex].pid;
        R := fcon.Execute(Format(Form1.SQL1.Items.Text, [pid]));
        while not R.EOF do
        begin
            SetLength(OrderedItems, K + 1);

			OrderedItems[K].mid := AsInt(R, 'item_id');
			OrderedItems[K].pid := AsInt(R, 'pid');
			OrderedItems[K].number := K + 1;
			OrderedItems[K].item_name := AsStr(R, 'item_name');
			OrderedItems[K].price_in := AsExt(R, 'price_in');
			OrderedItems[K].price := AsExt(R, 'price');
			OrderedItems[K].quantity := AsInt(R, 'quantity');
			OrderedItems[K].sum_in := AsExt(R, 'summ_in');
			OrderedItems[K].sum := AsExt(R, 'summ');
			OrderedItems[K].margin := AsExt(R, 'margin');
			OrderedItems[K].contract_id := AsInt(R, 'contract_id');
			OrderedItems[K].contract_name := AsStr(R, 'contract_name');
			OrderedItems[K].stock := AsInt(R, 'stock');

            Form1.OrdersTree.AddChild(nil, pointer(K));
            Inc(K);
            R.MoveNext;
        end;
    finally
		Form1.OrdersTree.EndUpdate;
        Form1.OrdersTree.Invalidate;
	end;
end;      

procedure DeleteOrderedItem;
var
	selected, pid, item_number:	integer;
    item_name:                  AnsiString;
begin
	item_name := Form1.OrdersTree.Text[Form1.OrdersTree.GetFirstSelected, 1];
	item_number := Form1.OrdersTree.Text[Form1.OrdersTree.GetFirstSelected, 0].ToInteger;
    pid := Orders[item_number - 1].pid;

    selected := MessageDlg('¬ы действительно хотите удалить ' + item_number.ToString + ' позицию (' +  item_name + ')?', mtConfirmation, mbOKCancel, 0);
    if selected = mrOK then
    begin
        fcon.Execute(Format(Form1.scDeleteItemFromOrder.Items.Text, [pid]));
		DrawOrderedItems;
	end
end;

end.
