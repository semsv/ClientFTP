object Form2: TForm2
  Left = 347
  Top = 389
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1094#1077#1089#1089' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103' '#1092#1072#1081#1083#1086#1074
  ClientHeight = 228
  ClientWidth = 398
  Color = 14399415
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 8
    Top = 107
    Width = 385
    Height = 25
    ForeColor = clLime
    Progress = 20
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 118
    Height = 16
    Caption = #1050#1086#1087#1080#1088#1091#1077#1090#1089#1103' '#1092#1072#1081#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Lab_FileName: TLabel
    Left = 137
    Top = 10
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Gauge2: TGauge
    Left = 8
    Top = 155
    Width = 385
    Height = 25
    ForeColor = clLime
    Progress = 20
  end
  object Label2: TLabel
    Left = 10
    Top = 137
    Width = 264
    Height = 16
    Caption = #1055#1088#1086#1075#1088#1077#1089#1089' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1092#1072#1081#1083#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 10
    Top = 88
    Width = 252
    Height = 16
    Caption = #1054#1073#1097#1080#1081' '#1087#1088#1086#1075#1088#1077#1089#1089' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103' '#1092#1072#1081#1083#1086#1074' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 187
    Width = 62
    Height = 16
    Caption = #1089#1082#1086#1088#1086#1089#1090#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 75
    Top = 187
    Width = 3
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 224
    Top = 184
    Width = 169
    Height = 22
    Caption = #1055#1088#1077#1088#1074#1072#1090#1100' '#1086#1087#1077#1088#1072#1094#1080#1102
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Label6: TLabel
    Left = 8
    Top = 208
    Width = 195
    Height = 16
    Caption = #1089#1090#1072#1090#1091#1089' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1086#1073#1098#1077#1082#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 212
    Top = 211
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Animate1: TAnimate
    Left = 8
    Top = 27
    Width = 385
    Height = 60
    AutoSize = False
    CommonAVI = aviCopyFiles
    StopFrame = 31
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 990
    OnTimer = Timer1Timer
    Left = 360
    Top = 32
  end
end
