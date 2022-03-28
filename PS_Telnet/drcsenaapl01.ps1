$test = @('drcbighdp49.corp.bi.go.id:21050',
'drcbighdp50.corp.bi.go.id:2049','drcbighdp50.corp.bi.go.id:4242','drcbighdp50.corp.bi.go.id:111','drcbighdp50.corp.bi.go.id:50579',
'drcbighdp50.corp.bi.go.id:60601',
'corp.bi.go.id:88','corp.bi.go.id:389',
'drcantasqc01.corp.bi.go.id:1433'
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