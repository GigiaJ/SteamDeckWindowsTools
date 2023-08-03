echo "yes | schtasks /query /TN "GamingMode_name" >NUL 2>&1 || schTasks /Create /SC ONLOGON /TN "GamingMode" /tr ".\bigpicture.bat" /ru System
iexpress.bat LaunchDesktop.bat LaunchDesktop.exe
steam://AddNonSteamGame