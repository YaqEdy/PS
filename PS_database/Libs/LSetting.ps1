function GetJsonValue
{
    Param(
        [Parameter(Mandatory=$true)]
        $key
    )
		$json = Get-Content -path '.\appsettings.json' | ConvertFrom-Json 
$return=""
	foreach ($obj in $json.PSObject.Properties) {
		if($obj.Name -eq $key){
			$return=$obj.Value
		}
	}
	return $return
}

