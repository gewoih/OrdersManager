object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 701
  ClientWidth = 1268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  object sbMain: TStatusBar
    Left = 0
    Top = 677
    Width = 1268
    Height = 24
    Panels = <
      item
        Text = #1052#1077#1085#1077#1076#1078#1077#1088':'
        Width = 50
      end
      item
        Text = 'ID '#1084#1077#1085#1077#1076#1078#1077#1088#1072':'
        Width = 50
      end
      item
        Text = #1057#1073#1086#1088#1082#1072':'
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 1268
    Height = 677
    Align = alClient
    TabHeight = 25
    TabOrder = 1
    Tabs.Strings = (
      #1042#1089#1077' '#1079#1072#1082#1072#1079#1099
      #1053#1077#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077' '#1079#1072#1082#1072#1079#1099
      #1047#1072#1082#1072#1079#1099' '#1074' '#1088#1072#1073#1086#1090#1077
      #1047#1072#1074#1077#1088#1096#1077#1085#1085#1099#1077' '#1079#1072#1082#1072#1079#1099
      #1052#1086#1080' '#1079#1072#1082#1072#1079#1099)
    TabIndex = 0
    OnChange = TabControl1Change
    object MainTree: TVirtualStringTree
      Left = 4
      Top = 177
      Width = 1260
      Height = 1
      AccessibleName = #1057#1091#1084#1084#1072' '#1079#1072#1082#1072#1079#1072
      Align = alClient
      Alignment = taRightJustify
      BorderStyle = bsNone
      Colors.BorderColor = 15987699
      Colors.DisabledColor = clGray
      Colors.DropMarkColor = 15385233
      Colors.DropTargetColor = 15385233
      Colors.DropTargetBorderColor = 15987699
      Colors.FocusedSelectionColor = 15385233
      Colors.FocusedSelectionBorderColor = clWhite
      Colors.GridLineColor = 15987699
      Colors.HeaderHotColor = clBlack
      Colors.HotColor = clBlack
      Colors.SelectionRectangleBlendColor = 15385233
      Colors.SelectionRectangleBorderColor = 15385233
      Colors.SelectionTextColor = clBlack
      Colors.TreeLineColor = 9471874
      Colors.UnfocusedColor = 9687928
      Colors.UnfocusedSelectionColor = 15385233
      Colors.UnfocusedSelectionBorderColor = 15385233
      Colors.HeaderColor = 9687928
      DefaultNodeHeight = 25
      Header.AutoSizeIndex = 9
      Header.DefaultHeight = 25
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -13
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.Height = 27
      Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
      PopupMenu = MainTreePopupmenu
      TabOrder = 0
      TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toEditable, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning, toVariableNodeHeight, toEditOnClick, toEditOnDblClick]
      TreeOptions.PaintOptions = [toHideFocusRect, toHideSelection, toShowDropmark, toShowHorzGridLines, toAlwaysHideSelection]
      OnBeforeCellPaint = MainTreeBeforeCellPaint
      OnCompareNodes = MainTreeCompareNodes
      OnEdited = MainTreeEdited
      OnEditing = MainTreeEditing
      OnFocusChanged = MainTreeFocusChanged
      OnGetText = MainTreeGetText
      OnHeaderClick = MainTreeHeaderClick
      OnCheckFilter = MainTreeCheckFilter
      Columns = <
        item
          Alignment = taCenter
          CaptionAlignment = taCenter
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
          Position = 0
          Tag = 1
          Width = 60
          Aggregate = False
          FilterMode = 0
          WideText = #1053#1086#1084#1077#1088
        end
        item
          CaptionAlignment = taCenter
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
          Position = 1
          Spacing = 2
          Tag = 3
          Width = 150
          Aggregate = False
          FilterMode = 0
          WideText = #1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072
        end
        item
          Alignment = taRightJustify
          CaptionAlignment = taCenter
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
          Position = 2
          Tag = 9
          Width = 100
          Aggregate = False
          FilterMode = 0
          WideText = #1057#1091#1084#1084#1072' '#1079#1072#1082#1072#1079#1072
        end
        item
          Alignment = taRightJustify
          CaptionAlignment = taCenter
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
          Position = 3
          Tag = 10
          Width = 80
          Aggregate = False
          FilterMode = 0
          WideText = #1052#1072#1088#1078#1072
        end
        item
          CaptionAlignment = taCenter
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
          Position = 4
          Spacing = 4
          Tag = 2
          Width = 200
          Aggregate = False
          FilterMode = 0
          WideText = #1060#1048#1054' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
        end
        item
          CaptionAlignment = taCenter
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
          Position = 5
          Tag = 4
          Width = 150
          Aggregate = False
          FilterMode = 0
          WideText = #1058#1077#1083#1077#1092#1086#1085
        end
        item
          CaptionAlignment = taCenter
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
          Position = 6
          Tag = 5
          Width = 200
          Aggregate = False
          FilterMode = 0
          WideText = #1055#1086#1095#1090#1072
        end
        item
          CaptionAlignment = taCenter
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
          Position = 7
          Tag = 8
          Width = 160
          Aggregate = False
          FilterMode = 0
          WideText = #1052#1077#1085#1077#1076#1078#1077#1088
        end
        item
          CaptionAlignment = taCenter
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
          Position = 8
          Tag = 7
          Width = 150
          Aggregate = False
          FilterMode = 0
          WideText = #1057#1090#1072#1090#1091#1089
        end
        item
          CaptionAlignment = taCenter
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
          Position = 9
          Tag = 6
          Width = 10
          Aggregate = False
          FilterMode = 0
          WideText = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        end>
    end
    object FlatSplitter1: TFlatSplitter
      Left = 4
      Top = 111
      Width = 1260
      Height = 2
      Cursor = crVSplit
      AdvColorBorder = 0
      AdvColorFocused = 0
      Color = clSilver
      ColorFocused = clCream
      ColorBorder = clSilver
      Align = alBottom
      ParentColor = False
    end
    object TTopInfoPanel: TFlatPanel
      Tag = 1
      Left = 4
      Top = 31
      Width = 1260
      Height = 146
      ParentColor = True
      Visible = False
      ColorHighLight = 8623776
      ColorShadow = 8623776
      BorderColor = 8623776
      Align = alTop
      Alignment = taLeftJustify
      TabOrder = 2
      UseDockManager = True
      object Panel3: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 76
        Width = 1252
        Height = 32
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 15794175
        ParentBackground = False
        TabOrder = 0
        object lbPrim: TLabel
          AlignWithMargins = True
          Left = 12
          Top = 8
          Width = 78
          Height = 24
          Margins.Left = 12
          Margins.Top = 8
          Margins.Bottom = 0
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          ExplicitHeight = 21
        end
        object edPrim: TEdit
          Tag = 4412
          AlignWithMargins = True
          Left = 96
          Top = 3
          Width = 1153
          Height = 26
          Align = alClient
          TabOrder = 0
          OnEnter = edEnter
          OnExit = edExit
          ExplicitHeight = 24
        end
      end
      object Panel4: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 39
        Width = 1252
        Height = 34
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 15794175
        ParentBackground = False
        TabOrder = 1
        object lbDDost: TLabel
          AlignWithMargins = True
          Left = 12
          Top = 8
          Width = 86
          Height = 23
          Margins.Left = 12
          Margins.Top = 8
          Align = alLeft
          Caption = #1044#1072#1090#1072' '#1076#1086#1089#1090#1072#1074#1082#1080
          ExplicitHeight = 16
        end
        object lbAddr: TLabel
          AlignWithMargins = True
          Left = 244
          Top = 8
          Width = 92
          Height = 23
          Margins.Left = 12
          Margins.Top = 8
          Align = alLeft
          Caption = #1040#1076#1088#1077#1089' '#1076#1086#1089#1090#1072#1074#1082#1080
          ExplicitHeight = 16
        end
        object dtDost: TDateTimePicker
          Tag = 4408
          AlignWithMargins = True
          Left = 109
          Top = 4
          Width = 120
          Height = 27
          Margins.Left = 8
          Margins.Top = 4
          Align = alLeft
          CalAlignment = dtaRight
          Date = 44231.000000000000000000
          Format = #39#39
          Time = 44231.000000000000000000
          TabOrder = 0
          OnClick = dtDostClick
        end
        object edAddr: TEdit
          Tag = 4412
          AlignWithMargins = True
          Left = 342
          Top = 3
          Width = 907
          Height = 28
          Align = alClient
          TabOrder = 1
          OnEnter = edEnter
          OnExit = edExit
          ExplicitHeight = 24
        end
      end
      object Panel5: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 1252
        Height = 32
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 15794175
        ParentBackground = False
        TabOrder = 2
        object lbSklad: TLabel
          AlignWithMargins = True
          Left = 26
          Top = 7
          Width = 59
          Height = 22
          Margins.Left = 26
          Margins.Top = 7
          Align = alLeft
          Caption = #1057#1086' '#1089#1082#1083#1072#1076#1072
          ExplicitHeight = 16
        end
        object lbOplat: TLabel
          AlignWithMargins = True
          Left = 269
          Top = 8
          Width = 68
          Height = 21
          Margins.Left = 12
          Margins.Top = 8
          Align = alLeft
          Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
          ExplicitHeight = 16
        end
        object lbSkid: TLabel
          AlignWithMargins = True
          Left = 499
          Top = 7
          Width = 67
          Height = 22
          Margins.Left = 12
          Margins.Top = 7
          Align = alLeft
          Caption = #1057#1082#1080#1076#1082#1072' (%)'
          ExplicitHeight = 16
        end
        object lbDost: TLabel
          AlignWithMargins = True
          Left = 702
          Top = 8
          Width = 78
          Height = 21
          Margins.Left = 12
          Margins.Top = 8
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1042#1080#1076' '#1076#1086#1089#1090#1072#1074#1082#1080
          ExplicitLeft = 796
        end
        object lbStatus: TLabel
          AlignWithMargins = True
          Left = 916
          Top = 8
          Width = 85
          Height = 21
          Margins.Left = 12
          Margins.Top = 8
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
        end
        object cbSklad: TFlatComboBox
          Tag = 4128
          AlignWithMargins = True
          Left = 96
          Top = 4
          Width = 158
          Height = 24
          Margins.Left = 8
          Margins.Top = 4
          Color = clWindow
          Align = alLeft
          DropDownCount = 5
          Items.Strings = (
            #1057#1082#1083#1072#1076' 1'
            #1056#1086#1079#1085#1080#1094#1072' ('#1042#1058#1050')'
            #1056#1086#1079#1085#1080#1094#1072' (WTC)'
            #1054#1087#1090' ('#1042#1099#1089#1086#1082#1086#1074#1086#1083#1100#1090#1085#1099#1081')'
            #1054#1087#1090' ('#1051#1080#1072#1085#1086#1079#1086#1074#1086')')
          TabOrder = 0
          ItemIndex = -1
        end
        object cbSkid: TFlatComboBox
          Tag = 4130
          AlignWithMargins = True
          Left = 577
          Top = 4
          Width = 110
          Height = 24
          Margins.Left = 8
          Margins.Top = 4
          Color = clWindow
          Align = alLeft
          DropDownCount = 15
          Items.Strings = (
            #1053#1077#1090
            '5'
            '10'
            '15'
            '20'
            '25'
            '30'
            '35'
            '40'
            '45'
            '50'
            '55'
            '60'
            '')
          TabOrder = 1
          Text = #1053#1077#1090
          ItemIndex = 0
        end
        object cbDost: TFlatComboBox
          Tag = 5107
          AlignWithMargins = True
          Left = 786
          Top = 4
          Width = 115
          Height = 24
          Margins.Top = 4
          Color = clWindow
          Align = alLeft
          DropDownCount = 15
          Items.Strings = (
            #1057#1072#1084#1086#1074#1099#1074#1086#1079
            #1050#1091#1088#1100#1077#1088#1089#1082#1072#1103' '#1076#1086#1089#1090#1072#1074#1082#1072)
          TabOrder = 2
          ItemIndex = -1
        end
        object cbOplat: TFlatComboBox
          Tag = 4130
          AlignWithMargins = True
          Left = 348
          Top = 4
          Width = 136
          Height = 24
          Margins.Left = 8
          Margins.Top = 4
          Color = clWindow
          Align = alLeft
          DropDownCount = 15
          Items.Strings = (
            #1053#1072#1083#1080#1095#1085#1099#1081' '#1088#1072#1089#1095#1077#1090
            #1041#1077#1079#1085#1072#1083#1080#1095#1085#1099#1081' '#1088#1072#1089#1095#1077#1090
            #1055#1077#1088#1077#1074#1086#1076' '#1085#1072' '#1082#1072#1088#1090#1091
            #1058#1077#1088#1084#1080#1085#1072#1083
            #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090)
          TabOrder = 3
          ItemIndex = -1
        end
        object cbStatus: TFlatComboBox
          Tag = 5107
          AlignWithMargins = True
          Left = 1007
          Top = 4
          Width = 115
          Height = 24
          Margins.Top = 4
          Color = clWindow
          Align = alLeft
          DropDownCount = 15
          Items.Strings = (
            #1057#1086#1075#1083#1072#1089#1086#1074#1072#1085
            #1054#1090#1087#1088#1072#1074#1083#1077#1085' '#1085#1072' '#1086#1090#1075#1088#1091#1079#1082#1091
            #1054#1090#1084#1077#1085#1077#1085)
          TabOrder = 4
          ItemIndex = -1
        end
      end
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 111
        Width = 1252
        Height = 32
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 15794175
        ParentBackground = False
        TabOrder = 3
        object InfoPanelBtSave: TFlatButton
          AlignWithMargins = True
          Left = 1022
          Top = 3
          Width = 160
          Height = 26
          Align = alRight
          ColorBorder = 11579568
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103'  '
          TabOrder = 0
          OnClick = InfoPanelBtSaveClick
        end
        object InfoPanelBtClose: TFlatButton
          AlignWithMargins = True
          Left = 1188
          Top = 3
          Width = 61
          Height = 26
          Align = alRight
          ColorBorder = 11579568
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 1
          OnClick = InfoPanelBtCloseClick
        end
      end
    end
    object TBottomInfoPanel: TFlatPanel
      Tag = 1
      Left = 4
      Top = 413
      Width = 1260
      Height = 260
      ParentColor = True
      Visible = False
      ColorHighLight = 8623776
      ColorShadow = 8623776
      BorderColor = 8623776
      Align = alBottom
      TabOrder = 3
      UseDockManager = True
      object ContactsTree: TVirtualStringTree
        Left = 1
        Top = 41
        Width = 1258
        Height = 218
        Align = alClient
        BorderStyle = bsNone
        Colors.BorderColor = 15987699
        Colors.DisabledColor = clGray
        Colors.DropMarkColor = 15385233
        Colors.DropTargetColor = 15385233
        Colors.DropTargetBorderColor = 15987699
        Colors.FocusedSelectionColor = 15385233
        Colors.FocusedSelectionBorderColor = clWhite
        Colors.GridLineColor = 15987699
        Colors.HeaderHotColor = clBlack
        Colors.HotColor = clBlack
        Colors.SelectionRectangleBlendColor = 15385233
        Colors.SelectionRectangleBorderColor = 15385233
        Colors.SelectionTextColor = clBlack
        Colors.TreeLineColor = 9471874
        Colors.UnfocusedColor = 9687732
        Colors.UnfocusedSelectionColor = 15385233
        Colors.UnfocusedSelectionBorderColor = 15385233
        Colors.HeaderColor = 9687732
        DefaultNodeHeight = 25
        Header.AutoSizeIndex = 7
        Header.DefaultHeight = 25
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -13
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        Header.Height = 26
        Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
        PopupMenu = ContactsTreePopupmenu
        TabOrder = 0
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toEditable, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning, toVariableNodeHeight, toEditOnClick, toEditOnDblClick]
        TreeOptions.PaintOptions = [toHideFocusRect, toHideSelection, toShowDropmark, toShowHorzGridLines, toAlwaysHideSelection]
        OnBeforeCellPaint = MainTreeBeforeCellPaint
        OnEdited = MainTreeEdited
        OnEditing = MainTreeEditing
        OnGetText = ContactsTreeGetText
        Columns = <
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 0
            Width = 220
            Aggregate = False
            FilterMode = 0
            WideText = #1060#1048#1054
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 1
            Width = 250
            Aggregate = False
            FilterMode = 0
            WideText = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          end
          item
            CaptionAlignment = taCenter
            Color = clWindow
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 2
            Width = 150
            Aggregate = False
            FilterMode = 0
            WideText = #1052#1086#1073#1080#1083#1100#1085#1099#1081
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 3
            Width = 150
            Aggregate = False
            FilterMode = 0
            WideText = #1043#1086#1088#1086#1076#1089#1082#1086#1081
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 4
            Width = 60
            Aggregate = False
            FilterMode = 0
            WideText = #1044#1086#1073'.'
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 5
            Width = 180
            Aggregate = False
            FilterMode = 0
            WideText = 'eMail'
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 6
            Width = 160
            Aggregate = False
            FilterMode = 0
            WideText = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 7
            Width = 88
            Aggregate = False
            FilterMode = 0
            WideText = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          end>
      end
      object FlatPanel1: TFlatPanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 1258
        Height = 40
        ParentColor = True
        ColorHighLight = 8623776
        ColorShadow = 8623776
        BorderColor = 8623776
        Align = alTop
        TabOrder = 1
        UseDockManager = True
        object Label1: TLabel
          AlignWithMargins = True
          Left = 13
          Top = 9
          Width = 65
          Height = 27
          Margins.Left = 12
          Margins.Top = 8
          Align = alLeft
          Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          ExplicitHeight = 16
        end
        object SuppliersComboBox: TFlatComboBox
          Tag = 4128
          AlignWithMargins = True
          Left = 89
          Top = 5
          Width = 317
          Height = 24
          Margins.Left = 8
          Margins.Top = 4
          Color = clWindow
          Align = alLeft
          DropDownCount = 5
          TabOrder = 0
          ItemIndex = -1
          OnChange = SuppliersComboBoxChange
        end
        object FlatButton1: TFlatButton
          AlignWithMargins = True
          Left = 1193
          Top = 4
          Width = 61
          Height = 32
          Align = alRight
          ColorBorder = 11579568
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 1
          OnClick = FlatButton1Click
        end
      end
    end
    object TOrderPanel: TFlatPanel
      Tag = 1
      Left = 4
      Top = 113
      Width = 1260
      Height = 300
      ParentColor = True
      ColorHighLight = 8623776
      ColorShadow = 8623776
      BorderColor = 8623776
      Align = alBottom
      TabOrder = 4
      UseDockManager = True
      object SearchPanel: TPanel
        Left = 1
        Top = 1
        Width = 1258
        Height = 33
        Align = alTop
        Alignment = taLeftJustify
        Caption = '  '#1055#1086#1080#1089#1082
        Color = clInactiveCaption
        ParentBackground = False
        TabOrder = 0
        object Edit1: TEdit
          AlignWithMargins = True
          Left = 71
          Top = 4
          Width = 282
          Height = 25
          Margins.Left = 70
          Align = alLeft
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1092#1080#1083#1100#1090#1088
          ExplicitHeight = 24
        end
      end
      object OrdersTree: TVirtualStringTree
        Left = 1
        Top = 34
        Width = 1258
        Height = 265
        AccessibleName = #1054#1089#1090#1072#1090#1086#1082
        Align = alClient
        BorderStyle = bsNone
        Colors.BorderColor = 15987699
        Colors.DisabledColor = clGray
        Colors.DropMarkColor = 15385233
        Colors.DropTargetColor = 15385233
        Colors.DropTargetBorderColor = 15987699
        Colors.FocusedSelectionColor = 15385233
        Colors.FocusedSelectionBorderColor = clWhite
        Colors.GridLineColor = 15987699
        Colors.HeaderHotColor = clBlack
        Colors.HotColor = clBlack
        Colors.SelectionRectangleBlendColor = 15385233
        Colors.SelectionRectangleBorderColor = 15385233
        Colors.SelectionTextColor = clBlack
        Colors.TreeLineColor = 9471874
        Colors.UnfocusedColor = 9687732
        Colors.UnfocusedSelectionColor = 15385233
        Colors.UnfocusedSelectionBorderColor = 15385233
        Colors.HeaderColor = 9687732
        DefaultNodeHeight = 25
        Header.AutoSizeIndex = 10
        Header.DefaultHeight = 25
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -13
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        Header.Height = 26
        Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
        PopupMenu = OrdersTreePopupmenu
        TabOrder = 1
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toEditable, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning, toVariableNodeHeight, toEditOnClick, toEditOnDblClick]
        TreeOptions.PaintOptions = [toHideFocusRect, toHideSelection, toShowDropmark, toShowHorzGridLines, toAlwaysHideSelection]
        OnBeforeCellPaint = MainTreeBeforeCellPaint
        OnEdited = MainTreeEdited
        OnEditing = MainTreeEditing
        OnFocusChanged = OrdersTreeFocusChanged
        OnGetText = OrdersTreeGetText
        ExplicitLeft = 153
        ExplicitTop = 30
        Columns = <
          item
            Alignment = taCenter
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 0
            Width = 100
            Aggregate = False
            FilterMode = 0
            WideText = #1053#1086#1084#1077#1088
          end
          item
            Alignment = taCenter
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 1
            Width = 80
            Aggregate = False
            FilterMode = 0
            WideText = #1040#1088#1090#1080#1082#1091#1083
          end
          item
            CaptionAlignment = taCenter
            Color = clWindow
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 2
            Width = 800
            Aggregate = False
            FilterMode = 0
            WideText = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
          end
          item
            Alignment = taRightJustify
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 3
            Width = 100
            Aggregate = False
            FilterMode = 0
            WideText = #1062#1077#1085#1072
          end
          item
            Alignment = taRightJustify
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 4
            Width = 100
            Aggregate = False
            FilterMode = 0
            WideText = #1062#1077#1085#1072' '#1074#1093#1086#1076
          end
          item
            Alignment = taRightJustify
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 5
            Width = 75
            Aggregate = False
            FilterMode = 0
            WideText = #1050#1086#1083'-'#1074#1086
          end
          item
            Alignment = taRightJustify
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 6
            Width = 100
            Aggregate = False
            FilterMode = 0
            WideText = #1057#1091#1084#1084#1072
          end
          item
            Alignment = taRightJustify
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 7
            Width = 100
            Aggregate = False
            FilterMode = 0
            WideText = #1057#1091#1084#1084#1072' '#1074#1093#1086#1076
          end
          item
            Alignment = taRightJustify
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 8
            Width = 100
            Aggregate = False
            FilterMode = 0
            WideText = #1052#1072#1088#1078#1072
          end
          item
            Alignment = taRightJustify
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 9
            Width = 200
            Aggregate = False
            FilterMode = 0
            WideText = #1050#1086#1085#1090#1088#1072#1082#1090
          end
          item
            Alignment = taRightJustify
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
            Position = 10
            Width = 10
            Aggregate = False
            FilterMode = 0
            WideText = #1054#1089#1090#1072#1090#1086#1082
          end>
      end
    end
  end
  object SQL: TStringContainer
    Items.Strings = (
      'declare'
      '  @t varchar(23) =  '#39'%s'#39','#9'@id int = %d'
      ''
      ''
      ';with k as'
      '('
      
        'select pid from orders where mid=0 and (val > @t and (@t>'#39'0'#39' or ' +
        '@t='#39#39')) or (@t='#39'0'#39' and @id=pid)'
      '),'
      'r as'
      '('
      'select n.*'
      'from orders o'
      'join orders n on n.pid=o.id'
      'join k on k.pid=n.pid'
      ')'
      'select'
      '  pid,'
      #9'[0], --'#1042#1077#1088#1089#1080#1103
      #9'[1], --'#1044#1072#1090#1072
      #9'ROW_NUMBER() over (order by pid) [2], --id'
      #9'[3], --'#1060#1048#1054
      #9'[4], --'#1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
      #9'[5], --Email'
      #9'[6], --'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ''
      #9'[7], --'#1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
      #9'[8], --'#1053#1072#1079#1085#1072#1095#1077#1085#1085#1099#1081' '#1084#1077#1085#1077#1076#1078#1077#1088
      ''
      #9'[14], --'#1057#1082#1083#1072#1076
      #9'[15], --'#1042#1080#1076' '#1086#1087#1083#1072#1090#1099
      #9'[16], --'#1042#1080#1076' '#1076#1086#1089#1090#1072#1074#1082#1080
      #9'[17], --'#1057#1082#1080#1076#1082#1072
      #9'[18], --'#1044#1072#1090#1072' '#1076#1086#1089#1090#1072#1074#1082#1080
      #9'[19], --'#1040#1076#1088#1077#1089' '#1076#1086#1089#1090#1072#1074#1082#1080
      #9'[20] --'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1086#1090' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
      'from'
      '('
      'select pid, mid, val from r'
      ') a'
      
        'pivot (max(val) for mid in ([0],[1],[2],[3],[4],[5],[6],[7],[8],' +
        '[14],[15],[16],[17],[18],[19],[20])) p'
      'where [1] is not null'
      'order by [pid]')
    Left = 288
    Top = 552
  end
  object SQL1: TStringContainer
    Items.Strings = (
      ';with r as'
      '('
      'select'
      '    pid,'
      '    cast([11] as int) item_id,'
      '    cast([12] as int) quantity,'
      '    cast([13] as money) price'
      '  from'
      '    ('
      '    select o.pid, o.mid, o.val'
      '    from orders ox'
      '    join orders o on ox.id = o.pid and o.mid>10'
      '    where ox.mid = 10 and ox.pid = %d'
      '    ) a'
      '    pivot (max(val) for mid in ([11], [12], [13])) p'
      ')'
      'select'
      #9'r.*,'
      #9'price_in = cast(dbo.AsInt(item_id, '#39'4854'#39') * 0.01 as money),'
      #9'summ = price * quantity,'
      
        #9'summ_in = cast(dbo.AsInt(item_id, '#39'4854'#39') * quantity * 0.01 as ' +
        'money),'
      #9'margin = dbo.AsStr(item_id, '#39'4860'#39', 0),'
      #9'item_name = dbo.asStr(item_id, '#39'4803'#39', 0),'
      #9'contract_id = dbo.asStr(item_id, '#39'4806'#39', 0),'
      #9'contract_name = dbo.asStr(item_id, '#39'4806.4709'#39', 0),'
      #9'stock = '
      #9'('
      #9'select'
      #9#9'stock=sum(ost.value)'
      #9#9'from '
      #9#9'spr_data sd'
      #9#9'join spr_prop ost on sd.id=ost.linkid and ost.metaid=6809'
      #9#9'where sd.metaid=6611 and pid=item_id'
      #9')'
      'from r'
      'order by contract_name')
    Left = 400
    Top = 552
  end
  object TrayIcon1: TTrayIcon
    BalloonTimeout = 1000
    BalloonFlags = bfInfo
    PopupMenu = TrayIconPopupmenu
    Visible = True
    OnBalloonClick = TrayIcon1Click
    OnClick = TrayIcon1Click
    Left = 24
    Top = 552
  end
  object ApplicationEvents1: TApplicationEvents
    OnMinimize = ApplicationEvents1Minimize
    Left = 24
    Top = 600
  end
  object MainTreePopupmenu: TPopupMenu
    OnPopup = MainTreePopupmenuPopup
    Left = 128
    Top = 480
    object miTake: TMenuItem
      Caption = #1047#1072#1073#1088#1072#1090#1100' '#1079#1072#1082#1072#1079
      OnClick = miTakeClick
    end
    object miOpen: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1082#1072#1079
      OnClick = miOpenClick
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object miAssign: TMenuItem
      Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100
      Enabled = False
    end
  end
  object TrayIconPopupmenu: TPopupMenu
    Left = 128
    Top = 528
    object miOpenProgram: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnClick = TrayIcon1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object miCloseProgram: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = miCloseProgramClick
    end
  end
  object scUpdateOrderInfo: TStringContainer
    Items.Strings = (
      'declare @mid int = %d, @pid int = %d, @val varchar(max) = '#39'%s'#39
      ''
      'if exists(select * from orders where pid = @pid and mid = @mid)'
      'begin'
      #9'update orders set val = @val where pid = @pid and mid = @mid'
      
        #9'update orders set val = convert(char(23), getdate(), 126) where' +
        ' pid = @pid and mid = 0'
      'end'
      'else'
      #9'insert into orders values (@mid, @pid, @val, null)')
    Left = 288
    Top = 608
  end
  object scUpdateManager: TStringContainer
    Items.Strings = (
      'with r as'
      '('
      'select * from (values'
      '(7, '#39'%s'#39'),'
      '(8, '#39'%s'#39'),'
      '(0, convert(char(23), getdate(), 126))'
      ') x (mid, val)'
      ')'
      'update o '
      '  set val = r.val'
      'from r'
      'join orders o on o.mid = r.mid and o.pid = %d')
    Left = 344
    Top = 552
  end
  object OrdersTreePopupmenu: TPopupMenu
    OnPopup = OrdersTreePopupmenuPopup
    Left = 128
    Top = 576
    object miOrdersCopyValue: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
      OnClick = miOrdersCopyValueClick
    end
    object miOpenURL: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1085#1072' '#1089#1072#1081#1090#1077
      OnClick = miOpenURLClick
    end
    object miDeleteItemFromOrder: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      OnClick = miDeleteItemFromOrderClick
    end
  end
  object scDeleteItemFromOrder: TStringContainer
    Items.Strings = (
      'declare @item int = %d;'
      'declare @order int = (select pid from orders where id = @item)'
      ''
      'delete '
      'from orders'
      #9'where id in '
      #9#9'(select id from orders where pid = @item'
      #9#9'union '
      #9#9'select id from orders where id = @item)'
      ''
      
        'update orders set val = convert(char(23), getdate(), 126) where ' +
        'pid = @order and mid = 0')
    Left = 408
    Top = 608
  end
  object scLoadSuppliers: TStringContainer
    Items.Strings = (
      'select '
      '  id, '
      '  dbo.AsInt(id, '#39'4882'#39') supp_id, '
      '  dbo.AsStr(id, '#39'4882.2527'#39', 0) contract'
      'from spr_data '
      'where pid=%d and metaid=4877 and mark=1')
    Left = 484
    Top = 556
  end
  object scLoadContacts: TStringContainer
    Items.Strings = (
      ';with r as'
      '('
      'select '
      '  id, '
      '  dbo.AsInt(id, '#39'4882'#39') postid, '
      '  dbo.AsStr(id, '#39'4882.2527'#39', 0) contract'
      'from spr_data '
      'where id=%d and metaid=4877 and mark=1'
      '),'
      'n as'
      '('
      'select '
      '  dbo.AsStr(sd.id, '#39'2358'#39', 0) name,'
      '  dbo.AsStr(sd.id, '#39'2359'#39', 0) post,'
      '  dbo.AsStr(sd.id, '#39'5525'#39', 0) mobile,'
      '  dbo.AsStr(sd.id, '#39'2360'#39', 0) landline,'
      '  dbo.AsInt(sd.id, '#39'5527'#39') ext,'
      '  dbo.AsStr(sd.id, '#39'5522.5502'#39', 0) type,'
      '  dbo.AsStr(sd.id, '#39'2361'#39', 0) email,'
      '  Convert(date, dbo.AsStr(sd.id, '#39'2362'#39', 0), 104) as birthday,'
      '  dbo.AsStr(sd.id, '#39'2363'#39', 0) note'
      'from r'
      
        'join spr_data sd on sd.pid=r.postid and sd.metaid=2356 and sd.ma' +
        'rk=1'
      
        'where dbo.AsStr(sd.id, '#39'2360'#39', 0) is not null or dbo.AsStr(sd.id' +
        ', '#39'5525'#39', 0) is not null'
      ')'
      
        'select name, post, mobile, landline, ext, type, email, birthday,' +
        ' note'
      'from n '
      '--group by name, f1, f2, f3, f4'
      'order by 1, 2')
    Left = 484
    Top = 612
  end
  object ContactsTreePopupmenu: TPopupMenu
    OnPopup = OrdersTreePopupmenuPopup
    Left = 128
    Top = 624
    object miContactsCopyValue: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
      OnClick = miOrdersCopyValueClick
    end
    object miRequestItem: TMenuItem
      Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      OnClick = miRequestItemClick
    end
  end
end
