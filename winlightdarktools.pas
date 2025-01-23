unit WinLightDarkTools;

{$mode ObjFPC}{$H+}

interface

uses
  //Classes, SysUtils;
  Win32Proc, Registry;


implementation

// https://icy.lt/post/lazarus-ide-and-your-program-in-dark-mode-on-microsoft-windows/

// IsDarkTheme: Detects if the Dark Theme (true) has been enabled or not (false)
function IsDarkTheme: boolean;
const
  KEYPATH = '\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize';
  KEYNAME = 'AppsUseLightTheme';

var
  LightKey: boolean;
  Registry: TRegistry;

begin
  Result := false;
  Registry := TRegistry.Create;
  try
        Registry.RootKey := HKEY_CURRENT_USER;
    if Registry.OpenKeyReadOnly(KEYPATH) then
      begin
        if Registry.ValueExists(KEYNAME) then
          LightKey := Registry.ReadBool(KEYNAME)
        else
          LightKey := true;
      end
    else
      LightKey := true;

    Result := not LightKey
  finally
    Registry.Free;
  end;
end;


end.

