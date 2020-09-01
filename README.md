# Get-SteamApp

## Usage
    Import -Name .\Get-SteamApp.psm1
    Get-SteamApp

## Filterng
### by AppID
    Get-SteamApp | Where-Object { $_.AppID -eq 632360 }
    Get-SteamApp | Where -Property AppID -EQ 632360
### by Name
    Get-SteamApp | Where-Object { $_.Name -EQ "Risk of Rain 2" }
    Get-SteamApp | Where -Property Name -EQ "Risk of Rain 2"

## Install Directory to Variable
    $ror2_dir = (Get-SteamApp | Where -Property AppID -EQ 632360).InstallDir
    $ror2_dir = (Get-SteamApp | Where -Property Name -EQ "Risk of Rain 2").InstallDir
