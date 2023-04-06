#Requires AutoHotkey v2.0
#SingleInstance Force

; Variables
localappdata := EnvGet("LocalAppData")
A_Home := "C:\users\" . A_UserName
alacritty := "C:\Program Files\Alacritty\alacritty.exe"
browser := "C:\Program Files\Mozilla Firefox\firefox.exe"
discord := localappdata . "\Discord\Update.exe --processStart Discord.exe"
googlemessages := A_Home . "\scoop\apps\android-messages\current\Android Messages.exe"
vscode := localappdata . "\Programs\Microsoft VS Code\Code.exe"
githubdesktop := localappdata . "\GitHubDesktop\GitHubDesktop.exe"
steam := "C:\Program Files (x86)\Steam\steam.exe"
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

; Open Steam
^7::{
    Run("*RunAs " steam)
    Return
}

; Open Chris Titus Tech's Windows Utility
^8::{
    Run("*RunAs " cttwinutil)
    Return
}

^q::ExitApp()