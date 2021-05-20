object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 400
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 74
    Height = 16
    Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100':'
  end
  object Label2: TLabel
    Left = 16
    Top = 49
    Width = 81
    Height = 16
    Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072':'
  end
  object Label3: TLabel
    Left = 17
    Top = 114
    Width = 73
    Height = 16
    Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077':'
  end
  object Label4: TLabel
    Left = 16
    Top = 79
    Width = 54
    Height = 16
    Caption = #1055#1086#1076#1087#1080#1089#1100':'
  end
  object edRecipient: TEdit
    Left = 125
    Top = 16
    Width = 236
    Height = 24
    TabOrder = 0
  end
  object edSubject: TEdit
    Left = 125
    Top = 46
    Width = 236
    Height = 24
    TabOrder = 1
  end
  object btSendEmail: TButton
    Left = 17
    Top = 354
    Width = 344
    Height = 38
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = btSendEmailClick
  end
  object edSign: TEdit
    Left = 125
    Top = 76
    Width = 236
    Height = 24
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 8
    Top = 136
    Width = 344
    Height = 212
    TabOrder = 4
  end
  object IdSMTP1: TIdSMTP
    MailAgent = 'mail.nic.ru'
    Host = 'mail.nic.ru'
    Password = '00101101Request.'
    Port = 587
    SASLMechanisms = <>
    Username = 'request@wtc.ru'
    Left = 40
    Top = 152
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 96
    Top = 152
  end
end
