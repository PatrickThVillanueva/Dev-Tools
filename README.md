# Dev Tools

This repo will contain tools that I use both in private and on my working machine.
This automates the installation of a clean Windows machine, personalized to myself, using Powershell.

## Usage

1. Run Windows Terminal as Admin
2. Run: Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
3. Install-Module -Name Terminal-Icons -Repository PSGallery
4. Add this line to $PROFILE: Import-Module -Name Terminal-Icons
5. Install-Module posh-git -Scope CurrentUser
   Install-Module oh-my-posh -Scope CurrentUser

4. Update "Machine Setup.ps1", "InstallApps.psm1" or "SetupPowerShellProfile.ps1" if necessary.
5. Run "Machine Setup.ps1" as an admin.

## Change Log

### v1.0
- Added Chocolatey commands

## Credits

Me