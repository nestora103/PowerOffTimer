object Form1: TForm1
  Left = 192
  Top = 107
  Width = 223
  Height = 233
  Caption = 'ShutDown'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 144
    Width = 56
    Height = 13
    Caption = 'Current time'
  end
  object Label2: TLabel
    Left = 48
    Top = 176
    Width = 87
    Height = 13
    Caption = 'Time at shutdown:'
  end
  object Label3: TLabel
    Left = 147
    Top = 144
    Width = 38
    Height = 13
  end
  object Label4: TLabel
    Left = 152
    Top = 176
    Width = 40
    Height = 13
  end
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 32
    Width = 186
    Height = 21
    Date = 42227.411091574070000000
    Time = 42227.411091574070000000
    Kind = dtkTime
    TabOrder = 0
  end
  object Button1: TButton
    Left = 24
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Top = 8
  end
end
