$arr = choco list -lo 'Keypirinha'
if ($arr.Contains('1 packages installed.'))
{
    Write-Host "Keypirinha was found. Installing configs and packages..."
    $configPath = $env:AppData + "\Keypirinha\User"
    $localKPConfigs = (Get-Location).ToString() + "\Keystroke Launcher\Keypirinha Configs\"
    $files = Get-ChildItem $localKPConfigs
    foreach($file in $files)
    {
        $toCopy = ($localKPConfigs + "\"+ $file)
        Write-Host "Copying " $toCopy
        Copy-Item $toCopy -Destination $configPath
    }

    $installPath = $env:AppData + "\Keypirinha\InstalledPackages"
    $localKPPackages = (Get-Location).ToString() + "\Keystroke Launcher\InstalledPackages\"
    $files = Get-ChildItem $localKPPackages
    foreach($file in $files)
    {
        $toCopy = ($localKPPackages + "\" + $file)
        Write-Host "Copying " $toCopy
        Copy-Item $toCopy -Destination $installPath
    }

    Write-Host "Keypirinha installation done."
}
else
{
    Write-Host "Keypirinha was not found"
}