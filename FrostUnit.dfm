object FrostForm: TFrostForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1048#1085#1077#1081
  ClientHeight = 177
  ClientWidth = 309
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
    Width = 132
    Height = 13
    Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1099#1081' '#1088#1072#1079#1073#1088#1086#1089':'
    Color = clBackground
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 66
    Width = 121
    Height = 13
    Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1099#1081' '#1088#1072#1079#1073#1088#1086#1089':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EditH: TEdit
    Left = 232
    Top = 27
    Width = 41
    Height = 21
    TabOrder = 0
    Text = '0'
    OnChange = EditHChange
  end
  object TrackBarH: TTrackBar
    Left = 8
    Top = 27
    Width = 218
    Height = 33
    Max = 100
    PageSize = 1
    Frequency = 5
    TabOrder = 1
    OnChange = TrackBarHChange
  end
  object TrackBarV: TTrackBar
    Left = 8
    Top = 85
    Width = 218
    Height = 33
    Max = 100
    PageSize = 1
    Frequency = 5
    TabOrder = 2
    OnChange = TrackBarVChange
  end
  object UpDownH: TUpDown
    Left = 273
    Top = 27
    Width = 16
    Height = 21
    Associate = EditH
    TabOrder = 3
  end
  object UpDownV: TUpDown
    Left = 273
    Top = 85
    Width = 16
    Height = 21
    Associate = EditV
    TabOrder = 4
  end
  object EditV: TEdit
    Left = 232
    Top = 85
    Width = 41
    Height = 21
    TabOrder = 5
    Text = '0'
    OnChange = EditVChange
  end
  object OKButton: TButton
    Left = 135
    Top = 132
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 6
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 216
    Top = 134
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 7
    OnClick = CancelButtonClick
  end
end
