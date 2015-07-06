object Form1: TForm1
  Left = 148
  Top = 190
  Width = 1180
  Height = 541
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    1164
    503)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 598
    Top = 96
    Width = 100
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1085#1072#1095#1072#1083#1100#1085#1072#1103' '#1074#1077#1088#1096#1080#1085#1072
  end
  object Label3: TLabel
    Left = 886
    Top = 96
    Width = 94
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1082#1086#1085#1077#1095#1085#1072#1103' '#1074#1077#1088#1096#1080#1085#1072
  end
  object Label5: TLabel
    Left = 886
    Top = 152
    Width = 85
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1082#1088#1072#1090#1095#1072#1081#1096#1080#1081' '#1087#1091#1090#1100
  end
  object Label4: TLabel
    Left = 596
    Top = 152
    Width = 180
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1099#1077' '#1087#1091#1090#1080' '#1076#1086' '#1074#1089#1077#1093' '#1074#1077#1088#1096#1080#1085
  end
  object Label6: TLabel
    Left = 240
    Top = 152
    Width = 164
    Height = 13
    Caption = #1042#1080#1079#1091#1072#1083#1100#1085#1086#1077' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1075#1088#1072#1092#1072
  end
  object Label2: TLabel
    Left = 744
    Top = 96
    Width = 97
    Height = 13
    Caption = #1074#1088#1077#1084#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 176
    Width = 556
    Height = 322
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 10
    RowCount = 10
    FixedRows = 0
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object Button1: TButton
    Left = 599
    Top = 56
    Width = 105
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1087#1088#1086#1089#1095#1080#1090#1072#1090#1100' '#1087#1091#1090#1100
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 598
    Top = 120
    Width = 121
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 886
    Top = 120
    Width = 121
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 3
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 32
    Width = 185
    Height = 105
    Caption = #1090#1080#1087' '#1079#1072#1075#1088#1091#1079#1082#1080
    TabOrder = 4
    object RadioButton3: TRadioButton
      Left = 16
      Top = 32
      Width = 113
      Height = 17
      Caption = #1084#1072#1090#1088#1080#1094#1072
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton4: TRadioButton
      Left = 16
      Top = 64
      Width = 113
      Height = 17
      Caption = #1089#1087#1080#1089#1086#1082
      TabOrder = 1
    end
  end
  object Button2: TButton
    Left = 24
    Top = 144
    Width = 105
    Height = 25
    Caption = #1079#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083
    TabOrder = 5
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 596
    Top = 176
    Width = 269
    Height = 321
    Anchors = [akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 6
  end
  object Button3: TButton
    Left = 136
    Top = 144
    Width = 73
    Height = 25
    Caption = #1091#1076#1072#1083#1080#1090#1100' '#1074#1089#1105
    TabOrder = 7
    OnClick = Button3Click
  end
  object StringGrid2: TStringGrid
    Left = 888
    Top = 176
    Width = 268
    Height = 321
    Anchors = [akTop, akRight, akBottom]
    ColCount = 3
    RowCount = 10
    TabOrder = 8
    ColWidths = (
      64
      123
      74)
    RowHeights = (
      24
      24
      23
      24
      24
      24
      24
      24
      24
      24)
  end
  object Button4: TButton
    Left = 889
    Top = 56
    Width = 112
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1087#1091#1090#1100' '#1076#1086' '#1074#1077#1088#1096#1080#1085#1099
    Enabled = False
    TabOrder = 9
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 241
    Top = 80
    Width = 121
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099
    Enabled = False
    TabOrder = 10
    OnClick = Button5Click
  end
  object Edit1: TEdit
    Left = 744
    Top = 120
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 11
  end
  object OpenDialog1: TOpenDialog
    Left = 272
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Left = 320
    Top = 16
  end
end
