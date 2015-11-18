object AddNoiseForm: TAddNoiseForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1096#1091#1084#1072
  ClientHeight = 108
  ClientWidth = 394
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 13
    Caption = #1048#1085#1090#1077#1085#1089#1080#1074#1085#1086#1089#1090#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object TrackBar: TTrackBar
    Left = 8
    Top = 27
    Width = 307
    Height = 30
    Max = 400
    Frequency = 20
    TabOrder = 0
    OnChange = TrackBarChange
  end
  object ButtonOK: TButton
    Left = 230
    Top = 72
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 1
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 311
    Top = 72
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
  object Edit: TEdit
    Left = 321
    Top = 27
    Width = 48
    Height = 21
    TabOrder = 3
    Text = '0'
    OnChange = EditChange
  end
  object UpDown: TUpDown
    Left = 369
    Top = 27
    Width = 16
    Height = 21
    Associate = Edit
    Max = 400
    TabOrder = 4
  end
end
