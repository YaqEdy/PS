Write-Host "start Run"

. .\Libs\LGlobal.ps1 
. .\Libs\LSetting.ps1 
$Ds=GetData -query 'Select top 2 * from msuser'

[string]$a = $Ds.tables[0] | Out-String

	<# $MyArray = ForEach($Row in $Data.Tables[0].Rows){
	Write-Host $Data.Tables[0].Columns.ColumnName
	$Record = New-Object PSObject
	ForEach($Col in $Data.Tables[0].Columns.ColumnName){
		Add-Member -InputObject $Record -NotePropertyName $Col -NotePropertyValue $Row.$Col
	}
	$Record
	} #>
			
Write-Host "dt $a"

Write-Host "end Run"

Read-Host -Prompt "Press Enter to exit"
