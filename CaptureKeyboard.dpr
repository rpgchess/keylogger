library CaptureKeyboard;

uses
  Windows,
  Messages;

const
  CM_MANDA_TECLA = WM_USER + $1000;

var
  HookDeTeclado:HHook;
  FicheroM:THandle;
  PReceptor:^Integer;

function CallBackDelHook(Code:Integer; wParam:WPARAM; lParam:LPARAM): LRESULT; stdcall;
begin
  if code = HC_ACTION then begin
    FicheroM := OpenFileMapping(FILE_MAP_WRITE,False,'ElReceptor');
    if FicheroM <> 0 then begin
      PReceptor := MapViewOfFile(FicheroM,FILE_MAP_WRITE,0,0,0);
      PostMessage(PReceptor^,CM_MANDA_TECLA,wParam,lParam);
      UnmapViewOfFile(PReceptor);
      CloseHandle(FicheroM);
    end;
  end;
  Result := CallNextHookEx(HookDeTeclado, Code, wParam, lParam)
end;

procedure HookOn; stdcall;
begin
  HookDeTeclado := SetWindowsHookEx(WH_KEYBOARD, @CallBackDelHook, HInstance , 0);
end;

procedure HookOff; stdcall;
begin
  UnhookWindowsHookEx(HookDeTeclado);
end;

exports
  HookOn,
  HookOff;

begin
end.
 