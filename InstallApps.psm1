$chocolateyAppList = "microsoft-windows-terminal,googlechrome,clipx,greenshot,keypirinha,postman,spotify,dotnetcore-sdk,dotnetcore-windowshosting,visualstudio2019professional"

try{
        choco config get cacheLocation
}catch{
    Write-Output "Chocolatey not detected, trying to install now"
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

if ([string]::IsNullOrWhiteSpace($chocolateyAppList) -eq $false){   
    Write-Host "Chocolatey Apps Specified"  
    
    $appsToInstall = $chocolateyAppList -split "," | foreach { "$($_.Trim())" }

    foreach ($app in $appsToInstall)
    {
        Write-Host "Installing $app"
        & choco upgrade $app /a
    }
}