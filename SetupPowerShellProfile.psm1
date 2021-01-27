if (Test-Path $PROFILE -eq $false)
{
    New-item –type file –force $profile
}

Get-Content -Path .\Terminal\Microsoft.PowerShell_profile.ps1 | Out-File -FilePath $PROFILE