object Form4: TForm4
  Left = 188
  Top = 117
  Width = 271
  Height = 263
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  Color = 14399415
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 28
    Top = 215
    Width = 202
    Height = 13
    Caption = #1087#1086#1089#1083#1077' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1089#1090#1088#1091#1082#1090#1091#1088#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 249
    Height = 137
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1088#1077#1084#1077#1085#1085#1099#1093' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074':'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 224
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1076#1083#1103' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 173
      Height = 13
      Caption = #1087#1088#1080' '#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1080' '#1088#1077#1089#1091#1088#1089#1086#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 88
      Top = 60
      Width = 117
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1074' '#1084#1080#1083#1080#1089#1077#1082#1091#1085#1076#1072#1093
    end
    object Label4: TLabel
      Left = 8
      Top = 88
      Width = 233
      Height = 13
      Caption = #1058#1072#1081#1084#1077#1088' '#1086#1087#1088#1086#1089#1072'  '#1076#1086#1089#1090#1091#1087#1085#1086#1089#1090#1080' '#1088#1077#1089#1091#1088#1089#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 88
      Top = 108
      Width = 91
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1074' '#1089#1077#1082#1091#1085#1076#1072#1093
    end
    object SpinEdit1: TSpinEdit
      Left = 8
      Top = 56
      Width = 73
      Height = 22
      MaxValue = 5000
      MinValue = 250
      TabOrder = 0
      Value = 500
    end
    object SpinEdit2: TSpinEdit
      Left = 8
      Top = 104
      Width = 73
      Height = 22
      MaxValue = 86400
      MinValue = 15
      TabOrder = 1
      Value = 60
      OnChange = SpinEdit2Change
    end
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 152
    Width = 217
    Height = 17
    Caption = #1040#1074#1090'. '#1089#1086#1093#1088#1072#1085#1103#1090#1100' '#1089#1090#1088#1091#1082#1090#1091#1088#1091' '#1087#1072#1087#1086#1082
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 1
  end
  object CheckBox2: TCheckBox
    Left = 8
    Top = 176
    Width = 217
    Height = 17
    Caption = #1040#1074#1090'. '#1074#1086#1089#1089#1090#1072#1085#1072#1074#1083#1080#1074#1072#1090#1100' '#1089#1090#1088#1091#1082#1090#1091#1088#1091' '#1087#1072#1087#1086#1082
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 2
  end
  object CheckBox3: TCheckBox
    Left = 8
    Top = 200
    Width = 153
    Height = 17
    Caption = #1057#1082#1072#1085'. '#1085#1072' '#1076#1086#1089#1090#1091#1087#1085#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
end
