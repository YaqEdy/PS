$source="E:\tscopy"
$dest = "E:\Fortify\newfolder"
$destTXT="E:\Fortify\newfolder\file2.txt"
$destinationS=""
 try
   {
	 New-Item $destTXT
  
	 $files = Get-ChildItem -Path $source -Filter "*.pdf" -Recurse
	 Write-Host "start"

	 ForEach ($file in $files) {
		 $destinationLog = Join-Path -Path $dest -ChildPath $file.FullName.replace($source,'')
		 $destination = Join-Path -Path $dest -ChildPath $file.FullName.replace($source,'').replace($file.Name,'')
		 Write-Host "destination $destination"
		 if ($destinationS -ne $destination){
			 Copy-Item -Path $file.FullName.replace($file.Name,'') -Destination $destination  -Recurse	
		 }
			 Add-content $destTXT $destinationLog
		 $destinationS=$destination
	 }
 }
  catch [Exception]
   {
     Write-Host $_.Exception.GetType().FullName
     Write-Host $_.Exception.Message
	 
	 Add-content $destTXT $_.Exception.Message
   }
Write-Host "end"

Read-Host -Prompt "Press Enter to exit"



