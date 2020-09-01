# Get-SteamApp

## Usage
    Import -Name .\Get-SteamApp.psm1
    Get-SteamApp

## Filterng
    Get-SteamApp | Where-Object { $_.AppID -eq 632360 }
    Get-SteamApp | Where-Object { $_.Name -eq "Risk of Rain 2" }

## Install Directory to Variable
    $ror2_dir = (Get-SteamApp | Where-Object { $_.AppID -eq 632360 }).InstallDir
    $ror2_dir = (Get-SteamApp | Where-Object { $_.Name -eq "Risk of Rain 2" }).InstallDir
