unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TForm4 = class(TForm)
    GroupBox1: TGroupBox;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    SpinEdit2: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label6: TLabel;
    procedure SpinEdit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure ReadRegistry_Int(Var Value : Integer);
   procedure WriteRegistry_Int(Value : Integer);
   procedure WriteRegistry_Bool();
   Procedure LoadRegistry_Bool();
  end;

var
  Form4 : TForm4;
  FileName_path_struct : String;
implementation
  uses Unit1, Registry;
{$R *.dfm}

procedure TForm4.SpinEdit2Change(Sender: TObject);
begin
 WriteRegistry_Int(SpinEdit2.Value);
 form1.Timer1.Interval := SpinEdit2.Value * 1000;
end;

procedure TForm4.ReadRegistry_Int(Var Value : Integer);
 Var
  reg    : Tregistry;
  Value2 : Integer;
begin
//
 reg := Tregistry.Create;
 reg.RootKey := HKEY_LOCAL_MACHINE;
 if reg.OpenKey('\SOFTWARE\Scaner_FTP_Resource_v1_0_0_2', true) then
  begin
   //
   try
    Value := reg.ReadInteger('Timer_R1');
   except
    Value := 60;
   end;

   try
    Value2 := reg.ReadInteger('Timer_R2');
   except
    Value2 := SpinEdit1.Value;
   end;

   SpinEdit1.Value := Value2;

   if Value < 5 then Value := 5;
  end else Value := Form4.SpinEdit2.Value;
end;

procedure TForm4.WriteRegistry_Int(Value : Integer);
Var
  reg    : Tregistry;
  Value2 : Integer;
begin
//
 reg := Tregistry.Create;
 reg.RootKey := HKEY_LOCAL_MACHINE;
 if reg.OpenKey('\SOFTWARE\Scaner_FTP_Resource_v1_0_0_2', true) then
  begin
   try
    reg.WriteInteger('Timer_R1', Value);
    Value2 := SpinEdit1.Value;
    reg.WriteInteger('Timer_R2', Value2);
   except
    //
   end;
  end;
end;

Procedure Read_Reg_Path_Struct_File(Var FileName : String);
 Var
  reg  : Tregistry;
  FN   : String;
  buff : Array of Char;
begin
//
 reg := Tregistry.Create;
 reg.RootKey := HKEY_LOCAL_MACHINE;
 if reg.OpenKey('\SOFTWARE\Scaner_FTP_Resource_v1_0_0_2', true) then
  begin
   try
    FN := reg.ReadString('path_Struct');
    if not FileExists(FN) then
     begin
     //
      SetLength(buff, 300);
      GetWindowsDirectory(Pchar(buff), 300);
      FN := Pchar(buff);
      //
      if FN <> '' then
       if FN[Length(FN)] <> '\' then FN := FN + '\';
      FN := FN + 'path_structure.txt';
      //
      FileName := FN;
     end else FileName := FN;
   except
    //
    SetLength(buff, 300);
    GetWindowsDirectory(Pchar(buff), 300);
    FN := Pchar(buff);
    FileName := FN;
   end;

  end;
end;

Procedure TForm4.LoadRegistry_Bool();
 Var
  reg : Tregistry;
  b1  : Boolean;
  b2  : Boolean;
  b3  : Boolean;
begin
 reg := Tregistry.Create;
 reg.RootKey := HKEY_LOCAL_MACHINE;
 Read_Reg_Path_Struct_File(FileName_path_struct);
 if reg.OpenKey('\SOFTWARE\Scaner_FTP_Resource_v1_0_0_2', true) then
  begin
   try

    try
     b1 := reg.ReadBool('Bool_1');
     except
      b1 := CheckBox2.Checked;
     end;

    try
     b2 := reg.ReadBool('Bool_2');
     except
      b2 := CheckBox1.Checked;
     end;

    try
     b3 := reg.ReadBool('Bool_3');
     except
      b3 := CheckBox3.Checked;
     end;
    //
    CheckBox2.Checked := b1;
    CheckBox1.Checked := b2;
    CheckBox3.Checked := b3;
    //
    if b1 then
     begin
      //
      try
       form1.TreeView1.LoadFromFile(FileName_path_struct);
       except
       end;
      if CheckBox3.Checked then
       form1.Timer1Timer(self);
     end;
   except
    //
   end;
  end;
end;

procedure TForm4.WriteRegistry_Bool();
 Var
  reg : Tregistry;
  b1  : Boolean;
  b2  : Boolean;
  b3  : Boolean;
begin
 reg := Tregistry.Create;
 reg.RootKey := HKEY_LOCAL_MACHINE;
 if reg.OpenKey('\SOFTWARE\Scaner_FTP_Resource_v1_0_0_2', true) then
  begin
   b1 := CheckBox2.Checked; // Авт. восстанавливать структуру папок
   b2 := CheckBox1.Checked; // Авт. сохранять структуру папок
   b3 := CheckBox3.Checked; // Скан. на доступность после восстановления структуры
   reg.WriteBool('Bool_1', b1);
   reg.WriteBool('Bool_2', b2);
   reg.WriteBool('Bool_3', b3);
  end;
end;

procedure TForm4.FormCreate(Sender: TObject);
 Var
  Value : Integer;
begin
//
 ReadRegistry_Int(Value);
 Form4.SpinEdit2.Value := Value;
 Value := Form4.SpinEdit2.Value;
 form1.Timer1.Interval := Value * 1000;
 form1.Timer1.Enabled  := true;
//
 LoadRegistry_Bool;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 WriteRegistry_Int(SpinEdit2.Value);
 WriteRegistry_Bool();
end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
 WriteRegistry_Int(SpinEdit2.Value);
 WriteRegistry_Bool();
 try
  if form4.CheckBox1.Checked then
   form1.TreeView1.SaveToFile(FileName_path_struct);
  except
  end;
end;

end.
