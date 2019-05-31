object Form5: TForm5
  Left = 379
  Top = 246
  Width = 328
  Height = 447
  Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1086#1074
  Color = 14399415
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 379
    Width = 129
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 144
    Top = 379
    Width = 145
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1086#1087#1077#1088#1072#1094#1080#1102
    OnClick = SpeedButton2Click
  end
  object Label1: TLabel
    Left = 22
    Top = 8
    Width = 234
    Height = 13
    Caption = #1042#1099' '#1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086' '#1093#1086#1090#1080#1090#1077' '#1089#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 24
    Width = 224
    Height = 13
    Caption = #1074#1099#1073#1088#1072#1085#1085#1099#1077' '#1092#1072#1081#1083#1099' '#1074' '#1101#1090#1091' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1102':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 8
    Top = 67
    Width = 281
    Height = 305
    ItemHeight = 16
    TabOrder = 0
  end
  object DriveComboBox1: TDriveComboBox
    Left = 8
    Top = 43
    Width = 281
    Height = 19
    DirList = DirectoryListBox1
    TabOrder = 1
    OnChange = DriveComboBox1Change
  end
end
