object FullScreenForm: TFullScreenForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FullScreenForm'
  ClientHeight = 317
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 533
    Height = 317
    TabOrder = 0
    object Image1: TImage
      Left = -2
      Top = -2
      Width = 531
      Height = 315
    end
  end
end
