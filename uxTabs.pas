unit uxTabs;

interface

procedure LoadFilteredOrders(status, manager: AnsiString);
procedure LoadTab;

implementation

uses ufMainForm, VirtualTrees, uxParams;

procedure LoadTab;
begin
case Form1.TabControl1.TabIndex of
    0: LoadFilteredOrders('', '');

    1: LoadFilteredOrders('Новый', '');

    2: LoadFilteredOrders('В обработке', '');

    3: LoadFilteredOrders('Отправлен на отгрузку', '');

    4: LoadFilteredOrders('', fParams.AsStr['user']);
	end;
end;

procedure LoadFilteredOrders(status, manager: AnsiString);
var
    Node:	PVirtualNode;
begin
	Form1.MainTree.BeginUpdate;
  try
	Node := Form1.MainTree.GetFirst;

    while Assigned(Node) do
    begin
        if (status = '') and (manager = '') then
			Form1.MainTree.IsVisible[Node] := true

        else if (status = '') and (manager <> '') then
        begin
			if Form1.MainTree.Text[Node, 7] = manager then
				Form1.MainTree.IsVisible[Node] := true
            else
				Form1.MainTree.IsVisible[Node] := false;
        end

        else if (status <> '') and (manager = '') then
        begin
			if Form1.MainTree.Text[Node, 8] = status then
				Form1.MainTree.IsVisible[Node] := true
            else
            	Form1.MainTree.IsVisible[Node] := false;
        end

        else if (status <> '') and (manager <> '') then
    	begin
			if (Form1.MainTree.Text[Node, 7] = manager) and (Form1.MainTree.Text[Node, 8] = status) then
				Form1.MainTree.IsVisible[Node] := true
            else
				Form1.MainTree.IsVisible[Node] := false;
        end;

		Node := Form1.MainTree.GetNext(Node);
    end;
  finally
	Form1.MainTree.EndUpdate;
	Form1.MainTree.Invalidate;
  end;
end;

end.
