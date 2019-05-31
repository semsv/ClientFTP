unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdFTP, IdFTPList, ExtCtrls, ComCtrls, ImgList, Menus,
  TrayIcon, Buttons, ToolWin, IdEcho, IdWhois, IdGopher, IdRawBase,
  IdRawClient, IdIcmpClient;

const
 Set_Count_Scanner_Thread = 2;
{
type
 TWMSysCommand = packed record
    Msg: Cardinal;
    case CmdType: Longint of
      SC_HOTKEY: (
        ActivateWnd: HWND);
      SC_KEYMENU: (
        Key: Word);
      SC_CLOSE, SC_HSCROLL, SC_MAXIMIZE, SC_MINIMIZE, SC_MOUSEMENU, SC_MOVE,
      SC_NEXTWINDOW, SC_PREVWINDOW, SC_RESTORE, SC_SCREENSAVE, SC_SIZE,
      SC_TASKLIST, SC_VSCROLL: (
        XPos: Smallint;
        YPos: Smallint;
        Result: Longint);
  end; {}
 Type
  TPacket_Mess = record
   S1 : String;
   S2 : String;
   S3 : String;
   S4 : String;
   S5 : String;
   S6 : String;
   S7 : String;
  end;

type
  {--- ---}
  TForm1 = class(TForm)
    Panel1: TPanel;
    Btn_connect: TButton;
    Button2: TButton;
    Button6: TButton;
    ProgressBar1: TProgressBar;
    Panel2: TPanel;
    Label3: TLabel;
    Lab_ActiveHost: TLabel;
    ControlBar1: TControlBar;
    CoolBar2: TCoolBar;
    CoolBar3: TCoolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Panel3: TPanel;
    IdFTP1: TIdFTP;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N11: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N16: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    PopupMenu1: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    PopupMenu2: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    N17: TMenuItem;
    IdFTP2: TIdFTP;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    PopupMenu3: TPopupMenu;
    N15: TMenuItem;
    N14: TMenuItem;
    Timer_control_connect: TTimer;
    Panel4: TPanel;
    TreeView1: TTreeView;
    Panel5: TPanel;
    Label8: TLabel;
    ListBox2: TListBox;
    Edit2: TEdit;
    Button7: TButton;
    Button9: TButton;
    Label6: TLabel;
    Edit4: TEdit;
    Label9: TLabel;
    CheckBox1: TCheckBox;
    Panel6: TPanel;
    Edit_Curr_FTP_path: TEdit;
    Label4: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    ListView1: TListView;
    Panel9: TPanel;
    Panel10: TPanel;
    ListBox1: TListBox;
    Panel11: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Panel12: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel13: TPanel;
    TreeView2: TTreeView;
    Panel14: TPanel;
    Splitter3: TSplitter;
    Button8: TButton;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button5: TButton;
    Button3: TButton;
    Button1: TButton;
    Button4: TButton;
    FTP1: TMenuItem;
    procedure Btn_connectClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure IdFTP1AfterGet(ASender: TObject; VStream: TStream);
    procedure IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure memo1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure IdFTP2Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure N11Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure TreeView2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Timer_control_connectTimer(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure SpeedButton6Click(Sender: TObject);
    procedure IdEcho1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdIcmpClient1Status(ASender: TObject;
      const AStatus: TIdStatus; const AStatusText: String);
    procedure IdIcmpClient1Reply(ASender: TComponent;
      const AReplyStatus: TReplyStatus);
    procedure Edit_Curr_FTP_pathEnter(Sender: TObject);
    procedure FTP1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
    CURRENT_DATA_SIZE_OF_PUT_FILE : DWORD;
    PUT_FILE_IS_SERVER_CONNECT    : BOOLEAN;
    IS_OPERATION_PUT_FILE         : BOOLEAN;
    ALL_DATA_SIZE_OF_PUT_FILE     : DWORD;
    PUTFILENAME                   : STRING; // Имя файла который закачиваем на сервер
  public
    { Public declarations }
   //
   procedure WM_SYSCOMMAND_(Var WM_ : TWMSysCommand); message WM_SYSCOMMAND;
   Procedure OnLine_offLineTreeView (All_View : Boolean);
   Procedure HOST_Connected(Connected : Boolean; HOST : String);
   Procedure Decomposite_packet_mess(packet_mess : String; Var P_M     : TPacket_Mess);
   Procedure GetFTPList(idFTP : TIdFTP);
   Procedure START_FTPScaner;
   procedure Copy_File(Dest_FileName : String; Source_FileName : String);
   procedure Put_File(Source_FileName : String; Put_FileName : String);
  end;

var
  Form1               : TForm1;
  Copy_Files_Cancel   : Boolean;
  Upload_Files_Cancel : Boolean;

implementation
 uses IdFTPCommon, Math, Unit2, Unit3, Unit4, Unit5, Unit6;
{$R *.dfm}
//
 Var
  Stopped_Scanning : Boolean = true;
  A                : TFTPCThread;
//

procedure TForm1.WM_SYSCOMMAND_(Var WM_ : TWMSysCommand); 
begin
 //
 case WM_.CmdType of
  SC_CLOSE : begin

              WM_.CmdType := SC_MINIMIZE;
              inherited;

              TrayIcon1.FormVisible := false;
              TrayIcon1.AppVisible  := false;

              exit;
             end;
  SC_MINIMIZE : begin
                 inherited;
                 TrayIcon1.FormVisible := false;
                 TrayIcon1.AppVisible  := false;
                 Exit;
                end;
 end;
 inherited;
end;

//
Function DelChar(Ch : Char; S : String) : String;
 Var
  I : Integer;
begin
 I := 1;
 While I <= Length(S) do
  begin
   If S[I] = CH then
    Delete(S, I, 1) else I := I + 1;
  end;
 result := S;
end;

Function Find_TreeNode (S : String; Tree : TTreeNode) : Boolean;
 Var
  I : Integer;
begin
 Result := false;
 //
 For I := 0 to Tree.Count - 1 do
  begin
   //
   if UpperCase(S) = UpperCase(Tree.Item[I].Text) then
    begin
     Result := true;
     break;
    end;
  end;
 //
end;

Procedure AddPath_TreeView(HOST : String; Login : String; Full_SL : TStringList);
 Var
  S, S1  : String;
  I      : Integer;
  Rnode  : TTreeNode;
  node   : TTreeNode;
  J      : Integer;
  Find   : Boolean;
  Str    : String;
  P_M    : TPacket_mess;
  v_HOST : String;
begin
//
 Find   := FALSE; node := nil;
 v_HOST := HOST;
 if (Length(Login) > 0) and (Login <> 'Anonymous') then
  begin
    insert(Login+'@', v_HOST, 1);
  end;
{--- ---}
 with Form1 do
 For J := 0 to TreeView1.Items.Count - 1 do
  begin
   S := TreeView1.Items.Item[J].Text;
   if UpperCase(S) = UpperCase(v_HOST) then
    begin
     node := TreeView1.Items.Item[J];
     TreeView1.Items.Item[J].SelectedIndex := 2; // onLine
     TreeView1.Items.Item[J].StateIndex    := 2;
     TreeView1.Items.Item[J].ImageIndex    := 2;
     Find := true;
     break;
    end;
  end;  (**)
 {--- ---}

 if not Find then
  begin
   node := Form1.TreeView1.Items.Add(nil, v_HOST);
   node.SelectedIndex := 2; // onLine
   node.StateIndex    := 2;
   node.ImageIndex    := 2;
  end;

 if (Form1.TreeView1.Selected <> nil) and Find and
     Stopped_Scanning then
  node := Form1.TreeView1.Selected;

 For I := 0 to Full_Sl.Count - 1 do
  begin
   S := Full_Sl.Strings[I];
   if UpperCase(S[1]) = UpperCase('d') then
    begin
     //
     with form1 do
      begin
       //

       Str := Full_SL.Strings[I];
       Decomposite_packet_mess(Str , P_M);
       S1 := P_M.S7;
{
       S1  := Copy(Str, 55, (Length(Str) - 55) + 1);
       if S1 <> '' then
        While (S1[1] = ' ') do Delete(S1, 1, 1); {}

       if (s1 <> '.') and (s1 <> '..') then
        begin
         try
          if not Find_TreeNode(S1, node) then
           begin
            Rnode := TreeView1.Items.AddChild(node, S1);
            Rnode.SelectedIndex  := 0;
            Rnode.ImageIndex     := 0;
           end; 
          except
           raise;
          end;
        end;
      end;
    end; 
  end;
end;

Function CopyTo_(S : String; StopChar : Char) : String;
 Var
  I  : Integer;
  S1 : String;
begin
//
 S1 := '';
 For I := 1 to Length(S) do
  if S[I] = StopChar then break else S1 := S1 + S[I];
 result := S1; 
end;

Procedure TForm1.Decomposite_packet_mess(packet_mess : String; Var P_M : TPacket_Mess);
 Var
  S       : String;
  S1      : String;
begin
//
 S := packet_mess;
//
      S1 := CopyTo_(S, ' ');    // копируем до пробела
      Delete(S, 1, Length(S1)); // удаляем из исх. стр. то что скопировали
      if S <> '' then
        While (S[1] = ' ') do Delete(S, 1, 1); // удаляем все пробелы до первого символа
      P_M.S1 := S1; // Атрибуты
      //
      S1 := CopyTo_(S, ' ');    // копируем до пробела
      Delete(S, 1, Length(S1)); // удаляем из исх. стр. то что скопировали
      if S <> '' then
        While (S[1] = ' ') do Delete(S, 1, 1); // удаляем все пробелы до первого символа
      P_M.S2 := S1;
      //
      S1 := CopyTo_(S, ' ');    // копируем до пробела
      Delete(S, 1, Length(S1)); // удаляем из исх. стр. то что скопировали
      if S <> '' then
        While (S[1] = ' ') do Delete(S, 1, 1); // удаляем все пробелы до первого символа
      P_M.S3 := S1;
      //
      S1 := CopyTo_(S, ' ');    // копируем до пробела
      Delete(S, 1, Length(S1)); // удаляем из исх. стр. то что скопировали
      if S <> '' then
        While (S[1] = ' ') do Delete(S, 1, 1); // удаляем все пробелы до первого символа
      P_M.S4 := S1;
      //
      S1 := CopyTo_(S, ' ');    // копируем до пробела
      Delete(S, 1, Length(S1)); // удаляем из исх. стр. то что скопировали
      if S <> '' then
        While (S[1] = ' ') do Delete(S, 1, 1); // удаляем все пробелы до первого символа
      P_M.S5 := S1; // Размер
      //
      S1 := Copy(S, 1, 12);     // копируем 12 символов
      Delete(S, 1, Length(S1)); // удаляем из исх. стр. то что скопировали
      if S <> '' then
        While (S[1] = ' ') do Delete(S, 1, 1); // удаляем все пробелы до первого символа
      P_M.S6 := S1; // Дата создания
      //
      P_M.S7 := S;  // Имя файла
      //
end;

Procedure TForm1.GetFTPList(idFTP : TIdFTP);
 Var
  P_M     : TPacket_Mess;
  I       : Integer;
//
  Full_SL : TStringList;
  S       : String;
  Val     : DWORD;
//
begin
//
 if not IdFTP.Connected then exit;
// SL      := TStringList.Create;
 Full_SL := TStringList.Create;
//
 IdFTP.List(Full_SL, '', true);
//
 AddPath_TreeView(IdFTP.Host, IdFTP.Username, Full_SL);
//
// IdFTP.List(SL     , '', true);
//
 ListView1.Items.Clear;
 For I := 0 to Full_SL.Count - 1 do
  begin
   S := Full_SL.Strings[i];
   ListBox2.Items.Add(S);
   ListBox2.ItemIndex := ListBox2.Items.Count - 1;
   if s <> '' then
    if s[1] <> 'd' then
     begin
      Decomposite_packet_mess(S, P_M);
      ListView1.Items.Add;
      with ListView1.Items do
       ListView1.Items.Item[Count - 1].Caption := P_M.S7; {}

      S   := P_M.S5;
      Val := Strtointdef(S , 0);

      if IS_OPERATION_PUT_FILE AND (UPPERCASE(PUTFILENAME) = UPPERCASE(P_M.S7)) then
      begin
        ALL_DATA_SIZE_OF_PUT_FILE := VAL;
      end;

      if Val > 1024*1024 then
       S := FloatToStr(RoundTo(Val/(1024*1024), -3)) + ' Mb' else
      if Val > 1024 then
       S := IntToStr(Val  div 1024 ) + ' Kb' else
       S := IntToStr(Val) + ' bytes';

      with ListView1.Items do
       ListView1.Items.Item[Count - 1].SubItems.Add(S);
      with ListView1.Items do
       ListView1.Items.Item[Count - 1].SubItems.Add(P_M.S6);
      with ListView1.Items do
       ListView1.Items.Item[Count - 1].SubItems.Add(P_M.S1); (**)
     end;

  end;
end;

 Type
  TArrCifHostIP = Array [1..4] of Byte;
Function ExtractCifArr(HostIp : String; Var ArrCifHostIP : TArrCifHostIP) : Boolean;
 Var
  S, S1   : String;
  I       : integer;
  ABegCif : TArrCifHostIP;
begin
//
 Result := false;
//
 S := HostIP;
 I := 1;
 While (I <= 4) do
  begin
   S1 := Copy(S, 1, Pos('.' , S) - 1);
   If (S1 = '') then S1 := S;
   If (S1 = '') then Break;
   ABegCif[I] := StrToIntDef(S1, 0);
   If (S1[1] <> '0') and (ABegCif[I] = 0) then Break;
   If Pos('.', S) <> 0 then
    Delete(S, 1, Pos('.' , S)) else
    break;
   I := I + 1;
  end;
 if I = 4 then Result := true; 
 ArrCifHostIP := ABegCif;
end;

Procedure HostEnum(RangeHostIP : String; LS : TStrings);
 Var
  BegHostIP : String;
  EndHostIP : String;
//
  ABegCif   : TArrCifHostIP;
  AEndCif   : TArrCifHostIP;
//
  S         : String;
  I         : Integer;
  Error     : Boolean;
  SCH       : Integer;
  a2, a3, a4 : Integer;
  D : Boolean;
  abs_count : integer;
begin
//
 S := DelChar(' ',RangeHostIP);
 BegHostIP := Copy(S, 1, Pos('-' , S)-1);
 Delete(S, 1,  Pos('-' , S));
 EndHostIP := S;
//
 if not ExtractCifArr(BegHostIp, ABegCif) then exit;
//
 if not ExtractCifArr(EndHostIp, AEndCif) then exit;
//
 abs_count := 0;
 Error := false;
 For I := 1 to 4 do
  begin
   if ABegCif[I] > AEndCif[I] then
    begin
     Error := true;
     break;
    end;
  end;
 IF Error then exit;


 // a1 := ABegCif[1];
 a2 := ABegCif[2];
 a3 := ABegCif[3];
 a4 := ABegCif[4];
 I := 4; D := true;
 While I >= 2 do
  begin
   //

   //
   if (Assigned(LS)) and d  then
    begin
     S := Inttostr(ABegCif[1])  + '.'+
          IntToStr(ABegCif[2])  + '.'+
          IntToStr(ABegCif[3])  + '.'+
          IntToStr(ABegCif[4]);
      if LS.IndexOf(S) = -1 then LS.Add(S);
      abs_count := abs_count + 1;
    end; // if Assigned(LS) then

   SCH := ABegCif[I];
   While (SCH < AEndCif[I]) do
    begin
     //
     INC(SCH);
     If (I < 4) then
      begin
       ABegCif[I] := SCH;
       Case I+1 of
        2: begin
            ABegCif[2] := a2;
            ABegCif[3] := a3;
            ABegCif[4] := a4;
           end;
        3: begin
            ABegCif[3] := a3;
            ABegCif[4] := a4;
           end;
        4: begin
            ABegCif[4] := a4;
           end;
       end; // case
       I := I + (4-I);
       D := true;
       Break;
      end; // if
     D := false;
     if Assigned(LS) then
      begin
       CASE I of
         {--- ---}
        1: S := IntToStr(SCH)        + '.'+
                IntToStr(ABegCif[2])     + '.'+
                IntToStr(ABegCif[3])     + '.'+
                IntToStr(ABegCif[4]);
         {--- ---}
        2: S := IntToStr(ABegCif[1]) + '.'+
                IntToStr(SCH)            + '.'+
                IntToStr(ABegCif[3])     + '.'+
                IntToStr(ABegCif[4]);
         {--- ---}
        3: S := IntToStr(ABegCif[1]) + '.'+
                IntToStr(ABegCif[2])     + '.'+
                IntToStr(SCH)            + '.'+
                IntToStr(ABegCif[4]);
         {--- ---}
        4: S := IntToStr(ABegCif[1]) + '.'+
                IntToStr(ABegCif[2])     + '.'+
                IntToStr(ABegCif[3])     + '.'+
                IntToStr(SCH);
       end; // Case

       if LS.IndexOf(S) = -1 then LS.Add(S);
       abs_count := abs_count + 1;
      end; // if Assigned(LS) then
      if abs_count > 100000 then break;
    end;  // While (SCH < AEndCif[I]) do
   I := I - 1;
   if abs_count > 100000 then break;
  end; // While I >= 1 do
 Sleep(0);
end;



Procedure TForm1.START_FTPScaner;
 Procedure THREAD_Create;
 begin
  A         := TFTPCThread.Create(TRUE);
  A.Comand  := cmNothing;
  //
  A.IdFTP           := TIdFTP.Create(self);
  A.IdFTP.Host      := IdFTP1.Host;
  A.IdFTP.Username  := IdFTP1.Username;
  A.IdFTP.Port      := IdFTP1.Port;
  A.IdFTP.Password  := IdFTP1.Password;
  A.IdFTP.OnStatus  := IdFTP1.OnStatus;
  //
  A.TimeOut := Form4.SpinEdit1.Value;
  A.FreeOnTerminate := false;
  Sleep(1);
 end;
 Var
  I  : Integer;
  S  : String;
//  t1 : Cardinal;
// at : Cardinal;
//  connect : Boolean;
begin
 ProgressBar1.Step     := 1;
 ProgressBar1.Min      := 0;
 ProgressBar1.Max      := ListBox1.Items.Count;
 ProgressBar1.Position := 0;

try
 Timer_control_connect.Enabled := false;
 Timer1.Enabled                := false; // отключаем на время таймер опроса
 //
 For I := 0 to ListBox1.Items.Count - 1 do
  begin
   Application.ProcessMessages;
   if Stopped_Scanning then break;
   //
    THREAD_Create;
    A.IdFTP.Host := ListBox1.Items.Strings[i];
   //
   try
      A.Resume;
      Application.ProcessMessages;
      While (not A.Ready) do
       begin
        A.Comand := cmConnect;
        S := listBox2.Items.Strings[listBox2.Items.Count - 1];
        if (not A.Ready) and (POS('Connected', S) <> 0) then
        if pos('\', S) <> 0 then
         begin
          Delete(S, pos('\', S), 1);
          S := S + '/';
         end else
        if  pos('/', S) <> 0 then
         begin
          Delete(S, pos('/', S), 1);
          S := S + '\';
         end else
         begin
          S := S + '/';
         end;
        listBox2.Items.Strings[listBox2.Items.Count - 1] := S;
        Application.ProcessMessages;
        Sleep(50);
        if Stopped_Scanning then break;
       end;
      //
      if Stopped_Scanning then
       begin
        //
        break;
       end;

     // IdFTP1.Connect(true, Form4.SpinEdit1.Value);
     GetFTPList(A.IdFTP);
     except
      //
     end;
    
    //
   ProgressBar1.Position := ProgressBar1.Position + 1;
   HOST_Connected(A.IdFTP.Connected, A.IdFTP.Host);
    // (**)
   Application.ProcessMessages;
   if Stopped_Scanning then break;
   A.Terminate;
  end;

 finally
  //
  A.IdFTP.Disconnect;
  A.Terminate;
  Timer_control_connect.Enabled := true;
  Timer1.Enabled                := true;
 end;
end;

Procedure TForm1.HOST_Connected(Connected : Boolean; HOST : String);
 Var
  J      : Integer;
  node   : TTreeNode;
  Find   : Boolean;
begin
//
 if Connected then
  begin
   Lab_ActiveHost.Caption  := Host;
   Panel2.Color            := clLime;
   Edit_Curr_FTP_path.Text := 'ftp://' + HOST + '/';
   Find := false;
   //
   For J := 0 to TreeView1.Items.Count - 1 do
    begin

     if (UpperCase(
          DelChar(' ',TreeView1.Items[J].Text)) =
         UpperCase(
          DelChar(' ',HOST))
         ) and
        (TreeView1.Items[J].Level = 0) then
      begin
       TreeView1.Items[J].StateIndex    := 2;
       TreeView1.Items[J].ImageIndex    := 2;
       TreeView1.Items[J].SelectedIndex := 2;
       Find := true;
       break;
      end;
    end;

    if not Find then
     begin
      node := TreeView1.Items.Add(nil, Host);
      node.StateIndex    := 2;
      node.ImageIndex    := 2;
      node.SelectedIndex := 2;
     end;
   //

   Find := false;
   For J := 0 to TreeView2.Items.Count - 1 do
    begin
     if (TreeView2.Items[J].Text = HOST) then
      begin
       TreeView2.Items[J].StateIndex    := 2;
       TreeView2.Items[J].ImageIndex    := 2;
       TreeView2.Items[J].SelectedIndex := 2;
       Find := true;
       break;
      end;
    end;

    if not Find then
     begin
      node := TreeView2.Items.Add(nil, Host);
      node.StateIndex    := 2;
      node.ImageIndex    := 2;
      node.SelectedIndex := 2;
     end;
  end else
  begin
   Lab_ActiveHost.Caption  := '';
   Panel2.Color            := clSilver;
   Edit_Curr_FTP_path.Text := 'ftp://' + HOST + '/';
   Find := false;
   J := 0;
   While J <= TreeView1.Items.Count - 1 do
    begin
     if (TreeView1.Items[J].Text = HOST) and
        (TreeView1.Items[J].Level = 0) then
      begin
       TreeView1.Items[J].StateIndex    := 1;
       TreeView1.Items[J].ImageIndex    := 1;
       TreeView1.Items[J].SelectedIndex := 1;
       Find := true;
       break;
      end;
     J := J + 1;
    end;

    if (not Find) and (not RadioButton1.Checked) then
     begin
      node := TreeView1.Items.Add(nil, Host);
      node.StateIndex    := 1;
      node.ImageIndex    := 1;
      node.SelectedIndex := 1;
     end;
   //////////////////////////////////
   Find := false;
   J := 0;
   While J <= TreeView2.Items.Count - 1 do
    begin
     if (TreeView2.Items[J].Text = HOST) then
      begin
       if RadioButton1.Checked then
        begin
         TreeView2.Items.Delete(TreeView2.Items[J]);
        end else
        begin
         TreeView2.Items[J].StateIndex    := 1;
         TreeView2.Items[J].ImageIndex    := 1;
         TreeView2.Items[J].SelectedIndex := 1;
        end;
       Find := true;
       break;
      end;
     J := J + 1;
    end;

    if (not Find) and (not RadioButton1.Checked) then
     begin
      node := TreeView2.Items.Add(nil, Host);
      node.StateIndex    := 1;
      node.ImageIndex    := 1;
      node.SelectedIndex := 1;
     end;
  end;
end;

procedure TForm1.Btn_connectClick(Sender: TObject);
 Var
  HostIp : String;
  pass   : String;
  Ind    : Integer;
//
begin
 if TreeView1.Selected <> nil then TreeView1.Selected := nil;
 Timer1.Enabled := false;
try

 Ind    := ListBox1.ItemIndex;
 if (Ind <> -1) and (not CheckBox1.Checked) then
  HostIp := ListBox1.Items.Strings[Ind] else
 if (edit4.Text <> '') and CheckBox1.Checked then
  HostIp := edit4.Text else exit;
// upload@87.224.219.60
// prog_man:1@87.224.219.86
pass := '';
// удаляем то что нам не нужно:
 if pos('ftp://', HOSTIP) <> 0 then
 begin
   delete(HOSTIP, pos('ftp://', HOSTIP), length('ftp://'));
 end;
//
 if POS('@', HOSTIP) <> 0 then
  begin
   //
   if POS(':', HOSTIP) <> 0 then
    begin
     pass := Copy(HOSTIP, POS(':', HOSTIP) + 1, (POS('@', HOSTIP) - POS(':', HOSTIP)) - 1);
     Delete(HOSTIP, POS(':', HOSTIP), Length(pass) + 1);
    end;
   //
   IdFTP1.Password := pass;
   IdFTP1.Username := Copy(HOSTIP, 1, POS('@', HOSTIP) - 1);
   Delete(HOSTIP, 1, POS('@', HOSTIP));
  end else
  begin
   IdFTP1.Username := 'Anonymous';
  end;

 IdFTP1.Host := HostIp;

   try
    if IdFTP1.Connected then IdFTP1.Disconnect;
    Application.ProcessMessages;
    IdFTP1.Connect(true, 60050);
    if IdFTP1.Connected then
      begin
        edit_curr_ftp_path.Text := edit4.Text;
      end;
    GetFTPList(IdFTP1);
   except
    //
   end;
 //
 HOST_Connected(IdFTP1.Connected, idFTP1.Host);
 //
 finally
  Timer1.Enabled := true;
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 IdFTP1.Disconnect;
 Lab_ActiveHost.Caption := '';
 Panel2.Color           := clSilver;
end;

 Var
  ADest    : TFileStream = nil;
  ASize    : Integer = 0;

procedure TForm1.IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: String);
begin
//
 ListBox2.Items.Add(AStatusText);
 ListBox2.ItemIndex := ListBox2.Items.Count - 1;

 if AStatus = hsDisconnected then
  begin
   //
  end;

 if AStatus = ftpTransfer then
  begin
   //
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 HostEnum(Edit1.Text, ListBox1.Items);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
//
 while not Stopped_Scanning do ;
 Stopped_Scanning := false;
 START_FTPScaner;
 Stopped_Scanning := true;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 ListBox1.Items.Clear;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 ListBox2.Items.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Application.ProcessMessages;
 OnLine_offLineTreeView(RadioButton2.Checked);
 button3.Click;
end;

Function GetFullPath(Selected : TTreeNode) : String;
 Var
  node : TTreeNode;
  Path : String;
begin
 Path   := '';
 result := Path;
 if Selected = nil then exit;

 Path := Selected.Text;
 delete(Path, 1, POS('@', Path));
 node := Selected;
 While (node.Parent <> nil) do
  begin
   if (node.Parent <> nil) then
    Insert(node.Parent.Text+'/', Path, 1);
   node := node.Parent; 
  end;

 result := Path; 
end;

procedure TForm1.TreeView1Click(Sender: TObject);
 Var
  node : TTreeNode;
begin
//
 node := TreeView1.Selected;
 if node = nil then exit;
 if node.Level <> 0 then exit;
 Edit4.Text         := node.Text;
 checkbox1.Checked  := true;
end;

Function Parent_Ind (Selected : TTreeNode) : Integer;
begin
 result := -1;
 if Selected = nil then exit;
 if Selected.Parent <> nil then
  result := Selected.Parent.Index;
end;

procedure TForm1.TreeView1DblClick(Sender: TObject);
 Var
  SelNode : TTreeNode;
  S       : String;
  SelHost : String;
begin
 if not Stopped_Scanning then exit;
 if not IdFTP1.Connected then
  begin
   exit;
  end;

 SelNode := TreeView1.Selected;

 SelHost := '';

 S := GetFullPath(SelNode);
 if POS('/', S) <> 0 then
  begin
   SelHost := Copy(S, 1, POS('/', S)-1);
   delete(S,1, POS('/', S));
  end;

 if SelHost = '' then exit;
 delete(SelHost, 1, pos('@', SelHost));
// messagebox(0, PCHAR(SelHOST + IdFTP1.HOST), PCHAR(S), 0);
 IdFTP1.ChangeDir('/');
 if (S <> IdFTP1.Host)
     and (SelHOST = IdFTP1.HOST) then
  begin
   IdFTP1.ChangeDir(S);
   GetFTPList(IdFTP1);
  end; 

  S := 'ftp://'+IdFTP1.Host+'/'+ S;
  Edit_Curr_FTP_path.Text := S;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Stopped_Scanning := true;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.IdFTP1AfterGet(ASender: TObject; VStream: TStream);
begin
//
end;

procedure TForm1.IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
Var
 R : Real;
begin
//
 try
  if Copy_Files_Cancel then IdFTP1.Abort;
  except
  end;
 ASize := ASize + 1;

 R := AWorkCount;
 if PUT_FILE_IS_SERVER_CONNECT AND IS_OPERATION_PUT_FILE then
 begin
   if AWorkMode = wmWrite
     then
   CURRENT_DATA_SIZE_OF_PUT_FILE := AWorkCount;
   form2.Label7.caption          := FormatFloat('##,###,##', (ALL_DATA_SIZE_OF_PUT_FILE + AWorkCount) / 1024.00)+ ' K';
   Form2.Gauge2.Progress         := (ALL_DATA_SIZE_OF_PUT_FILE + AWorkCount);
 end else
 if not IS_OPERATION_PUT_FILE then
 begin
   form2.Label7.caption  := FormatFloat('##,###,##', R / 1024.00)+ ' K';
   Form2.Gauge2.Progress := AWorkCount;
 end;

 Application.ProcessMessages;
end;

procedure TForm1.memo1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//
end;

procedure TForm1.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
// form1.Caption := Item.Caption;
end;

procedure TForm1.N9Click(Sender: TObject);
 Var
  FileName : String;
  ID       : Integer;
begin
 SaveDialog1.Filter := 'Text|*.txt|Any files |*.*|';
 if not SaveDialog1.Execute then exit;
 FileName := SaveDialog1.FileName;
 ID := -1;
 if FileExists(FileName) then
  ID := Application.MessageBox('Указанный файл существует'+#13+
         'Вы желаете заменить его ?' ,'Warring !', MB_YESNO);
 if (ID = IDYES) or (ID = -1) then
  TreeView1.SaveToFile(FileName);
end;

procedure TForm1.N10Click(Sender: TObject);
 Var
  FileName : String;
begin
 OpenDialog1.Filter := 'Text|*.txt|Any files |*.*|';
 if not OpenDialog1.Execute then exit;
 FileName := OpenDialog1.FileName;
 TreeView1.LoadFromFile(FileName);
end;

procedure TForm1.Copy_File(Dest_FileName : String; Source_FileName : String);
 Var
  Ahandle      : Cardinal;
  create_d     : Cardinal;
  restore_copy : boolean;
  dlg_res      : integer;
begin
//
 if FileExists(Dest_FileName) then
  create_d := OPEN_EXISTING else
  create_d := CREATE_NEW;

 Ahandle := CreateFile(PChar(Dest_FileName), GENERIC_READ or GENERIC_WRITE,
             {FILE_SHARE_DELETE or{} FILE_SHARE_READ or FILE_SHARE_WRITE,
             nil, create_d{}, FILE_ATTRIBUTE_NORMAL, 0);
 //
 if (Ahandle = 0) or (Ahandle = INVALID_HANDLE_VALUE) then Exit;
 try
  ADest        := TFileStream.Create(Ahandle);
  restore_copy := false;
  if ADest.Size > 0 then
    begin
      dlg_res := MessageDlg('Файл приемник не пустой, ' + chr(13) +
        'Хотите продолжить прерванное скачивание, нажмите "Yes", ' + chr(13) +
        'Иначе нажмите "No" (тогда закачка файла начнется сначала)?',
        mtWarning,
        [mbYes, mbNo],
        0);
      // MessageBox(form1.Handle, pchar(inttostr(dlg_res)), 'Вот что Вы выбрали:', 0);
      if (dlg_res  =  6) then
        begin
          ADest.Seek(ADest.Size, 0);
          restore_copy := true;
        end;
    end;
  try
   if IdFTP1.Connected then
    IdFTP1.Get(Source_FileName, ADest, restore_copy);
   except
    on E : exception do
    begin
     //
     ListBox2.Items.Add(E.Message);
    end;
   end;

 finally
  if (Ahandle = 0) or (Ahandle = INVALID_HANDLE_VALUE) then else
   begin
    try
      //
     finally
      CloseHandle(AHandle);
      ADest := nil;
     end;
   end;
 end;
end;

procedure TForm1.Put_File(Source_FileName : String; Put_FileName : String);
 Var
  Ahandle      : Cardinal;
  create_d     : Cardinal;
  AApend       : boolean;
  dlg_res      : integer;
  A            : DWORD;
begin
//
 if FileExists(Source_FileName) then
  create_d := OPEN_EXISTING else
  exit;

 Ahandle := CreateFile(PChar(Source_FileName), GENERIC_READ,
             {FILE_SHARE_DELETE or{} FILE_SHARE_READ,
             nil, create_d{}, FILE_ATTRIBUTE_NORMAL, 0);
 //
 CURRENT_DATA_SIZE_OF_PUT_FILE := 0;
 IS_OPERATION_PUT_FILE         := true;
 Form2.Gauge2.Progress         := 0;
 Upload_Files_Cancel           := false;
 //
 if (Ahandle = 0) or (Ahandle = INVALID_HANDLE_VALUE) then Exit;
 try
   ADest                  := TFileStream.Create(Ahandle);
   AApend                 := false;
   Form2.Gauge2.MaxValue  := ADest.Size;
   A                      := CURRENT_DATA_SIZE_OF_PUT_FILE;
   PUTFILENAME            := Put_FileName;

   WHile A < ADest.Size do
   begin
     if Upload_Files_Cancel then break;
     try
     Btn_connectClick(self);
     sleep(500);
     Application.ProcessMessages;
{}
     A :=  ALL_DATA_SIZE_OF_PUT_FILE;
     if (A > 0) and (A < ADest.Size) and not AApend then
     begin
       dlg_res := MessageDlg('Файл приемник не пустой, ' + chr(13) +
        'Хотите продолжить прерванное скачивание, нажмите "Yes", ' + chr(13) +
        'Иначе нажмите "No" (тогда закачка файла начнется сначала)?',
        mtWarning,
        [mbYes, mbNo],
        0);
      // MessageBox(form1.Handle, pchar(inttostr(dlg_res)), 'Вот что Вы выбрали:', 0);
      if (dlg_res  =  6) then
        begin
          ADest.Seek(A, soFromBeginning);
          AApend := true;
        end;
     end else
     if (A > 0) and (A < ADest.Size) and AApend then
     begin
       ADest.Seek(A, soFromBeginning);
       AApend := true;
     end else
     if (A = ADest.Size) and not AApend then
     begin
       dlg_res := MessageDlg('Файл приемник на сервере совпадает по размеру с файлом источником, ' + chr(13) +
        'Хотите все равно заменить, тогда нажмите "Yes", ' + chr(13) +
        'Иначе нажмите "No" (тогда закачка файла не начнется)?',
        mtWarning,
        [mbYes, mbNo],
        0);
       if (dlg_res  =  6) then
        begin
          A := 0;
          ADest.Seek(0, soFromBeginning);
          AApend := false;
          ALL_DATA_SIZE_OF_PUT_FILE := A;
        end else break;
     end else
     if (A = 0) and not AApend then
     begin
       A := 0;
       ADest.Seek(0, soFromBeginning);
       AApend := false;
       ALL_DATA_SIZE_OF_PUT_FILE := A;
     end else
     if (A > ADest.Size) then
     begin
       A := 0;
       ADest.Seek(0, soFromBeginning);
       AApend := false;
       ALL_DATA_SIZE_OF_PUT_FILE := A;
     end else
     break;
{}
        if IdFTP1.Connected then
        begin
          Form2.Show;
          PUT_FILE_IS_SERVER_CONNECT := true;
        end;
        Application.ProcessMessages;
        IdFTP1.Put(ADest, Put_FileName, AApend);
        sleep(300);
        Application.ProcessMessages;
      except
        on E : exception do
          begin
            ListBox2.Items.Add(E.Message);
          end;
      end;
      AApend       := true;
      A            := A + CURRENT_DATA_SIZE_OF_PUT_FILE;
      ALL_DATA_SIZE_OF_PUT_FILE := A;
   end;

 finally
  Form2.Hide;
  IS_OPERATION_PUT_FILE         := false;
  PUT_FILE_IS_SERVER_CONNECT    := false;
  Upload_Files_Cancel           := false;
  PUTFILENAME                   := '';
  ALL_DATA_SIZE_OF_PUT_FILE     := 0;
  CURRENT_DATA_SIZE_OF_PUT_FILE := 0;

  if (Ahandle = 0) or (Ahandle = INVALID_HANDLE_VALUE) then else
   begin
    try
      //
     finally
      CloseHandle(AHandle);
      ADest := nil;
     end;
   end;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
 Var
  I  : Integer;
  FN : String;
  FC : Integer; // File Count
  S  : String;
  Source_Path : String;
begin
//
try
Timer_control_connect.Enabled := false;
Timer1.Enabled := false;
//
 _Copy_Files_Cancel := false;
 form5.DirectoryListBox1.Directory :=  form3.ShellTreeView1.Path;
 form5.ShowModal;
 if _Copy_Files_Cancel then exit;

 if not idFtp1.Connected then
  begin
   //
   idFtp1.Connect(true, 1000);
   Application.ProcessMessages;
   if not idFtp1.Connected then
    begin
      Application.MessageBox('not Connected !', 'Error !',0);
      exit;
    end else
    TreeView1DblClick(nil);
  end;
//
 Source_Path := edit2.Text;
 if not DirectoryExists(Source_Path) then
  begin
   Source_Path := form5.DirectoryListBox1.Directory;
   if not DirectoryExists(Source_Path) then
     begin
       Application.MessageBox('Source Directory not Exists !', 'Error !',0);
       exit;
     end else
     begin
       edit2.Text  := Source_Path;
     end;
  end;
//
 if Source_Path[Length(Source_Path)] <> '\' then
  Source_Path := Source_Path + '\';
//
 Form2.Show;
 FC := 0;
 For I := 0 to ListView1.Items.Count - 1 do
  begin
   //
   if ListView1.Items.Item[I].Checked then
    begin
     FN := ListView1.Items.Item[I].Caption;
     FC := FC + 1;
    end;
  end;
 Form2.Gauge1.MinValue := 0;
 Form2.Gauge1.MaxValue := FC;
 Form2.Gauge1.Progress := 0;
 //
 Copy_Files_Cancel := false;
 //
 For I := 0 to ListView1.Items.Count - 1 do
  begin
   //
   if ListView1.Items.Item[I].Checked then
    begin
     Form2.Gauge2.MinValue := 0;
     FN := ListView1.Items.Item[I].Caption; //asdf//
     if ListView1.Items.Item[I].SubItems.Count > 0 then
     S := ListView1.Items.Item[I].SubItems.Strings[0] else
     S := '';

     if Pos('Kb' , S) <> 0 then
      begin
       Delete(S, Pos('Kb' , S), 2);
       S := FloatToStr(StrToFloat(S)*1024);
      end;

     if Pos('Mb' , S) <> 0 then
      begin
       Delete(S, Pos('Mb' , S), 2);
       S := FloatToStr(StrToFloat(S)*1024*1024);
      end;

     if Pos('bytes' , S) <> 0 then
      Delete(S, Pos('bytes' , S), 5);

     Form2.Gauge2.MaxValue := Round(StrToFloat(S));
     Form2.Gauge2.Progress := 0;
     CurProgress           := 0;
     Form2.Timer1.Enabled := true;
     Form2.Animate1.Active := true;
     //
     Form2.Lab_FileName.Caption := FN;
     if Copy_Files_Cancel then break;
      Copy_File(Source_Path + FN, FN);
     if Copy_Files_Cancel then break;
     //
     Form2.Animate1.Active := false;
     Form2.Timer1.Enabled := false;
     Form2.Gauge1.Progress := Form2.Gauge1.Progress + 1;
    end;
  end;

 finally
  Timer1.Enabled := true;
  Timer_control_connect.Enabled := true;
  Form2.Hide;
 end;

end;

procedure TForm1.Button7Click(Sender: TObject);
begin
//
Form3.Show;
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin
 Listbox1.ItemIndex := -1;
end;

procedure TForm1.IdFTP2Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: String);
begin
//
end;

procedure TForm1.N11Click(Sender: TObject);
begin
//
 Form4.ShowModal;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
 Var
  Ind : Integer;
begin
 Ind := ListBox1.ItemIndex;
 if ind <> - 1 then
  begin
   Edit4.Text         := listBox1.Items.Strings[Ind];
   checkbox1.Checked  := true;
   Application.ProcessMessages;
   ListBox1.ItemIndex := ind;
  end;

end;

procedure TForm1.N12Click(Sender: TObject);
Var
  node : TTreeNode;
begin
//
 node := TreeView1.Selected;
 if node <> nil then
 if node.Level = 0 then
  begin
   Edit4.Text         := node.Text;
   checkbox1.Checked  := true;
  end; 
// 
 Btn_connect.Click;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
//
 Button2.Click;
end;

procedure TForm1.TreeView2Click(Sender: TObject);
 Var
  node : TTreeNode;
begin
//
 node := TreeView2.Selected;
 if node = nil then exit;
 if node.Level <> 0 then exit;
 Edit4.Text         := node.Text;
 checkbox1.Checked  := true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
 Var
  I    : Integer;
  HOST : String;
begin
//
 Stopped_Scanning := false;
 try
  Timer_control_connect.Enabled := false;
  Timer1.Enabled                := false;

  if idFTP2.Connected then idFTP2.Disconnect;
  if idFTP2.Connected then exit;
  For I := 0 to TreeView1.Items.Count - 1 do
   begin
    if TreeView1.Items.Item[I].Level = 0 then
     begin
      HOST        := TreeView1.Items.Item[I].Text;
      if POS('@', HOST) = 0 then
      begin
        idFTP2.Host := HOST;
        try
         idFTP2.Connect(True, Form4.SpinEdit1.Value);
         except
          //
          timer1.Enabled := false;
         end;
        HOST_Connected(idFTP2.Connected, idFTP2.Host);
        if idFTP2.Connected then
         begin
         // GetFTPList(IdFTP2);
          idFTP2.Disconnect;
          //
         end;
      end; // if POS('@', HOST) = 0 then

     end;
   end;
 //
 finally
  Timer_control_connect.Enabled := true;
  Timer1.Enabled                := true;
  Stopped_Scanning              := true;
 end;
end;

procedure TForm1.Button9Click(Sender: TObject);
 Var
  FileName : String;
  ID       : Integer;
begin
 SaveDialog1.Filter := 'Text|*.txt|Any files |*.*|';
 if not SaveDialog1.Execute then exit;
 FileName := SaveDialog1.FileName;
 ID := -1;
 if FileExists(FileName) then
  ID := Application.MessageBox('Указанный файл существует'+#13+
         'Вы желаете заменить его ?' ,'Warring !', MB_YESNO);
 if (ID = IDYES) or (ID = -1) then
  ListBox2.Items.SaveToFile(FileName);
end;

procedure TForm1.N14Click(Sender: TObject);
begin
 close;
end;

procedure TForm1.N15Click(Sender: TObject);
begin
 sendmessage(form1.Handle, $112, SC_RESTORE {SC_RESTORE{},0);
 application.ProcessMessages;
// TrayIcon1.FormVisible := true;
// TrayIcon1.AppVisible  := true;
end;

Procedure TForm1.OnLine_offLineTreeView (All_View : Boolean);
 Var
  I : Integer;
begin
 //
 I := 0;
 While I <= TreeView2.Items.Count - 1 do
  begin
   if TreeView2.Items.Item[I].Level = 0 then
    begin
      //
     if not All_View then 
     if TreeView2.Items.Item[I].StateIndex <> 2 then
      begin
       TreeView2.Items.Delete(TreeView2.Items.Item[I]);
       I := I - 1;
      end;
      //
    end;
   I := I + 1;
  end;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
//
 Application.ProcessMessages;
 OnLine_offLineTreeView(RadioButton2.Checked);
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
 Application.ProcessMessages;
 OnLine_offLineTreeView(RadioButton2.Checked);
end;

procedure TForm1.N16Click(Sender: TObject);
begin
 //
 Timer1Timer(self);
end;

procedure TForm1.N17Click(Sender: TObject);
 Var
  A : TTreeView;
begin
 A := TreeView1;
 if A.Selected = nil then exit;
 A.Selected.Delete;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
 N11Click(self);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 N9Click(Self);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
 N10Click(self);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
 N16Click(Self);
end;

procedure TForm1.Timer_control_connectTimer(Sender: TObject);
 Var
  S       : String;
  Check_C : Boolean;
begin

 Check_C := true;
 try
   if IdFTP1.Connected then
    S := IdFTP1.RetrieveCurrentDir;
  except
   on E : exception do
    begin
     PUT_FILE_IS_SERVER_CONNECT := false;
     Check_C := false;
     S       := E.Message;
     ListBox2.Items.Add(S);
    end;
  end;

 if not Check_C then
  begin
   PUT_FILE_IS_SERVER_CONNECT := false;
   Panel2.Color           := clSilver;
   Lab_ActiveHost.Caption := '';
   IdFTP1.Disconnect;
  end;
end;

procedure TForm1.N18Click(Sender: TObject);
 Var
  I : Integer;
begin
//
 For I := 0 to ListView1.Items.Count - 1 do
  begin
   ListView1.Items.Item[I].Checked := true;
  end;
end;

procedure TForm1.N19Click(Sender: TObject);
 Var
  I : Integer;
begin
//
 For I := 0 to ListView1.Items.Count - 1 do
  begin
   ListView1.Items.Item[I].Checked := false;
  end;
end;

procedure TForm1.TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
 Var
  node : TTreeNode;
begin
//

   node := TreeView1.Selected;
   if node <> nil then
    if node.Level <> 0 then
     Popupmenu2.Items.Items[0].Enabled := false else
     Popupmenu2.Items.Items[0].Enabled := true;
   Application.ProcessMessages;

end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
 while not Stopped_Scanning do ;
 Stopped_Scanning := false;
 START_FTPScaner;
 Stopped_Scanning := true;
end;

procedure TForm1.IdEcho1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
 if AWorkMode = wmRead then
 ListBox2.Items.Add('WorkMode = wmRead; count = ' + inttostr(AWorkCount)) else
 ListBox2.Items.Add('WorkMode = wmWrite; count = ' + inttostr(AWorkCount));
end;

procedure TForm1.IdIcmpClient1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
 ListBox2.Items.Add(AStatusText);
end;

procedure TForm1.IdIcmpClient1Reply(ASender: TComponent;
  const AReplyStatus: TReplyStatus);
begin
 //
end;

procedure TForm1.Edit_Curr_FTP_pathEnter(Sender: TObject);
begin
 edit4.Text := edit_curr_ftp_path.Text;
 btn_connect.click;
end;

procedure TForm1.FTP1Click(Sender: TObject);
begin
{}
 if not OpenDialog1.execute then exit;
 Put_File(OpenDialog1.FileName, ExtractFileName(OpenDialog1.FileName));
{}
end;

procedure TForm1.N8Click(Sender: TObject);
 var
   FN : STRING;
   I  : INTEGER;
   FC : INTEGER;
begin
{}
 FC := 0;
 For I := 0 to ListView1.Items.Count - 1 do
  begin
   //
   if ListView1.Items.Item[I].Checked then
    begin
     FN := ListView1.Items.Item[I].Caption;
     idftp1.Delete(FN);
     MessageBox(form1.Handle, PCHAR('Файл: ' + FN + ' - удален!'), PCHAR('Операция: удаление файла'), MB_OK);
     FC := FC + 1;
    end;
  end;
{}
  Btn_connectClick(self); 
{}
end;

end.

