Write-Host "start"
$paths="C:\Installer\PS\list_path_copy.txt"
$destTXT="C:\Installer\PS\log_fileCopy2.txt"
$destTXTSP="C:\Installer\PS\log_fileCopySP2.txt"

	New-Item $destTXT
	New-Item $destTXTSP
foreach($path in Get-Content $paths) {
    try{
	    if (Test-Path -path $path)
	    { 
            Write-Host "Isi"
		    $pathSP=$path.replace('\\10.162.175.50\!\IntegrasiPelaporan/Landing','\\10.162.175.50\!\IntegrasiPelaporan/LandingSP')
            $pathCopySP=[System.IO.Path]::GetDirectoryName($path)		
            $pathPasteSP=[System.IO.Path]::GetDirectoryName($pathSP)

	        if (-not(Test-Path -path $pathSP -PathType Leaf))
            {
                Write-Host "Copy $pathCopySP"
                Write-Host "Paste $pathPasteSP"

		        Add-content $destTXT "Copy $pathCopySP"
		        Add-content $destTXT "Paste $pathPasteSP"    
		        Add-content $destTXTSP $pathPasteSP    

                Copy-Item -Path $pathCopySP -Destination $pathPasteSP  -Recurse	    
            }
       
	    }
	    else {
		    Write-Host "Kosong"
		    Add-content $destTXT "Kosong $path"
	    }

    } 
    catch [Exception]
    {
	    Write-Host $_.Exception.Message
	    Add-content $destTXT $_.Exception.Message
    }
}

Write-Host "end"

Read-Host -Prompt "Press Enter to exit"
