unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ComCtrls, ShellCtrls;

type
  TForm3 = class(TForm)
    ShellTreeView1: TShellTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ShellTreeView1Collapsed(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
 uses Unit1;
{$R *.dfm}
 Var
  prev_Path : String;
procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
 Var
  ID : Integer;
begin
 ID := -1;
 if prev_Path[Length(prev_Path)] = '\' then
  Delete(prev_Path, Length(prev_Path), 1);
 if prev_Path <> ShellTreeView1.Path then
  ID := Application.MessageBox('Изменить директорию в которую'+#13+
          'буду скачиваться файлы ?' ,'Message !', MB_YESNO);
 if (ID = IDYES) or (ID = -1) then
  form1.edit2.Text := ShellTreeView1.Path;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
 try
  prev_Path := form1.edit2.Text;
  if DirectoryExists(prev_Path) then
   ShellTreeView1.Path := prev_Path;
 except
 end; {}
end;

procedure TForm3.ShellTreeView1Collapsed(Sender: TObject; Node: TTreeNode);
begin
Form3.ShellTreeView1.Refresh(Node);
end;

end.

