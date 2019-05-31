unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Gauges, ExtCtrls, ComCtrls, Buttons;

type
  TForm2 = class(TForm)
    Gauge1: TGauge;
    Label1: TLabel;
    Lab_FileName: TLabel;
    Gauge2: TGauge;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Timer1: TTimer;
    Animate1: TAnimate;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2       : TForm2;
  CurProgress : Integer = 0;
implementation
 Uses math, Unit1;
{$R *.dfm}


procedure TForm2.Timer1Timer(Sender: TObject);
 Var
  Value : Integer;
begin
 Value := (Gauge2.Progress - CurProgress);
 if Value > 1024*1024 then
  Label5.Caption := FloatToStr(RoundTo((Value / (1024*1024)),-3)) +' Mb' else
 if Value > 1024 then
  Label5.Caption := FloatToStr(RoundTo((Value / 1024),-3))+ ' Kb' else
  Label5.Caption := IntToStr(Value) + ' B';
 CurProgress := Gauge2.Progress;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
//
 try
  Copy_Files_Cancel   := true;
  Upload_Files_Cancel := true;
  Form1.IdFTP1.Disconnect;
 finally
  if Copy_Files_Cancel then
   Form1.ListBox2.Items.Add('Операция отменена по желанию пользователя !');
  close;
 end;
end;

end.










