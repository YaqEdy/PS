$test = @('dc1bigcdt01.corp.bi.go.id:d',
'dc1bighdp49.corp.bi.go.id:21050',
'corp.bi.go.id:88','corp.bi.go.id:389',
'dc1antasqc01.corp.bi.go.id:1433',
'dc1bigcdt01.corp.bi.go.id:22',
'utility:21050'
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