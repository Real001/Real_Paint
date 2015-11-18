object Form13: TForm13
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1054#1090#1090#1077#1085#1086#1082'  '#1086#1076#1085#1086#1075#1086' '#1094#1074#1077#1090#1072
  ClientHeight = 197
  ClientWidth = 369
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = #1050#1088#1072#1089#1085#1099#1081
  end
  object Label2: TLabel
    Left = 8
    Top = 59
    Width = 44
    Height = 13
    Caption = #1047#1077#1083#1077#1085#1099#1081
  end
  object Label3: TLabel
    Left = 8
    Top = 112
    Width = 31
    Height = 13
    Caption = #1057#1080#1085#1080#1081
  end
  object EditR: TEdit
    Left = 266
    Top = 27
    Width = 79
    Height = 21
    TabOrder = 0
    Text = '0'
    OnChange = EditRChange
  end
  object EditG: TEdit
    Left = 266
    Top = 76
    Width = 79
    Height = 21
    TabOrder = 1
    Text = '0'
    OnChange = EditGChange
  end
  object EditB: TEdit
    Left = 266
    Top = 128
    Width = 79
    Height = 21
    TabOrder = 2
    Text = '0'
    OnChange = EditBChange
  end
  object UpDownR: TUpDown
    Left = 345
    Top = 27
    Width = 16
    Height = 21
    Associate = EditR
    TabOrder = 3
  end
  object UpDownG: TUpDown
    Left = 345
    Top = 76
    Width = 16
    Height = 21
    Associate = EditG
    TabOrder = 4
  end
  object UpDownB: TUpDown
    Left = 345
    Top = 128
    Width = 16
    Height = 21
    Associate = EditB
    TabOrder = 5
  end
  object TrackBarR: TTrackBar
    Left = 8
    Top = 27
    Width = 252
    Height = 33
    Max = 255
    Frequency = 10
    TabOrder = 6
    OnChange = TrackBarRChange
  end
  object TrackBarG: TTrackBar
    Left = 8
    Top = 78
    Width = 252
    Height = 33
    Max = 255
    Frequency = 10
    TabOrder = 7
    OnChange = TrackBarGChange
  end
  object TrackBarB: TTrackBar
    Left = 8
    Top = 128
    Width = 252
    Height = 26
    Max = 255
    Frequency = 10
    TabOrder = 8
    OnChange = TrackBarBChange
  end
  object ButtonOk: TButton
    Left = 205
    Top = 162
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 9
    OnClick = ButtonOkClick
  end
  object ButtonCancel: TButton
    Left = 286
    Top = 162
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 10
    OnClick = ButtonCancelClick
  end
end
