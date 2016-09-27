unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure PowerOff;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.PowerOff;
var
TTokenHd: THandle;
TTokenPvg: TTokenPrivileges;
cbtpPrevious: DWORD;
rTTokenPvg: TTokenPrivileges;
pcbtpPreviousRequired: DWORD;
tpResult: Boolean;
const
SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
begin
//===========Get privileges ==============//
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    begin
      tpResult := OpenProcessToken(GetCurrentProcess(),
        TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
          TTokenHd);
      if tpResult then
        begin
          tpResult := LookupPrivilegeValue(nil,SE_SHUTDOWN_NAME,
            TTokenPvg.Privileges[0].Luid);
          TTokenPvg.PrivilegeCount := 1;
          TTokenPvg.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
          cbtpPrevious := SizeOf(rTTokenPvg);
          pcbtpPreviousRequired := 0;
          if tpResult then
            Windows.AdjustTokenPrivileges(TTokenHd,False,TTokenPvg,
              cbtpPrevious,rTTokenPvg,pcbtpPreviousRequired);
        end;
    end;
//=============================================//
ExitWindowsEx(EWX_SHUTDOWN or EWX_POWEROFF, 0); //poweroff PC;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
a,b:string;
begin
  self.Label3.Caption:= TimeToStr(GetTime);  //get current time
  self.Label4.Caption:= TimeToStr(DateTimePicker1.Time - GetTime); //calk time at poweroff PC
  a:=TimeToStr(GetTime); //current time
  b:= TimeToStr(DateTimePicker1.Time); //powerOff time
  if a = b then  //current time=powerOff time
    begin
      PowerOFF;//shutDown
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
self.Timer1.Enabled:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
self.Timer1.Enabled:=false;
end;

end.
