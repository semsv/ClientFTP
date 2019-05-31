unit Unit6;

interface

uses
  Classes, IdFTP, IdFTPList,IdTCPClient,
   IdComponent, IdTCPConnection, windows;

type
  TComand = (cmConnect, cmNothing, cmStop);
  TFTPCThread = class(TThread)
  private
    { Private declarations }
   First : Boolean;
  protected
    procedure Execute; override;
  public
   Process_CommandTime : Cardinal;
   TimeOut : Integer;
   Comand  : TComand;
   IdFTP   : TIdFTP;
   Ready   : Boolean;
   procedure OnStatus(ASender: TObject; const AStatus: TIdStatus; const AStatusText: string);
  end;

implementation
 uses Unit1;
{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TFTPCThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TFTPCThread }
procedure TFTPCThread.OnStatus(ASender: TObject; const AStatus: TIdStatus; const AStatusText: string);
begin
 with form1 do
  begin
   ListBox2.Items.Add(AStatusText);
   ListBox2.ItemIndex := ListBox2.Items.Count - 1;
  end; 

 if (AStatus = hsDisconnecting) or
    (AStatus = hsDisconnected) then {}
  Ready := true
end;

procedure TFTPCThread.Execute;
begin
  { Place thread code here }
 // comand := cmNothing;
 Ready := false; First := false;
 IdFTP.OnStatus := OnStatus;
 repeat
  if assigned(IdFTP) then
   begin
    if comand = cmConnect then
     begin
      try
       idFTP.Connect(True, TimeOut);
       finally
        comand := cmStop;
       end;
     end; 
   end;
 until (comand = cmStop); // До тех пока не выполнена команда
 Ready := true;
end;

end.

 