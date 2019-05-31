unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, Buttons;

type
  TForm5 = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure DriveComboBox1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5              : TForm5;
  _Copy_Files_Cancel : Boolean;
implementation

{$R *.dfm}

procedure TForm5.DriveComboBox1Change(Sender: TObject);
begin
 DirectoryListBox1.Drive := DriveComboBox1.Drive;
end;

procedure TForm5.SpeedButton2Click(Sender: TObject);
begin
 _Copy_Files_Cancel := true;
 close;
end;

procedure TForm5.SpeedButton1Click(Sender: TObject);
begin
 close
end;

end.
