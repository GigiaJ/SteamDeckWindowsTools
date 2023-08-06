powershell -Command "Unblock-File .\installer.ps1"
powershell -Command "Start-Process cmd -Verb RunAs -ArgumentList '/k cd /d %~dp0 & echo \"yes\" | reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell /v \"ExecutionPolicy\" /d \"unrestricted\" & powershell .\installer.ps1 & exit'"
"C:\Program Files (x86)\Steam\steam.exe " steam://AddNonSteamGame
exit