echo "yes" | REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d explorer.exe
taskkill /f /im Steam.exe
explorer.exe
echo "yes" | REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell
echo "yes" | REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "\"C:\Program Files (x86)\Steam\steam.exe\" steam://open/bigpicture"
schtasks /run /tn "DesktopMode"
