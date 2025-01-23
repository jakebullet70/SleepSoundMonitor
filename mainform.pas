unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, Windows;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    Bevel1: TBevel;
    btnEnd: TBitBtn;
    btnStartPause: TBitBtn;
    btnCloseClick: TBitBtn;
    lbl1: TStaticText;
    lblTime: TStaticText;
    Timer1: TTimer;

    procedure btnCloseClickClick(Sender: TObject);
    procedure btnEndClick(Sender: TObject);
    procedure btnStartPauseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);


  private

  public

  end;

var
  frmMain: TfrmMain;
  theTime: LongInt;
implementation

{$R *.lfm}

{ TfrmMain }



procedure TfrmMain.FormWindowStateChange(Sender: TObject);
begin
  ////case WindowState of
  ////  wsNormal: Application.Title := 'Normal';
  ////  wsMaximized: Application.Title := 'Maximized';
  ////  wsMinimized: Application.Title := 'Minimized';
  ////end;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  theTime:=theTime+100   ;
  lblTime.Caption := IntToStr(theTime);
end;

procedure TfrmMain.FormHide(Sender: TObject);
begin

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
     Timer1.Enabled:=false;
     Timer1.Interval:=5000;
//  btnClose.Caption := '&Close';
 // Constraints.MaxHeight := 600; constraints.MinHeight := 400;
 // Constraints.MaxWidth  := 600; Constraints.MinWidth := 400;

end;




procedure TfrmMain.btnCloseClickClick(Sender: TObject);
begin
  application.Terminate;
end;





procedure TfrmMain.btnEndClick(Sender: TObject);
begin
   Timer1.Enabled:=false;
   btnEnd.Enabled:=false;
end;

procedure TfrmMain.btnStartPauseClick(Sender: TObject);
begin
   Timer1.Enabled:=true;
   btnEnd.Enabled:=true;
end;







end.

