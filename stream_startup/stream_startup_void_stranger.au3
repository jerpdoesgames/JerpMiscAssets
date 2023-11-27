AutoItSetOption("WinTitleMatchMode", 2)

Func MoveClick($aXPos, $aYPos, $aButton = "left")
	MouseMove($aXPos, $aYPos)
	Sleep(250)
	MouseClick($aButton)
	Sleep(100)
EndFunc

Run("C:\Windows\System32\mspaint.exe", "C:\Windows\System32")
WinWaitActive("Paint")
Sleep(250)
WinMove("Paint", 1920-876, 1080-663, 876, 663) ; 16:9
Sleep(250)

$paintPos = WinGetPos("Untitled - Paint")
MoveClick($paintPos[0] + 499, $paintPos[1] + 78) ; Color 2
MoveClick($paintPos[0] + 663, $paintPos[1] + 70) ; Chroma Green
MoveClick($paintPos[0] + 199, $paintPos[1] + 80) ; Paint Bucket
MoveClick($paintPos[0] + 250, $paintPos[1] + 250, "right") ; Flood Fill with Green
MoveClick($paintPos[0] + 456, $paintPos[1] + 78) ; Color 1
MoveClick($paintPos[0] + 621, $paintPos[1] + 93) ; Yellowish
MoveClick($paintPos[0] + 175, $paintPos[1] + 79) ; Pen Tool
MoveClick($paintPos[0] + 402, $paintPos[1] + 79) ; Pen Size Selection
MoveClick($paintPos[0] + 405, $paintPos[1] + 275) ; Select Largest Size

Run("C:\Users\Jerp\AppData\Local\Discord\Update.exe --processStart Discord.exe", "C:\Users\Jerp\AppData\Local\Discord\app-1.0.9024")

Run("explorer.exe D:\obs_local_recordings\void_stranger_screenshots")

Sleep(250)

$VLC_Open_String = "C:\Program Files\VideoLAN\VLC\vlc.exe --no-playlist-autostart"
$VLC_Open_String = $VLC_Open_String & ' "C:\Google_Drive_Jerp\My Drive\void_stranger\void_stranger_ost\Void Stranger OST 01 - Void.mp3"'
$VLC_Open_String = $VLC_Open_String & ' "C:\Google_Drive_Jerp\My Drive\void_stranger\void_stranger_ost\Void Stranger OST 03 - Void Symphony.mp3"'
$VLC_Open_String = $VLC_Open_String & ' "C:\Google_Drive_Jerp\My Drive\void_stranger\void_stranger_ost\Void Stranger OST 38 - A plausible theory.mp3"'

Run($VLC_Open_String, "C:\Program Files\VideoLAN\VLC")

; JerpDoesBots - Microsoft Visual Studio
Run("C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe C:\GitHub\TwitchJerpBot\JerpDoesBots.sln", "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\")
WinWaitActive("JerpDoesBots - Microsoft Visual Studio")
Sleep(4000)
Send("{F5}")
WinWaitActive("JerpDoesBots.exe")
Sleep(1000)

; Twitch/Chrome
Run("C:\Program Files\Google\Chrome\Application\chrome.exe https://dashboard.twitch.tv/u/jerp/stream-manager https://twitch.tv/popout/jerp/reward-queue", "C:\Program Files\Google\Chrome\Application")
WinWaitActive("Twitch")
WinMove("Twitch", 974, 1047, 0, 0)

Sleep(250)
Run("C:\Program Files\Google\Chrome\Application\chrome.exe https://docs.google.com/document/d/1Emz98xOTmylyXUyWWYmzHSYneK6Gjnjrk9KRfYTrCIk/edit#heading=h.em7uf46psi9k", "C:\Program Files\Google\Chrome\Application")
Sleep(250)

Run("C:\Program Files\obs-studio\bin\64bit\obs64.exe --enable-media-stream --use-fake-ui-for-media-stream", "C:\Program Files\obs-studio\bin\64bit")
WinWaitActive("OBS 27.2.4")
Sleep(1000)
WinMove("OBS 27.2.4", 974, 1047, 974, 0)