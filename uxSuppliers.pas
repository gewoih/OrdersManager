unit uxSuppliers;

interface

procedure DrawContactsInformation;

type
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

var
	Suppliers:	array of tSupplierRec;

implementation

uses ufMainForm, uxADO, uxParams, uxOrderedItems,
System.SysUtils;

procedure DrawContactsInformation;
var
    R, R1:				OleVariant;
    contract_id, K, N:	integer;
begin
	try
        if not Assigned(fLastNode) or (fParams.AsInt['userid'] = 75615) then Exit;

		Form1.TBottomInfoPanel.Visible := true;
		Form1.TBottomInfoPanel.Top := Form1.TOrderPanel.Top + 300;
		Form1.SuppliersComboBox.Clear;
        Form1.ContactsTree.Clear;
        SetLength(Suppliers, 0);

        K := 0;

        R := fcon.Execute(Format(Form1.scLoadSuppliers.Items.Text, [OrderedItems[Form1.OrdersTree.FocusedNode.Index].contract_id]));
        while not R.EOF do
        begin
        	R1 := fcon.Execute(Format(Form1.scLoadContacts.Items.Text, [AsInt(R, 'id')]));

            SetLength(Suppliers, K + 1);

            Suppliers[K].id := AsInt(R, 'id');
            Suppliers[K].supplier_id := AsInt(R, 'supp_id');
            Suppliers[K].contract := AsStr(R, 'contract');

            Form1.SuppliersComboBox.Items.Add(Suppliers[K].contract);

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
		Form1.SuppliersComboBox.Update;
		Form1.SuppliersComboBox.ItemIndex := 0;
        Form1.SuppliersComboBox.OnChange(nil);
    end;
end;

end.
