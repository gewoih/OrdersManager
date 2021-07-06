unit uxFilter;

interface

procedure SetFilter(const Value: AnsiString);
function CheckStrFilter(R: integer): boolean;
function GetFilter:	AnsiString;

var
	FSkipChar:		boolean;
	fFilterArr:		array of AnsiString;
	Filter:			AnsiString;

implementation

uses ufMainForm, VirtualTrees, System.StrUtils;

function GetFilter: AnsiString;
begin
	Result := Form1.Edit1.Text;
end;

procedure UpdateFilter;
var
	N: PVirtualNode;
begin
  if not Assigned(Form1.MainTree.OnCheckFilter) then Exit;

  with Form1.MainTree do
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

function CheckStrFilter(R: integer): boolean;
var
	S, C:	AnsiString;
    K:      integer;
begin
	K := Form1.MainTree.FocusedColumn;
	begin
		//S := AnsiString(Orders[R, MainTree.Header.Columns[K].Tag]);
        Result := True;
        for C in fFilterArr do
        begin
			Result := (C = '') or AnsiContainsText(S, C);
            if not Result then Break;
        end;
    end;
end;

procedure SetFilter(const Value: AnsiString);
var C: AnsiChar;
begin
    try
		Form1.MainTree.BeginUpdate;

		Form1.Edit1.Text := Value;
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
		Form1.MainTree.UpdateFilter;
    finally
		Form1.MainTree.EndUpdate;
    	Form1.MainTree.Invalidate;
    end;
end;

end.
