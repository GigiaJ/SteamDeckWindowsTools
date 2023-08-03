echo "yes" | REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d explorer.exe
echo "yes" | REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell
echo "yes" | REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d ""
taskkill /f /im Steam.exe
explorer.exe
"C:\Program Files (x86)\Steam\Steam.exe"
"C:\Program Files\SteamDeckTools\SteamController.exe"