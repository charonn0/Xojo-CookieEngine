#tag Window
Begin Window Window1
   BackColor       =   16777215
   Backdrop        =   0
   BackgroundColor =   16777215
   CloseButton     =   True
   Composite       =   False
   DefaultLocation =   0
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MaxWidth        =   32000
   MenuBar         =   1151784959
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Type            =   0
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim h As New URLConnection
		  Call h.SendSync("GET", "https://www.godaddy.com", 10)
		  Dim c As New CookieEngine
		  c.CollectCookiesFromHeaders("https://www.godaddy.com", h.ResponseHeaders)
		  
		  Dim s As String = c.GenerateCookieHeader("https://www.godaddy.com")
		  Break
		End Sub
	#tag EndEvent


#tag EndWindowCode

