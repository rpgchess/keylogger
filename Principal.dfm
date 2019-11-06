object frmPrincipal: TfrmPrincipal
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  Caption = 'Capture Keyboard'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object txtKeyboard: TMemo
    Left = 0
    Top = 0
    Width = 536
    Height = 348
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
