# Xojo-CookieEngine

The [CookieEngine](https://github.com/charonn0/Xojo-CookieEngine/wiki/CookieEngine) class implements web browser-like HTTP cookie management (a "cookie engine"). It can be used with the Realstudio HTTPSocket, Xojo.Net.HttpSocket, Xojo URLConnection, or any other HTTP client.

If you are on an older version of Xojo (or still using RealStudio) then you must delete the `ParseResponseHeaders(URL As String, ResponseHeaders As Iterable)` method before using this class. Leave the other `ParseResponseHeaders` method intact.

## Example

### Xojo URLConnection
```vbnet
Dim engine As New CookieEngine ' create a new, empty CookieEngine
engine.Load(GetFolderItem("cookies.txt")) ' optionally load cookies from a file
engine.SetCookie("foo", "bar", ".example.com") ' set cookies manually

Dim connection As New URLConnection
Dim url As String = "https://www.example.com/"

' before a request call GenerateRequestHeader() to get a Cookie: header for the URL
Dim cookie As String = engine.GenerateRequestHeader(url)
If cookie <> "" Then connection.RequestHeader("Cookie") = cookie

Call connection.SendSync("GET", url, 10)

' after a request call ParseResponseHeaders() to collect any cookies that were set
engine.ParseResponseHeaders(url, connection.ResponseHeaders)

' optionally save cookies to a file
engine.Save(GetFolderItem("cookies.txt"))

```

### RealStudio HTTPSecureSocket
```xojo
Dim engine As New CookieEngine ' create a new, empty CookieEngine
engine.Load(GetFolderItem("cookies.txt")) ' optionally load cookies from a file
engine.SetCookie("foo", "bar", ".example.com") ' set cookies manually

Dim connection As New HTTPSecureSocket
Dim url As String = "https://www.example.com/"

' before a request call GenerateRequestHeader() to get a Cookie: header for the URL
Dim cookie As String = engine.GenerateRequestHeader(url)
If cookie <> "" Then connection.SetRequestHeader("Cookie", cookie)

Call connection.Get(url, 10)

' after a request call ParseResponseHeaders() to collect any cookies that were set
engine.ParseResponseHeaders(url, connection.PageHeaders)

' optionally save cookies to a file
engine.Save(GetFolderItem("cookies.txt"))
```
