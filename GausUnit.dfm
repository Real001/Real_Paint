object GausForm: TGausForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1056#1072#1079#1084#1099#1090#1080#1077' '#1087#1086' '#1043#1072#1091#1089#1089#1091
  ClientHeight = 123
  ClientWidth = 425
  Color = clBtnFace
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
    Width = 40
    Height = 13
    Caption = #1056#1072#1076#1080#1091#1089':'
  end
  object TrackBar: TTrackBar
    Left = 8
    Top = 27
    Width = 321
    Height = 30
    Max = 200
    Min = 1
    Frequency = 5
    Position = 1
    TabOrder = 0
    OnChange = TrackBarChange
  end
  object Edit: TEdit
    Left = 335
    Top = 27
    Width = 66
    Height = 21
    TabOrder = 1
    Text = '1'
    OnChange = EditChange
  end
  object UpDown: TUpDown
    Left = 401
    Top = 27
    Width = 16
    Height = 21
    Associate = Edit
    Min = 1
    Max = 200
    Position = 1
    TabOrder = 2
  end
  object ButtonOK: TButton
    Left = 261
    Top = 87
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 3
    OnClick = ButtonOKClick
    OnKeyPress = ButtonOKKeyPress
  end
  object ButtonCancel: TButton
    Left = 342
    Top = 87
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = ButtonCancelClick
  end
end
