$test = @('smtp.corp.bi.go.id:25',
'dc1antasqc01.corp.bi.go.id:1433',
'dc1senaaptlb.corp.bi.go.id:443',
'dc1senaapllb.corp.bi.go.id:443'
)

Foreach ($t in $test)
{
  $source = $t.Split(':')[0]
  $port = $t.Split(':')[1]
  
  Write-Host "Connecting to $source on port $port"

  try
  {
    $socket = New-Object System.Net.Sockets.TcpClient($source, $port)
  }
  catch [Exception]
  {
    Write-Host $_.Exception.GetType().FullName
    Write-Host $_.Exception.Message
  }

  Write-Host "Connected`n"
}

Read-Host -Prompt "Press Enter to exit"