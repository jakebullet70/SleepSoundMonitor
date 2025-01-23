unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

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
  FTime: Int64;
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

var
  Hours, Minutes, Seconds: Integer;
begin
  //Inc(FTime); // Increment the time counter
  FTime := FTime + 1 ;//(Timer1.Interval / 1000)   ;

  // Calculate hours, minutes, and seconds
  Hours := FTime div 3600;
  Minutes := (FTime div 60) mod 60;
  Seconds := FTime mod 60;

  // Update the label to show the elapsed time
  lblTime.Caption := Format('%.2d:%.2d:%.2d', [Hours, Minutes, Seconds]);

end;

procedure TfrmMain.FormHide(Sender: TObject);
begin

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   Timer1.Enabled  := false;
   Timer1.Interval := 1000;
   lblTime.Caption := '00:00:00';
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
   FTime := 0;
   lblTime.Caption := '00:00:00';
end;

procedure TfrmMain.btnStartPauseClick(Sender: TObject);
begin
   Timer1.Enabled:=true;
   btnEnd.Enabled:=true;
end;







end.

