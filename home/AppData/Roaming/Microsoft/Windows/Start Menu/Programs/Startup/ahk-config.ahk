#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 3

; Variables
A_Home := "C:\users\" . A_UserName
alacritty := A_Home . "\scoop\apps\alacritty\current\alacritty.exe"
browser := A_Home . "\scoop\apps\firefox\current\firefox.exe"
discord := A_Home . "\scoop\apps\discord\current\discord-portable.exe"
googlemessages := A_Home . "\scoop\apps\android-messages\current\Android Messages.exe"
vscode := A_Home . "\scoop\apps\vscode\current\Code.exe"
githubdesktop := A_Home . "\scoop\apps\github\current\GitHubDesktop.exe"
steam := A_Home . "\scoop\apps\steam\current\steam.exe"
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