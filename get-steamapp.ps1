function Get-SteamApp {
    $steam_install_paths = @()
    $steam_install_paths += (Get-ItemProperty -Path HKLM:SOFTWARE\WOW6432Node\Valve\Steam).InstallPath
    $lib_path="\steamapps\libraryfolders.vdf"
    if (Test-Path -Path $steam_install_paths$lib_path) {
        $data = Get-Content -Raw -Path $steam_path$lib_path
        $steam_install_paths += ($data | Select-String -Pattern '"[0-9].*"\t\t"(.*)"' -AllMatches).Matches | foreach {$_.Groups[1].Value.Replace('\\', '\')}
    }
    $steam_apps_info = @()
    foreach ($sip in $steam_install_paths) {
        $manifest_paths = Get-ChildItem -name $sip\steamapps -Filter "appmanifest_*.acf"
        foreach ($manifest in $manifest_paths) {
            $data = Get-Content -Raw -Path $sip\steamapps\$manifest
            $app_info = New-Object PSObject -Property @{
                AppID = [int]($data | Select-String -Pattern '.*"appid"\t\t"(.*)"').Matches.Groups[1].ToString()
                Name = [string]($data | Select-String -Pattern '.*"name"\t\t"(.*)"').Matches.Groups[1].ToString()
                InstallDir = [string]($sip+"\steamapps\"+($data | Select-String -Pattern '.*"installdir"\t\t"(.*)"').Matches.Groups[1].ToString())
            }
            $app_info
        }
    }
}
