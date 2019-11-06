unit Principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

const 
  NombreDLL = 'HookTeclado.dll';
  CM_MANDA_TECLA = WM_USER + $1000;

type
  THookTeclado = procedure; stdcall;

  TfrmPrincipal = class(TForm)
    txtKeyboard: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
   private
    FicheroM: THandle;
    PReceptor: ^Integer;
    HandleDLL: THandle;
    HookOn,HookOff: THookTeclado;
    procedure LlegaDelHook(var message: TMessage); message CM_MANDA_TECLA;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  txtKeyboard.ReadOnly := TRUE;
  HandleDLL := LoadLibrary(PChar(ExtractFilePath(Application.Exename) + 'CaptureKeyboard.dll'));
  if HandleDLL = 0 then
    raise Exception.Create('Não foi possível carregar a DLL.');
  @HookOn := GetProcAddress(HandleDLL, 'HookOn');
  @HookOff := GetProcAddress(HandleDLL, 'HookOff');
  if not assigned(HookOn) or not assigned(HookOff) then
    raise Exception.Create('Não foram encontradas as funções da DLL '+#13+'Cannot find the required DLL functions');
  FicheroM := CreateFileMapping( $FFFFFFFF,nil,PAGE_READWRITE,0,SizeOf(Integer),'ElReceptor');
  if FicheroM = 0 then
    raise Exception.Create( 'Erro ao criar arquivo'+'/Error while create file');
  PReceptor := MapViewOfFile(FicheroM,FILE_MAP_WRITE,0,0,0);
  PReceptor^ := Handle;
  HookOn;
end;

procedure TfrmPrincipal.LlegaDelHook(var message: TMessage);
var 
  NombreTecla:array[0..100] of char;
  Accion:string;
begin
  GetKeyNameText(Message.LParam,@NombreTecla,100);
  if ((Message.lParam shr 31) and 1)=1 then
    Accion:='Soltou'
  else
    if ((Message.lParam shr 30) and 1)=1 then
      Accion:='Repetindo'
    else
      Accion:='Pressionou';
  txtKeyboard.Lines.Append(Accion+' tecla: ' + String(NombreTecla));
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  if Assigned(HookOff) then
    HookOff;
  if HandleDLL <> 0 then
    FreeLibrary(HandleDLL);
  if FicheroM <> 0 then begin
    UnmapViewOfFile(PReceptor);
    CloseHandle(FicheroM);
  end;
end;

end.
