#tag Window
Begin Window DemoWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   3.91e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "CookieEngine Demo"
   Visible         =   True
   Width           =   7.01e+2
   Begin Listbox CookieList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   8
      ColumnsResizable=   True
      ColumnWidths    =   "20%,20%,15%,10%,10%,10%,8%,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   252
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Value	Domain	Expires	Path	HTTP Only	SSL Only	Host Only"
      Italic          =   ""
      Left            =   7
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   100
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   687
      _ScrollWidth    =   -1
   End
   Begin TextField CookieSearchName
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   "Cookie Name"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   7
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   358
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   253
   End
   Begin PushButton CookieLookupButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Lookup"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   621
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   358
      Underline       =   ""
      Visible         =   True
      Width           =   73
   End
   Begin TextField CookieSearchDomain
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   "Cookie Domain"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   264
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   358
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   354
   End
   Begin Label CookiesTotal
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   "Cookies known: 0"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   77
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   108
   End
   Begin Label CookiesShown
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   183
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "Cookies shown: 0"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   77
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   108
   End
   Begin PushButton WriteCookies
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Save to file..."
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   299
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   43
      Underline       =   ""
      Visible         =   True
      Width           =   115
   End
   Begin PushButton ReadCookies
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Load from file..."
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   414
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   43
      Underline       =   ""
      Visible         =   True
      Width           =   115
   End
   Begin PushButton NewCookieSessionButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "New Session"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   183
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   43
      Underline       =   ""
      Visible         =   True
      Width           =   115
   End
   Begin PushButton GetURLBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Get"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   614
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   9
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin TextField URLField
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   "https://www.example.com/index.php?foo=bar"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   7
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   9
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   602
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  UpdateCookieList()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub UpdateCookieList()
		  CookieList.DeleteAllRows
		  If mCookieEngine = Nil Then mCookieEngine = New CookieEngine
		  
		  ' Find the first cookie that matches the name and value search parameters.
		  Dim i As Integer = mCookieEngine.Lookup(CookieSearchName.Text, CookieSearchDomain.Text, 0)
		  
		  Do Until i <= -1
		    ' Add the cookie to the CookieList
		    Dim expire As String
		    Dim d As Date = mCookieEngine.Expires(i)
		    If d <> Nil Then expire = d.SQLDateTime
		    CookieList.AddRow(mCookieEngine.Name(i), mCookieEngine.Value(i), mCookieEngine.Domain(i), expire, mCookieEngine.Path(i))
		    CookieList.CellTag(CookieList.LastIndex, 3) = d
		    CookieList.CellType(CookieList.LastIndex, 5) = Listbox.TypeCheckbox
		    If mCookieEngine.HTTPOnly(i) Then
		      CookieList.CellState(CookieList.LastIndex, 5) = CheckBox.CheckedStates.Checked
		    Else
		      CookieList.CellState(CookieList.LastIndex, 5) = CheckBox.CheckedStates.Unchecked
		    End If
		    
		    CookieList.CellType(CookieList.LastIndex, 6) = Listbox.TypeCheckbox
		    If mCookieEngine.SSLOnly(i) Then
		      CookieList.CellState(CookieList.LastIndex, 6) = CheckBox.CheckedStates.Checked
		    Else
		      CookieList.CellState(CookieList.LastIndex, 6) = CheckBox.CheckedStates.Unchecked
		    End If
		    
		    CookieList.CellType(CookieList.LastIndex, 7) = Listbox.TypeCheckbox
		    If mCookieEngine.HostOnly(i) Then
		      CookieList.CellState(CookieList.LastIndex, 7) = CheckBox.CheckedStates.Checked
		    Else
		      CookieList.CellState(CookieList.LastIndex, 7) = CheckBox.CheckedStates.Unchecked
		    End If
		    
		    CookieList.RowTag(CookieList.LastIndex) = i
		    
		    ' find the next cookie that matches the name and value search parameters.
		    i = mCookieEngine.Lookup(CookieSearchName.Text, CookieSearchDomain.Text, i + 1)
		    
		  Loop
		  CookiesTotal.Text = "Cookies known: " + Format(mCookieEngine.Count, "###,###,##0")
		  CookiesShown.Text = "Cookies shown: " + Format(CookieList.ListCount, "###,###,##0")
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCookieEngine As CookieEngine
	#tag EndProperty


#tag EndWindowCode

#tag Events CookieList
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  If column = 5 Then
		    Dim a, b As Boolean
		    a = (Me.CellState(row1, column) = CheckBox.CheckedStates.Checked)
		    b = (Me.CellState(row2, column) = CheckBox.CheckedStates.Checked)
		    
		    If a Xor b Then
		      If a And Not b Then
		        result = 1
		      Else
		        result = -1
		      End If
		    End If
		    Return True
		  End If
		  
		  If column = 3 Then
		    Dim d1 As Date = Me.CellTag(row1, 3)
		    Dim d2 As Date = Me.CellTag(row2, 3)
		    Select Case True
		    Case d1 = Nil And d2 = Nil
		      result = 0
		    Case d1 = Nil And d2 <> Nil
		      result = -1
		    Case d1 <> Nil And d2 = Nil
		      result = 1
		    Else
		      Dim s1, s2 As Double
		      s1 = d1.TotalSeconds
		      s2 = d2.TotalSeconds
		      result = Sign(s1 - s2)
		    End Select
		    Return True
		  End If
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events CookieLookupButton
	#tag Event
		Sub Action()
		  UpdateCookieList()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WriteCookies
	#tag Event
		Sub Action()
		  Dim f As FolderItem = GetSaveFolderItem("", "cookies.txt")
		  If f <> Nil Then
		    If f.Exists Then f.Delete()
		    mCookieEngine.Save(f)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ReadCookies
	#tag Event
		Sub Action()
		  Dim f As FolderItem = GetOpenFolderItem(".txt;.jar;.cookies")
		  If f <> Nil And f.Exists Then
		    mCookieEngine.Load(f)
		    UpdateCookieList()
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewCookieSessionButton
	#tag Event
		Sub Action()
		  mCookieEngine.DeleteSession()
		  UpdateCookieList()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GetURLBtn
	#tag Event
		Sub Action()
		  Dim url As String = URLField.Text
		  Dim cookie As String = mCookieEngine.GenerateRequestHeader(url)
		  #If RBVersion >= 2018.04 Then
		    Dim connection As New URLConnection
		    If cookie <> "" Then connection.RequestHeader("Cookie") = cookie
		    Call connection.SendSync("GET", url, 10)
		    mCookieEngine.ParseResponseHeaders(url, connection.ResponseHeaders)
		  #Else
		    Dim connection As New HTTPSocket
		    If cookie <> "" Then connection.SetRequestHeader("Cookie", cookie)
		    Call connection.Get(url, 10)
		    mCookieEngine.ParseResponseHeaders(url, connection.PageHeaders)
		  #EndIf
		  UpdateCookieList()
		End Sub
	#tag EndEvent
#tag EndEvents
