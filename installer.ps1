if(!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`" `"$($MyInvocation.MyCommand.UnboundArguments)`""
Exit
}

$trigger = New-ScheduledTaskTrigger -AtLogon
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries

$taskName = "GamingMode"
$actions = (New-ScheduledTaskAction -Execute "taskkill" -Argument "/f /im SteamController.exe"),
(New-ScheduledTaskAction -Execute "taskkill" -Argument "/f /im explorer.exe"),
(New-ScheduledTaskAction -Execute "C:\Program Files (x86)\Steam\steam.exe" -Argument "steam://open/bigpicture")
$taskDescription = "Opens Steam in big picture mode"
Register-ScheduledTask -Action $actions -Trigger $trigger -TaskName $taskName -Description $taskDescription -Settings $settings -RunLevel Highest -Force

$taskName = "DesktopMode"
$taskDescription = "Opens Steam"
$trigger = New-ScheduledTaskTrigger -AtStartup
$actions = (New-ScheduledTaskAction -Execute "C:\Program Files\SteamDeckTools\SteamController.exe"),
(New-ScheduledTaskAction -Execute "C:\Program Files (x86)\Steam\steam.exe")

Register-ScheduledTask -Action $actions -Trigger $trigger -TaskName $taskName -Description $taskDescription -Settings $settings -RunLevel Highest -Force

.\iexpress.bat .\LaunchDesktop.bat LaunchDesktop.exe

$base="C:\Users\"
$user=$pwd.path.Substring($base.Length).Substring(0, $pwd.path.Substring("C:\Users\".Length).IndexOf("\"));
$filename="Return to Gaming Mode"

Copy-Item .\gamingmode.bat $base$user\Desktop\$filename.bat
Copy-Item .\gamingmode.bat $base$user\OneDrive\Desktop\$filename.bat