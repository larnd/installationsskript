#Kontrollera om skriptet körs som administratör
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if(!$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
    (get-host).UI.RawUI.Backgroundcolor="DarkRed" 
    clear-host 
    write-host 'Detta skript måste köras som administratör.' 
    write-host 'Starta PowerShell med alternativet "Kör som administratör" och försök igen.'     
}
else {

    # Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
    choco feature enable -n allowGlobalConfirmation

    # Diverse
    choco install openjdk
    choco install adobereader
    choco install git
    choco install dropbox
    choco install gyazo

    # Programmering 1
    choco install visualstudio2019community
    choco install visualstudio2019-workload-manageddesktop

    # Webbutveckling
    choco install vscode
    choco install nodejs
    choco install googlechrome
    choco install firefox
    choco install microsoft-edge

    # Dator- och natverksteknik
    choco install cpu-z
    choco install gpu-z
    choco install hwinfo
    choco install furmark

    choco install rufus
    choco install virtualbox
    choco install 7zip

    choco install putty
    choco install filezilla
    choco install wireshark

    #Aktivering före installation av WSL (Windows Subsystem Linux)
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

    #Visa filändelser
    $key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
    Set-ItemProperty $key Hidden 1
    Set-ItemProperty $key HideFileExt 0
    Set-ItemProperty $key ShowSuperHidden 1
    Stop-Process -processname explorer
}
