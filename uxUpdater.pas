unit uxUpdater;

interface

uses Classes;

var
  fVersion: string;
  fIniFile: TStringList;
  fIniFileName: String;

function CheckVersion: boolean;

implementation

uses Windows, SysUtils, Variants, Dialogs, uxADO, uxParams;

function RunExternalModule(Name: string): Thandle;
var
  PI: TProcessInformation;
  SI: TStartupInfo;
  D: string;
begin
  FillChar(SI, Sizeof(SI), #0);
  FillChar(PI, Sizeof(PI), #0);
  with SI do
  begin
    cb := Sizeof(TStartupInfo);
    lpDesktop := PChar('Default');
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := SW_SHOWMAXIMIZED;
  end;
  D := ExtractFileDir(Name);
  if (not CreateProcess(nil, PChar(Name + ' ' + ParamStr(1) + ' ' + ParamStr(2)), nil, nil, LongBool(false), IDLE_PRIORITY_CLASS, nil,  PChar(D), SI, PI)) then raise Exception.Create('Не смогла запуститься.');
  Result := PI.hProcess;
end;


function CheckVersion: boolean;
var Fn, Fo: string; Rc: OleVariant; V: variant;
begin
  Result := true;

  Fn := ParamStr(0);
  fVersion := fIniFile.Values['vers'];
  if fVersion='' then fVersion := '0';

  Rc := fcon.Execute(format('exec CheckVersion %s, %s', [FVersion, QuotedStr(ExtractFileName(Fn))]));
  if Rc.EOF then Exit;

  V := Rc.Fields[3].Value;
  if (V = 0) or (V = null) then Exit;

  fVersion := Rc.Fields[0].Value;
  V := Rc.Fields[2].Value;
  Result := (TVarData(V).VArray.Bounds[0].ElementCount=0);
  if (not Result) then
  begin
    Fo := ChangeFileExt(Fn, '.old');
    if FileExists(Fo) then DeleteFile(Fo);
    RenameFile(Fn, Fo);
    With TFileStream.Create(Fn, fmCreate) do
    try
      Write(TVarData(V).VArray.Data^, TVarData(V).VArray.Bounds[0].ElementCount);
    finally
      Sleep(50);
      Free;
    end;
    fVersion := Rc.Fields[0].Value;
    fIniFile.Values['vers'] := fVersion;
    fIniFile.Values['data'] := Rc.Fields[1].Value;
    fIniFile.Values['size'] := Rc.Fields[3].Value;
    fIniFile.SaveToFile(fIniFileName);
    Result := False;
  end;
  if not Result then RunExternalModule(Fn);
end;

initialization
  fIniFileName := ChangeFileExt(ParamStr(0), '.ver');
  fIniFile := TStringList.Create;
  If FileExists(fIniFileName) then fIniFile.LoadFromFile(fIniFileName);
finalization
  fIniFile.SaveToFile(fIniFileName);
  fIniFile.Free;
end.
