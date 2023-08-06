if(!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`"  `"$($MyInvocation.MyCommand.UnboundArguments)`""
 Exit
}

$actionCommand = "C:\Program Files (x86)\Steam\steam.exe "
$actionArgument = "steam://open/bigpicture"
$action = New-ScheduledTaskAction -Execute $actionCommand -Argument $actionArgument
$trigger = New-ScheduledTaskTrigger -AtLogon
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries

$taskName = "GamingMode"
$taskDescription = "Opens Steam in big picture mode"
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description $taskDescription -Settings $settings -RunLevel Highest -Force

$actionCommand = "C:\Program Files (x86)\Steam\steam.exe"
$taskName = "DesktopModeSteam"
$taskDescription = "Opens Steam"
$action = New-ScheduledTaskAction -Execute $actionCommand -Argument $actionArgument
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description $taskDescription -Settings $settings -RunLevel Highest -Force

$actionCommand = ""
$taskName = "DesktopModeSteamController"
$taskDescription = "Opens the SteamController program"
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description $taskDescription -Settings $settings -RunLevel Highest -Force

.\iexpress.bat .\LaunchDesktop.bat LaunchDesktop.exe

"C:\Program Files (x86)\Steam\steam.exe " + "steam://AddNonSteamGame"