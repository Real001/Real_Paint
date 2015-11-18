object IntensityColorForm: TIntensityColorForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1048#1085#1090#1077#1085#1089#1080#1074#1085#1086#1089#1090#1100' '#1094#1074#1077#1090#1072
  ClientHeight = 341
  ClientWidth = 451
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clSilver
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 57
    Height = 16
    Caption = #1050#1088#1072#1089#1085#1099#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 39
    Width = 59
    Height = 16
    Caption = #1047#1077#1083#1077#1085#1099#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 70
    Width = 37
    Height = 16
    Caption = #1057#1080#1085#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 90
    Top = 8
    Width = 8
    Height = 16
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 90
    Top = 39
    Width = 8
    Height = 16
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 90
    Top = 70
    Width = 8
    Height = 16
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 112
    Width = 142
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1086#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 264
    Top = 112
    Width = 155
    Height = 13
    Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1089' '#1101#1092#1092#1077#1082#1090#1086#1084':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 8
    Top = 131
    Width = 201
    Height = 158
    Proportional = True
  end
  object Image2: TImage
    Left = 238
    Top = 131
    Width = 201
    Height = 158
    Proportional = True
  end
  object TrackBarRed: TTrackBar
    Left = 128
    Top = 8
    Width = 305
    Height = 25
    Max = 255
    Min = -255
    Frequency = 20
    TabOrder = 0
    OnChange = TrackBarRedChange
  end
  object TrackBarGreen: TTrackBar
    Left = 128
    Top = 39
    Width = 305
    Height = 34
    Max = 255
    Min = -255
    Frequency = 20
    TabOrder = 1
    OnChange = TrackBarGreenChange
  end
  object TrackBarBlue: TTrackBar
    Left = 128
    Top = 70
    Width = 305
    Height = 27
    Max = 255
    Min = -255
    Frequency = 20
    TabOrder = 2
    OnChange = TrackBarBlueChange
  end
  object ButtonOK: TButton
    Left = 283
    Top = 308
    Width = 75
    Height = 25
    Caption = #1054#1050
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 364
    Top = 306
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
end
