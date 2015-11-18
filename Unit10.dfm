object Form10: TForm10
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1043#1088#1072#1076#1080#1077#1085#1090
  ClientHeight = 190
  ClientWidth = 461
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 88
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1094#1074#1077#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 236
    Top = 8
    Width = 82
    Height = 13
    Caption = #1050#1086#1085#1077#1095#1085#1099#1081' '#1094#1074#1077#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 95
    Top = 25
    Width = 12
    Height = 19
    Caption = 'R'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 95
    Top = 54
    Width = 12
    Height = 19
    Caption = 'G'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 95
    Top = 79
    Width = 11
    Height = 19
    Caption = 'B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 218
    Top = 27
    Width = 12
    Height = 19
    Caption = 'R'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 218
    Top = 54
    Width = 12
    Height = 19
    Caption = 'G'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 219
    Top = 81
    Width = 11
    Height = 19
    Caption = 'B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EditRStart: TEdit
    Left = 8
    Top = 27
    Width = 65
    Height = 21
    TabOrder = 0
    Text = '0'
  end
  object EditGStart: TEdit
    Left = 8
    Top = 54
    Width = 65
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object EditBStart: TEdit
    Left = 8
    Top = 81
    Width = 65
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object UpDown1: TUpDown
    Left = 73
    Top = 27
    Width = 16
    Height = 21
    Associate = EditRStart
    TabOrder = 3
  end
  object UpDown2: TUpDown
    Left = 73
    Top = 54
    Width = 16
    Height = 21
    Associate = EditGStart
    TabOrder = 4
  end
  object UpDown3: TUpDown
    Left = 73
    Top = 81
    Width = 16
    Height = 21
    Associate = EditBStart
    TabOrder = 5
  end
  object ButtonColorStart: TButtonColor
    Left = 8
    Top = 108
    Width = 137
    Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1094#1074#1077#1090
    TabOrder = 6
    OnClick = ButtonColorStartClick
  end
  object ButtonColorFinish: TButtonColor
    Left = 184
    Top = 108
    Width = 137
    Caption = #1050#1086#1085#1077#1095#1085#1099#1081' '#1094#1074#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = ButtonColorFinishClick
  end
  object EditRFinish: TEdit
    Left = 236
    Top = 27
    Width = 65
    Height = 21
    TabOrder = 8
    Text = '0'
  end
  object EditGFinish: TEdit
    Left = 236
    Top = 54
    Width = 65
    Height = 21
    TabOrder = 9
    Text = '0'
  end
  object EditBFinish: TEdit
    Left = 236
    Top = 81
    Width = 65
    Height = 21
    TabOrder = 10
    Text = '0'
  end
  object UpDown4: TUpDown
    Left = 301
    Top = 27
    Width = 16
    Height = 21
    Associate = EditRFinish
    TabOrder = 11
  end
  object UpDown5: TUpDown
    Left = 301
    Top = 54
    Width = 16
    Height = 21
    Associate = EditGFinish
    TabOrder = 12
  end
  object UpDown6: TUpDown
    Left = 301
    Top = 81
    Width = 16
    Height = 21
    Associate = EditBFinish
    TabOrder = 13
  end
  object RadioGroupType: TRadioGroup
    Left = 327
    Top = 27
    Width = 126
    Height = 106
    Caption = #1058#1080#1087' '#1075#1088#1072#1076#1080#1077#1085#1090#1072':'
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1099#1081
      #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1099#1081
      #1044#1080#1072#1075#1086#1085#1072#1083#1100#1085#1099#1081)
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 14
  end
  object Button1: TButton
    Left = 216
    Top = 152
    Width = 75
    Height = 25
    Caption = #1055#1086#1089#1084#1086#1090#1088#1077#1090#1100
    TabOrder = 15
    OnClick = Button1Click
  end
  object ButtonOK: TButton
    Left = 297
    Top = 152
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 16
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 378
    Top = 152
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 17
    OnClick = ButtonCancelClick
  end
end
