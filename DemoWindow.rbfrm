#tag Window
Begin Window DemoWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   391
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   391
   MinimizeButton  =   True
   MinWidth        =   725
   Placement       =   2
   Resizeable      =   True
   Title           =   "CookieEngine Demo"
   Visible         =   True
   Width           =   725
   Begin Listbox CookieList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   8
      ColumnsResizable=   True
      ColumnWidths    =   "20%,20%,15%,10%,10%,10%,8%,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   269
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Value	Domain	Expires	Path	HTTP Only	SSL Only	Host Only"
      Italic          =   False
      Left            =   7
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   1
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   83
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   711
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextField CookieSearchName
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Cookie Name"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   7
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   358
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   253
   End
   Begin PushButton CookieLookupButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Lookup"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   645
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
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   358
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   73
   End
   Begin TextField CookieSearchDomain
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Cookie Domain"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   264
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   358
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   378
   End
   Begin Label CookiesTotal
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Cookies known: 0"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   59
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   108
   End
   Begin Label CookiesShown
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   183
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Cookies shown: 0"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   59
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   108
   End
   Begin PushButton WriteCookiesButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save to file..."
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   127
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
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   34
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   115
   End
   Begin PushButton ReadCookiesButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Load from file..."
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   246
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
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   34
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   115
   End
   Begin PushButton NewCookieSessionButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "New Session"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
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
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   34
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   115
   End
   Begin PushButton GetURLBtn
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Get"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   638
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   9
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin TextField URLField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "https://www.example.com/index.php?foo=bar"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   7
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   9
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   626
   End
   Begin PushButton DeleteAllSessionButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Delete all"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   365
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   34
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   115
   End
   Begin PushButton DeleteExpiredButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Delete expired"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   602
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   34
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   115
   End
   Begin PushButton DeleteSelectedButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Delete selected"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   484
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   34
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   115
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
		    Dim expire As String = "End of session"
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
#tag Events WriteCookiesButton
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
#tag Events ReadCookiesButton
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
		  MsgBox("Request complete")
		  UpdateCookieList()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeleteAllSessionButton
	#tag Event
		Sub Action()
		  mCookieEngine.DeleteAll()
		  UpdateCookieList()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeleteExpiredButton
	#tag Event
		Sub Action()
		  mCookieEngine.DeleteExpired()
		  UpdateCookieList()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeleteSelectedButton
	#tag Event
		Sub Action()
		  Dim deletedindices() As Integer
		  For i As Integer = 0 To CookieList.ListCount - 1
		    If CookieList.Selected(i) Then 
		      deletedindices.Append(CookieList.RowTag(i))
		    End If
		  Next
		  
		  deletedindices.Sort()
		  
		  For i As Integer = UBound(deletedindices) DownTo 0
		    mCookieEngine.Delete(deletedindices(i))
		  Next i
		  
		  UpdateCookieList()
		End Sub
	#tag EndEvent
#tag EndEvents
