object ContrastForm: TContrastForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1071#1088#1082#1086#1089#1090#1100' '#1080' '#1082#1086#1085#1090#1088#1072#1089#1090#1085#1086#1089#1090#1100
  ClientHeight = 163
  ClientWidth = 357
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 46
    Height = 13
    Caption = #1071#1088#1082#1086#1089#1090#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 72
    Width = 77
    Height = 13
    Caption = #1050#1086#1085#1090#1088#1072#1089#1090#1085#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EditContrast: TEdit
    Left = 271
    Top = 91
    Width = 58
    Height = 21
    TabOrder = 0
    Text = '0'
    OnChange = EditContrastChange
  end
  object UpDownContrast: TUpDown
    Left = 329
    Top = 91
    Width = 16
    Height = 21
    Associate = EditContrast
    Min = -100
    TabOrder = 1
  end
  object ButtonOK: TButton
    Left = 193
    Top = 132
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 2
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 274
    Top = 132
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = ButtonCancelClick
  end
  object EditBright: TEdit
    Left = 271
    Top = 29
    Width = 58
    Height = 21
    TabOrder = 4
    Text = '0'
    OnChange = EditBrightChange
  end
  object TrackBarBright: TTrackBar
    Left = 8
    Top = 27
    Width = 257
    Height = 30
    Max = 100
    Min = -100
    Frequency = 10
    TabOrder = 5
    OnChange = TrackBarBrightChange
  end
  object UpDownBright: TUpDown
    Left = 329
    Top = 29
    Width = 16
    Height = 21
    Associate = EditBright
    Min = -100
    TabOrder = 6
  end
  object TrackBarContrast: TTrackBar
    Left = 8
    Top = 91
    Width = 257
    Height = 30
    Max = 100
    Min = -100
    Frequency = 10
    TabOrder = 7
    OnChange = TrackBarContrastChange
  end
end
