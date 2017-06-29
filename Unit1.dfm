object Form1: TForm1
  Left = 624
  Top = 392
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    'Simple MySQL DB Editor [ADOConnection - MSDASQL via MySQL ODBC 3' +
    '.51 Driver]'
  ClientHeight = 286
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 217
    Top = 8
    Width = 358
    Height = 266
    Caption = ' View DB '
    TabOrder = 0
    object Button1: TButton
      Left = 210
      Top = 231
      Width = 134
      Height = 25
      Caption = 'Remove String from DB'
      TabOrder = 0
      OnClick = Button1Click
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 10
      Top = 20
      Width = 334
      Height = 205
      DataSource = DataSource1
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
    end
    object Button4: TButton
      Left = 10
      Top = 231
      Width = 103
      Height = 25
      Caption = 'Edit this String'
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 196
    Height = 266
    Caption = ' Connect to DB '
    TabOrder = 1
    object Button3: TButton
      Left = 21
      Top = 238
      Width = 155
      Height = 18
      Caption = 'Connect to DB'
      TabOrder = 0
      OnClick = Button3Click
    end
    object LabeledEdit1: TLabeledEdit
      Left = 21
      Top = 42
      Width = 106
      Height = 21
      EditLabel.Width = 105
      EditLabel.Height = 13
      EditLabel.Caption = 'MySQL Server Addres'
      TabOrder = 1
      Text = 'localhost'
    end
    object LabeledEdit2: TLabeledEdit
      Left = 133
      Top = 42
      Width = 43
      Height = 21
      EditLabel.Width = 20
      EditLabel.Height = 13
      EditLabel.Caption = 'Port'
      TabOrder = 2
      Text = '3306'
    end
    object LabeledEdit3: TLabeledEdit
      Left = 21
      Top = 84
      Width = 155
      Height = 21
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'UserName'
      TabOrder = 3
    end
    object LabeledEdit4: TLabeledEdit
      Left = 21
      Top = 126
      Width = 155
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Password'
      TabOrder = 4
    end
    object LabeledEdit5: TLabeledEdit
      Left = 21
      Top = 168
      Width = 155
      Height = 21
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'DB Name'
      TabOrder = 5
      Text = 'test'
    end
    object LabeledEdit7: TLabeledEdit
      Left = 21
      Top = 211
      Width = 155
      Height = 21
      EditLabel.Width = 56
      EditLabel.Height = 13
      EditLabel.Caption = 'Table Name'
      TabOrder = 6
      Text = 'tab1'
    end
  end
  object GroupBox3: TGroupBox
    Left = 581
    Top = 8
    Width = 185
    Height = 266
    Caption = 'Add Data'
    TabOrder = 2
    object Label1: TLabel
      Left = 35
      Top = 154
      Width = 106
      Height = 57
      Alignment = taCenter
      WordWrap = True
    end
    object LabeledEdit6: TLabeledEdit
      Left = 29
      Top = 77
      Width = 121
      Height = 21
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'Your value'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 56
      Top = 223
      Width = 75
      Height = 25
      Caption = 'Add to DB'
      TabOrder = 1
      OnClick = Button2Click
    end
    object LabeledEdit8: TLabeledEdit
      Left = 28
      Top = 35
      Width = 121
      Height = 21
      Color = clBtnFace
      EditLabel.Width = 118
      EditLabel.Height = 13
      EditLabel.Caption = 'ID (Random, Read Only)'
      ReadOnly = True
      TabOrder = 2
    end
    object LabeledEdit9: TLabeledEdit
      Left = 28
      Top = 119
      Width = 121
      Height = 21
      Color = clBtnFace
      EditLabel.Width = 124
      EditLabel.Height = 13
      EditLabel.Caption = 'Current Date (Read Only)'
      ReadOnly = True
      TabOrder = 3
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Exte' +
      'nded Properties="OPTION=0;PORT=3306;SSLVERIFY=0;";Initial Catalo' +
      'g=test'
    LoginPrompt = False
    Mode = cmRead
    Provider = 'MSDASQL.1'
    Left = 84
    Top = 65529
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'tab1'
    Left = 126
    Top = 65529
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 161
    Top = 65529
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 203
    Top = 65529
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 735
    Top = 1
  end
end
