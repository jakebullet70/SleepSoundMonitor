program sleeptimermonitor;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, MainForm, lazcontrols, runtimetypeinfocontrols,
  WinLightDarkTools,
  uDarkStyleParams,
  uDarkStyleSchemes,
  uMetaDarkStyle;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;

   { - DARK MODE START - }
  // By default this is set to pamForceLight
  PreferredAppMode := pamForceDark;
  // This doesn't work if the above is set to pamForceLight
  uMetaDarkStyle.ApplyMetaDarkStyle(DefaultDark);
  { -  DARK MODE END  - }

  // Form creation logic
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;


end.

