$test = @('dc1bighdp49.corp.bi.go.id:21050',
'dc1bighdp50.corp.bi.go.id:2049', 'dc1bighdp50.corp.bi.go.id:4242', 'dc1bighdp50.corp.bi.go.id:111', 'dc1bighdp50.corp.bi.go.id:50079',
'dc1bighdp50.corp.bi.go.id:60601',
'corp.bi.go.id:88','corp.bi.go.id:389',
'dc1antasqc01.corp.bi.go.id:1433',
'utility:21050',
'edge:2049', 'edge:4242', 'edge:111', 'edge:50079',
'edge:60601'
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