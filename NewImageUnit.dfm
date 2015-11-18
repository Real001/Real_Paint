object NewImageForm: TNewImageForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
  ClientHeight = 165
  ClientWidth = 345
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 21
    Width = 153
    Height = 19
    Caption = #1064#1080#1088#1080#1085#1072' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103':'
    Color = cl3DLight
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 55
    Width = 140
    Height = 19
    Caption = #1044#1083#1080#1085#1072' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103':'
    Color = cl3DLight
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 143
    Height = 19
    Caption = #1056#1072#1079#1084#1077#1088' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103':'
    Color = cl3DLight
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 308
    Top = 92
    Width = 20
    Height = 19
    Caption = #1050#1073
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 173
    Top = 18
    Width = 129
    Height = 21
    TabOrder = 0
    Text = '512'
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 173
    Top = 56
    Width = 129
    Height = 21
    TabOrder = 1
    Text = '512'
    OnChange = Edit2Change
  end
  object Edit3: TEdit
    Left = 173
    Top = 93
    Width = 129
    Height = 21
    TabOrder = 2
    Text = '256'
  end
  object Button1: TButton
    Left = 181
    Top = 128
    Width = 75
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 262
    Top = 128
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
    OnClick = Button2Click
  end
end
