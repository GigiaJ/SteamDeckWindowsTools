Just click the setup.bat and confirm the Run as admin prompt when it appears

Then when the prompt for a add non-steam game, navigate to where you ran the batch (.bat) file and select Launch Desktop

Launch Desktop will now be available in Steam to run and it will enable swapping back to "Desktop Mode" (Just modifies the registry to enable explorer.exe as the default shell and then launches explorer.exe with Steam + SteamController from SteamDeckTools) 

I would recommend adding your drives to the FSTAB in Linux so they're mounted appropriately at boot
Should be something like UUID=IDfromDriveblkidorlsblk-f   mountpointpath ntfs defaults,nofaill,users,uid=1000,gid=1000,rw,exec
nofails is vital
It will also add a shortcut to the desktop called Return to Gaming Mode
