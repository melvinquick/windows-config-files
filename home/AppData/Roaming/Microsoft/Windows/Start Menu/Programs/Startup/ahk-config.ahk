#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 3

; Variables
A_Home := "C:\users\" . A_UserName
terminal := "C:\Program Files\Alacritty\alacritty.exe"
browser := A_Home . "\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe"
discord := A_Home . "\AppData\Local\Discord\Update.exe --processStart Discord.exe"
googlemessages := A_Home . "\AppData\Local\Programs\Android Messages\Android Messages.exe"
ide := A_Home . "\AppData\Local\Programs\Microsoft VS Code\Code.exe"
githubdesktop := A_Home . "\AppData\Local\GitHubDesktop\GitHubDesktop.exe"
steam := "C:\Program Files (x86)\Steam\steam.exe"
email := "C:\Program Files\Mozilla Thunderbird\thunderbird.exe"
cttwinutil := "pwsh.exe -command `"IRM christitus.com/win | IEX`""

; Open Alacritty
^1::{
    Run("*RunAs " terminal)
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
    Run(ide)
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

; Open Email
^8::{
    Run("*RunAs " email)
    Return
}

; Open Chris Titus Tech's Windows Utility
^9::{
    Run("*RunAs " cttwinutil)
    Return
}

^q::ExitApp()