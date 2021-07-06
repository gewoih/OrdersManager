unit uxThread;

interface

uses System.Classes, WinApi.ActiveX, System.SyncObjs, VirtualTrees, System.SysUtils, Vcl.ExtCtrls;

type
	txSyncThread = class(tThread)
	private
		FSyncProc:	TThreadMethod;
	public
		FLast: 				string;
		procedure SyncProc;
		procedure Execute;	override;
	end;
  
var
	fThread:	txSyncThread;
	fSect:		TCriticalSection;
  
implementation

uses uxADO, ufMainForm, uxOrders;

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
	
procedure txSyncThread.SyncProc;
var
	fcon_thread, R, R1:	OleVariant;
	K, temp_id:			Integer;
	N:					PVirtualNode;
begin
  try
	Form1.MainTree.BeginUpdate;
	fSect.Enter;
	ConnectSQL(fcon_thread);

	N := Nil;
    try
		R := fcon_thread.Execute(Format(Form1.SQL.Items.Text, [fThread.fLast, 0]));
		if R.Eof then Exit;

		while not R.EOF do
        begin
			temp_id := AsInt(R, 'pid');
            K := -1;

            R1 := fcon_thread.Execute(Format(Form1.SQL1.Items.Text, [temp_id]));

			N := Form1.MainTree.GetFirst;
            while Assigned(N) do
            begin
				if (Orders[N.RowIndex].pid = temp_id) then
                begin
					K := N.RowIndex;
                    break;
                end;
                N := N.NextSibling;
            end;

            if K < 0 then
            begin
				K := Length(Orders);
				SetLength(Orders, K + 1);
				N := Form1.MainTree.AddChild(Nil, pointer(K));

				Form1.TrayIcon1.BalloonHint := 'Заказ №' + Length(Orders).ToString + ' на сумму ' + FormatFloat('#,##0.00', AsExt(R1, 'summ'));
				Form1.TrayIcon1.BalloonTitle := 'Заказчик: ' + AsStr(R, 4);
                Form1.TrayIcon1.ShowBalloonHint;
			end;

            if fThread.FLast < AsStr(R, 1) then
                fThread.FLast := AsStr(R, 1);

			FillUpOrders(K, R, R1);
            R.MoveNext;
        end;
    finally
        fSect.Leave;
		fcon_thread.Close;
		Form1.MainTree.EndUpdate;
		Form1.MainTree.Invalidate;
    end;
  except
	K := K;
  end;
end;
	
end.
