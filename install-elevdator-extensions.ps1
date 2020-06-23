#Kontrollera om skriptet körs som administratör

if(!$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
    (get-host).UI.RawUI.Backgroundcolor="DarkRed" 
    clear-host 
    write-host 'Detta skript måste köras som administratör.' 
    write-host 'Starta PowerShell med alternativet "Kör som administratör" och försök igen.'     
}
else {
    #Reklamblockerare
    choco install adblockpluschrome
    choco install adblockplus-firefox

    #TillÃ¤gg fÃ¶r Visual Studio Code
    code --install-extension umoxfo.vscode-w3cvalidation
    code --install-extension smelukov.vscode-csstree
    code --install-extension techer.open-in-browser
    code --install-extension ritwickdey.liveserver
    code --install-extension pkief.material-icon-theme

    code --install-extension ms-vscode.powershell
    code --install-extension ms-vscode.python
    code --install-extension felixfbecker.php-intellisense
    code --install-extension redhat.java
    code --install-extension rebornix.ruby

    #Monogame i Visal Studio
    choco install monogame

    #Intellisense för jQuery i VS Code
    npm install -g eslint
    npm install -g webpack
    npm install -g webpack-cli
    npm install --save @types/jquery

    #Kopiera jsconfig.json till varje projektmapp i VS Code
    mkdir c:\temp\jquery
    echo '{"typeAcquisition":{"include":["jquery"]}}' > c:\temp\jquery\jsconfig.json
}
