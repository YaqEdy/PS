function GetData{
Param(
        [Parameter(Mandatory=$true)]
        $query
    )
	#Write-Host "query $query"
	
	$connString=GetJsonValue -key 'ConnectionString_SQLSERVER'
	try
	{
		$conn = New-Object System.Data.SqlClient.SqlConnection $connString
		$conn.Open()
		$DataSet = New-Object System.Data.DataSet
		if($conn.State -eq "Open")
		{
			$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
			$SqlCmd.CommandText = $query
			$SqlCmd.Connection = $conn
			$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
			$SqlAdapter.SelectCommand = $SqlCmd
			$SqlAdapter.Fill($DataSet)
			$conn.Close()
			return $dataset
		}
	}
	catch [Exception]
	{
		Write-Host "Error $_.Exception.Message"
	}
}