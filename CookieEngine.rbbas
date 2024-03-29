#tag Class
Protected Class CookieEngine
	#tag Method, Flags = &h21
		Private Shared Function CompareDomains(Hostname1 As String, Hostname2 As String, SubdomainsMatch As Boolean) As Boolean
		  ' Compares Hostname1 and Hostname2 to determine whether they belong to the same subdomain.
		  ' For example 'api.example.com' matches 'example.com' and 'api.example.com' but not 'www.example.com'
		  
		  Dim d As Dictionary = ParseURL(Hostname1)
		  Hostname1 = d.Value("host")
		  d = ParseURL(Hostname2)
		  Hostname2 = d.Value("host")
		  
		  If Not SubdomainsMatch Then Return Hostname1 = Hostname2
		  
		  Dim tmp() As String = Split(Hostname1, ".")
		  Dim h1() As String
		  For i As Integer = 0 To UBound(tmp)
		    If tmp(i).Trim = "" Then Continue
		    h1.Insert(0, DecodeURLComponent(tmp(i)))
		  Next
		  
		  tmp = Split(Hostname2, ".")
		  Dim h2() As String
		  For i As Integer = 0 To UBound(tmp)
		    If tmp(i).Trim = "" Then Continue
		    h2.Insert(0, DecodeURLComponent(tmp(i)))
		  Next
		  
		  Dim count As Integer = Min(h1.Ubound, h2.Ubound)
		  For i As Integer = 0 To count
		    If StrComp(h1(i), h2(i), 0) <> 0 Then Return False
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete(Index As Integer)
		  ' Removes the specified cookie.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.Delete
		  
		  mCookies.Remove(Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAll()
		  ' Removes all cookies.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.DeleteAll
		  
		  Redim mCookies(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteExpired()
		  ' Removes all expired cookies.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.DeleteExpired
		  
		  Dim now As New Date
		  For i As Integer = Me.Count - 1 DownTo 0
		    If Me.Expires(i) = Nil Then Continue
		    If Me.Expires(i).TotalSeconds < now.TotalSeconds Then mCookies.Remove(i)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteSession()
		  ' Removes all session cookies.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.DeleteSession
		  
		  For i As Integer = Me.Count - 1 DownTo 0
		    If Me.Expires(i) = Nil Then mCookies.Remove(i)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Domain(Index As Integer) As String
		  ' If the specified cookie has a "domain" attribute then it is returned.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.Domain
		  
		  Return mCookies(Index).Lookup("domain", "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Expires(Index As Integer) As Date
		  ' If the specified cookie has a "expires" attribute then it is returned.
		  ' If this method returns NIL then the cookie expires at the end of the session.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.Expires
		  
		  Return mCookies(Index).Lookup("expires", Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Expires(Index As Integer, Assigns NewExpiry As Date)
		  ' Updates or removes the expiration date attribute of the specified cookie.
		  ' Setting the expiration to NIL makes the cookie a "session" cookie.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.Expires
		  
		  Dim cookie As Dictionary = mCookies(Index)
		  If cookie.HasKey("expires") Then cookie.Remove("expires")
		  If NewExpiry <> Nil Then cookie.Value("expires") = NewExpiry
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateRequestHeader(URL As String) As String
		  ' Generates an HTTP request header field for the specified URL.
		  ' Use the return value to set the Cookie header in your HTTP request:
		  '
		  '    MyURLConnection.RequestHeader("Cookie") = ReturnValue
		  '  or
		  '    MyHTTPSocket.SetRequestHeader("Cookie", ReturnValue)
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.GenerateRequestHeader
		  
		  Dim i As Integer = Me.Lookup("", URL, 0)
		  Dim u As Dictionary = ParseURL(URL)
		  Dim ssl As Boolean = (u.Lookup("scheme", "http") = "https")
		  Dim cookies() As String
		  Dim now As New Date
		  Do Until i <= -1
		    Dim expire As Date = Me.Expires(i)
		    If (expire = Nil Or expire.TotalSeconds > now.TotalSeconds) Or _
		      (ssl = Me.SSLOnly(i)) Or _
		      (Me.HostOnly(i) And Not CompareDomains(u.Lookup("host", ""), Me.Domain(i), Not Me.HostOnly(i))) Then
		      Dim nm As String = EncodeURLComponent(Me.Name(i))
		      Dim vl As String = EncodeURLComponent(Me.Value(i))
		      cookies.Append(nm + "=" + vl)
		    End If
		    
		    i = Me.Lookup("", URL, i + 1)
		  Loop
		  
		  Return Join(cookies, "; ")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HostOnly(Index As Integer) As Boolean
		  ' If True then only send this cookie if the domain is exactly the same.
		  
		  Return mCookies(Index).Lookup("hostonly", False)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HostOnly(Index As Integer, Assigns NewValue As Boolean)
		  ' If True then only send this cookie if the domain is exactly the same.
		  
		  mCookies(Index).Value("hostonly") = NewValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HTTPOnly(Index As Integer) As Boolean
		  ' If True then this cookie should not be availble to non-HTTP apis (for example from javascript).
		  
		  Return mCookies(Index).Lookup("httponly", False)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(CookieJar As FolderItem)
		  ' Load cookies from a Nescape cookiejar file
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.Load
		  
		  Dim tis As TextInputStream = TextInputStream.Open(CookieJar)
		  While Not tis.EOF
		    Dim line As String = tis.ReadLine
		    If Left(line.Trim, 1) = "#" Or Line = "" Then Continue ' comment line
		    If CountFields(Line, Chr(9)) <> 7 Then Continue ' Raise New UnsupportedFormatException
		    Dim domain, hostonly, path, secure, expiration, name, value As String
		    domain = NthField(line, Chr(9), 1)
		    hostonly = NthField(line, Chr(9), 2)
		    path = NthField(line, Chr(9), 3)
		    secure = NthField(line, Chr(9), 4)
		    expiration = NthField(line, Chr(9), 5)
		    name = NthField(line, Chr(9), 6)
		    value = NthField(line, Chr(9), 7)
		    Dim exp As Date
		    If Val(expiration) > 0 Then
		      exp = New Date(1970, 1, 1, 0, 0, 0, 0.0) 'UNIX epoch
		      exp.TotalSeconds = exp.TotalSeconds + Val(expiration)
		    End If
		    SetCookie(name, value, domain, exp, path, False, secure = "TRUE")
		  Wend
		  tis.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(CookieName As String, CookieDomain As String, StartWith As Integer = 0) As Integer
		  ' Locates the index of the cookie matching the CookieName and CookieDomain parameters.
		  ' To continue searching from a previous index specify the StartWith parameter. If
		  ' CookieDomain is "" then all domains match. If CookieName is "" then all cookies for
		  ' CookieDomain match.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.Lookup
		  
		  Dim u As Dictionary = ParseURL(CookieDomain)
		  CookieDomain = u.Value("host")
		  
		  Dim c As Integer = Me.Count
		  For i As Integer = StartWith To c - 1
		    Dim n, d As String
		    n = Me.Name(i)
		    If CookieName = "" Or n = CookieName Then
		      If CookieDomain = "" Then Return i
		      d = Me.Domain(i)
		      If d = "" Then Return i
		      If CompareDomains(CookieDomain, d, Not Me.HostOnly(i)) Then Return i
		    End If
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name(Index As Integer) As String
		  ' Returns the name of the specified cookie.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.Name
		  
		  Return mCookies(Index).Value("name")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseResponseHeaders(URL As String, ResponseHeaders As InternetHeaders)
		  ' Collect all the Set-Cookie: headers in the specified HTTP response headers.
		  ' If a Set-Cookie: header specifies a domain other than the one contained in the
		  ' URL parameter then an exception will be raised.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.ParseResponseHeaders
		  
		  If ResponseHeaders = Nil Then Return
		  
		  For i As Integer = 0 To ResponseHeaders.Count - 1
		    If ResponseHeaders.Name(i) = "Set-Cookie" Then
		      Dim nm, vl, dm, pth, meta, data As String
		      Dim secure, httponly As Boolean
		      Dim d As Dictionary = ParseURL(URL)
		      dm = d.Value("host")
		      Dim ex As Date
		      data = NthField(ResponseHeaders.Value(i), ";", 1)
		      meta = NthField(ResponseHeaders.Value(i), data + ";", 2).Trim
		      
		      nm = NthField(data, "=", 1)
		      vl = NthField(data, nm + "=", 2)
		      
		      If meta <> "" Then
		        Dim items() As String = Split(meta, ";")
		        For Each item As String In items
		          Dim k, v As String
		          k = NthField(item, "=", 1)
		          v = NthField(item, "=", 2)
		          Select Case k.Trim
		          Case "Domain"
		            If Not CompareDomains(v, URL, True) Then Raise New RuntimeException
		            dm = v
		          Case "Path"
		            pth = v
		          Case "Expires"
		            ex = TimeStamp(v)
		          Case "httpOnly"
		            httponly = True
		          Case "secure"
		            secure = True
		          End Select
		        Next
		      End If
		      
		      Me.SetCookie(nm, vl, dm, ex, pth, httponly, secure)
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseResponseHeaders(URL As String, ResponseHeaders As Iterable)
		  ' For use with the URLConnection class. If you're seeing compile errors in this method it's because
		  ' you're using an older version of Xojo that doesn't have the URLConnection class. Simply delete this
		  ' method to eliminate the errors.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.ParseResponseHeaders
		  
		  If ResponseHeaders = Nil Then Return
		  Dim h As New InternetHeaders
		  For Each header As Pair In ResponseHeaders
		    h.AddHeader(header.Left, header.Right)
		  Next
		  ParseResponseHeaders(URL, h)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ParseURL(URL As String) As Dictionary
		  ' Pass a URI string to parse. e.g. http://user:password@www.example.com:8080/?foo=bar&bat=baz#Top
		  
		  Dim parsed As New Dictionary
		  Dim isIPv6 As Boolean
		  
		  If InStr(URL, "://") > 0 Then
		    Dim scheme As String = NthField(URL, "://", 1)
		    Parsed.Value("scheme") = DecodeURLComponent(scheme)
		    URL = URL.Replace(scheme + "://", "")
		  End If
		  
		  Dim auth As Integer = Instr(URL, "/")
		  Dim authority As String = URL
		  If auth > 0 Then authority = Left(URL, auth - 1)
		  If InStr(authority, "@") > 0 Then //  USER:PASS@Domain
		    Dim userinfo As String = NthField(authority, "@", 1)
		    authority = authority.Replace(userinfo + "@", "")
		    Dim u, p As String
		    u = NthField(userinfo, ":", 1)
		    p = NthField(userinfo, ":", 2)
		    parsed.Value("username") = DecodeURLComponent(u)
		    parsed.Value("password") = DecodeURLComponent(p)
		    URL = URL.Replace(userinfo + "@", "")
		  End If
		  
		  If Instr(URL, ":") > 0 And Left(URL, 1) <> "[" Then //  Domain:Port
		    Dim s As String = NthField(URL, ":", 2)
		    s = NthField(s, "?", 1)
		    If InStr(s, "/") > InStr(s, "?") Then
		      s = NthField(s, "?", 1)
		    Else
		      s = NthField(s, "/", 1)
		    End If
		    If Val(s) > 0 Then
		      Dim p As Integer = Val(s)
		      parsed.Value("port") = p
		      URL = URL.Replace(":" + Format(p, "######"), "")
		    End If
		  ElseIf Left(URL, 1) = "[" And InStr(URL, "]:") > 0 Then ' ipv6 with port
		    isIPv6 = True
		    Dim s As String = NthField(URL, "]:", 2)
		    s = NthField(s, "?", 1)
		    Dim p As Integer = Val(s)
		    parsed.Value("port") = p
		    URL = URL.Replace("]:" + Format(p, "######"), "]")
		  ElseIf Left(URL, 1) = "[" And InStr(URL, "]/") > 0 Then ' ipv6 with path
		    isIPv6 = True
		    'URL = URL.Replace("]/", "]")
		  End If
		  
		  If Instr(URL, "#") > 0 Then
		    Dim f As String = NthField(URL, "#", 2)  //    #fragment
		    parsed.Value("fragment") = f
		    URL = URL.Replace("#" + f, "")
		  End If
		  
		  Dim h As String = NthField(URL, "/", 1)  //  [sub.]domain.tld
		  parsed.Value("host") = DecodeURLComponent(h)
		  URL = URL.Replace(h, "")
		  
		  If InStr(URL, "?") > 0 Then
		    Dim p As String = NthField(URL, "?", 1) //    /foo/bar.php
		    parsed.Value("path") = DecodeURLComponent(p)
		    URL = URL.Replace(p + "?", "")
		    
		    Dim a() As String = Split(URL, "&")
		    Dim d As New Dictionary
		    For i As Integer = 0 To UBound(a)
		      Dim l, r As String
		      l = NthField(a(i), "=", 1)
		      r = Right(a(i), a(i).Len - (l.Len + 1)).Trim
		      l = l.Trim
		      d.Value(DecodeURLComponent(l)) = DecodeURLComponent(r)
		    Next
		    If d.Count > 0 Then parsed.Value("arguments") = d
		    
		  Else
		    Dim p As String = URL.Trim
		    parsed.Value("path") = DecodeURLComponent(p)
		    URL = Replace(URL, p, "")
		  End If
		  
		  Return parsed
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Path(Index As Integer) As String
		  ' If the cookie has the "path" attribute then it is returned.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.Path
		  
		  Return mCookies(Index).Lookup("path", "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(CookieJar As FolderItem, IncludeSessionCookies As Boolean = False)
		  ' Save all currently known cookies to a file in Netscape cookiejar format.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.Save
		  
		  Dim tos As TextOutputStream = TextOutputStream.Create(CookieJar)
		  tos.Delimiter = EndOfLine.Windows
		  tos.WriteLine("# Netscape HTTP Cookie File")
		  tos.WriteLine("# Domain" + Chr(9) + "Include subdomains" + Chr(9) + "Path" + Chr(9) + "HTTPS only" + Chr(9) + "Expiration" + Chr(9) + "Name" + Chr(9) + "Value")
		  For i As Integer = 0 To UBound(mCookies)
		    Dim d As Dictionary = mCookies(i)
		    Dim secure, hostonly, expires As String
		    If d.Lookup("secure", False) Then secure = "TRUE" Else secure = "FALSE"
		    If d.Lookup("hostonly", False) Then hostonly = "TRUE" Else hostonly = "FALSE"
		    Dim expiry As Date = d.Lookup("expires", Nil)
		    If expiry = Nil Then
		      If Not IncludeSessionCookies Then Continue
		      expires = "0"
		    Else
		      Dim epoch As New Date(1970, 1, 1, 0, 0, 0, 0.0) 'UNIX epoch
		      expires = Format(expiry.TotalSeconds - epoch.TotalSeconds, "###############################0")
		    End If
		    tos.WriteLine(d.Value("domain") + Chr(9) + hostonly + Chr(9) + d.Lookup("path", "/") + Chr(9) + secure _
		    + Chr(9) + expires + Chr(9) + d.Value("name") + Chr(9) + d.Value("value"))
		  Next
		  tos.WriteLine("")
		  tos.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCookie(Name As String, Value As String, Domain As String, Optional Expires As Date, Optional Path As String, Optional HTTPOnly As Boolean, Optional SSLOnly As Boolean)
		  ' Sets a cookie for the cookie engine to use. If a cookie with the same name
		  ' and domain already exists it will be updated.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.SetCookie
		  
		  Dim cookie As Dictionary
		  Dim index As Integer = Me.Lookup(Name, Domain)
		  If index > -1 Then
		    cookie = mCookies(index)
		  Else
		    cookie = New Dictionary
		    mCookies.Append(cookie)
		  End If
		  
		  cookie.Value("name") = DecodeURLComponent(Name)
		  cookie.Value("value") = DecodeURLComponent(Value)
		  cookie.Value("hostonly") = (Domain <> "")
		  Dim d As Dictionary = ParseURL(Domain)
		  Domain = d.Value("host")
		  cookie.Value("domain") = Domain
		  If Expires <> Nil Then cookie.Value("expires") = Expires
		  If Path <> "" Then cookie.Value("path") = Path
		  cookie.Value("hostonly") = False
		  cookie.Value("httponly") = HTTPOnly
		  cookie.Value("secure") = SSLOnly
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SSLOnly(Index As Integer) As Boolean
		  ' If True then this cookie should not be sent over an insecure connection.
		  
		  Return mCookies(Index).Lookup("secure", False)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TimeStamp(DateItem As Date) As String
		  ' Returns an RFC 1123-compliant timestamp for the specified Date
		  
		  Dim dt As String
		  DateItem.GMTOffset = 0
		  Select Case DateItem.DayOfWeek
		  Case 1
		    dt = dt + "Sun, "
		  Case 2
		    dt = dt + "Mon, "
		  Case 3
		    dt = dt + "Tue, "
		  Case 4
		    dt = dt + "Wed, "
		  Case 5
		    dt = dt + "Thu, "
		  Case 6
		    dt = dt + "Fri, "
		  Case 7
		    dt = dt + "Sat, "
		  End Select
		  
		  dt = dt  + Str(DateItem.Day, "00") + " "
		  
		  Select Case DateItem.Month
		  Case 1
		    dt = dt + "Jan "
		  Case 2
		    dt = dt + "Feb "
		  Case 3
		    dt = dt + "Mar "
		  Case 4
		    dt = dt + "Apr "
		  Case 5
		    dt = dt + "May "
		  Case 6
		    dt = dt + "Jun "
		  Case 7
		    dt = dt + "Jul "
		  Case 8
		    dt = dt + "Aug "
		  Case 9
		    dt = dt + "Sep "
		  Case 10
		    dt = dt + "Oct "
		  Case 11
		    dt = dt + "Nov "
		  Case 12
		    dt = dt + "Dec "
		  End Select
		  
		  dt = dt  + Str(DateItem.Year, "0000") + " " + Str(DateItem.Hour, "00") + ":" + Str(DateItem.Minute, "00") + ":" + Str(DateItem.Second, "00") + " GMT"
		  Return dt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TimeStamp(Data As String) As Date
		  
		  'Sat, 29 Oct 1994 19:43:31 GMT
		  Data = ReplaceAll(Data, "-", " ")
		  Dim d As Date
		  Dim members() As String = Split(Data, " ")
		  If UBound(members) = 5 Then
		    Dim dom, mon, year, h, m, s, tz As Integer
		    
		    dom = Val(members(1))
		    
		    Select Case members(2)
		    Case "Jan"
		      mon = 1
		    Case "Feb"
		      mon = 2
		    Case "Mar"
		      mon = 3
		    Case "Apr"
		      mon = 4
		    Case "May"
		      mon = 5
		    Case "Jun"
		      mon = 6
		    Case "Jul"
		      mon = 7
		    Case "Aug"
		      mon = 8
		    Case "Sep"
		      mon = 9
		    Case "Oct"
		      mon = 10
		    Case "Nov"
		      mon = 11
		    Case "Dec"
		      mon = 12
		    End Select
		    
		    year = Val(members(3))
		    
		    Dim time As String = members(4)
		    h = Val(NthField(time, ":", 1))
		    m = Val(NthField(time, ":", 2))
		    s = Val(NthField(time, ":", 3))
		    tz = Val(members(5))
		    
		    
		    
		    d = New Date(year, mon, dom, h, m, s, tz)
		  End If
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(Index As Integer) As String
		  ' Returns the value of the cookie at Index.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.Value
		  
		  Return mCookies(Index).Value("value")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(Index As Integer, Assigns NewValue As String)
		  ' Updates the value of the cookie at Index.
		  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.Value
		  
		  mCookies(Index).Value("value") = NewValue
		End Sub
	#tag EndMethod


	#tag Note, Name = Copying
		MIT License
		
		Copyright (c) 2021-23 Andrew Lambert
		https://github.com/charonn0/Xojo-CookieEngine
		
		Permission is hereby granted, free of charge, to any person obtaining a copy
		of this software and associated documentation files (the "Software"), to deal
		in the Software without restriction, including without limitation the rights
		to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
		copies of the Software, and to permit persons to whom the Software is
		furnished to do so, subject to the following conditions:
		
		The above copyright notice and this permission notice shall be included in all
		copies or substantial portions of the Software.
		
		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
		IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
		FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
		AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
		LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
		OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
		SOFTWARE.
		
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the number of cookies known.
			  ' https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine.Count
			  
			  return UBound(mCookies) + 1
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCookies() As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
