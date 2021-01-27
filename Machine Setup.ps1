#Import-Module .\InstallApps.psm1
Import-Module .\SetupPowerShellProfile.psm1

$arr = choco list -lo 'Keypirinha'
if ($arr.Contains('1 packages installed.'))
{
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
}

Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');