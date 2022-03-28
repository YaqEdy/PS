$source="\\10.162.175.50\!\IntegrasiPelaporan\Landing"
$dest="C:\Installer\PS\file2.txt"

Write-Host "start"
  New-Item $dest
  $files = Get-ChildItem -Path $source -Filter "*.pdf" -Recurse
  ForEach ($file in $files) {
	Add-content $dest $file.FullName
    Write-Host "FullPath : $file.FullName"
  }
Write-Host "end"

Read-Host -Prompt "Press Enter to exit"



