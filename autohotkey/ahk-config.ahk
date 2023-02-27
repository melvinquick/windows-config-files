#Requires AutoHotkey v2.0
#SingleInstance Force

; Variables
localappdata := EnvGet("LocalAppData")
alacritty := "C:\Program Files\Alacritty\alacritty.exe"
browser := "C:\Program Files\Mozilla Firefox\firefox.exe"
discord := localappdata . "\Discord\Update.exe --processStart Discord.exe"
googlemessages := localappdata . "\BraveSoftware\Brave-Browser\Application\chrome_proxy.exe --profile-directory=Default --app-id=hpfldicfbfomlpcikngkocigghgafkph"
vscode := localappdata . "\Programs\Microsoft VS Code\Code.exe"
githubdesktop := localappdata . "\GitHubDesktop\GitHubDesktop.exe"
cttwinutil := "pwsh.exe -command `"IRM christitus.com/win | IEX`""

; Open Alacritty
^1::{
        Run("*RunAs " alacritty)
        Return
    }

; Open Brave
^2::{
        Run(browser)
        Return
    }

; Open Discord
^3::{
        Run(discord)
        Return
    }

; Open Messages
^4::{
        Run(googlemessages)
        Return
    }

; Open VS Code
^5::{
        Run(vscode)
        Return
    }

; Open GitHub Desktop
^6::{
        Run(githubdesktop)
        Return
    }

; Open Chris Titus Tech's Windows Utility
^7::{
        Run("*RunAs " cttwinutil)
        Return
    }

    ^q::ExitApp()