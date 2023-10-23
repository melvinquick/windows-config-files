#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 3

; Variables
A_Home := "C:\users\" . A_UserName
terminal := "C:\Program Files\Alacritty\alacritty.exe"
browser := A_Home . "\AppData\Local\Thorium\Application\thorium.exe"
discord := A_Home . "\AppData\Local\Discord\Update.exe --processStart Discord.exe"
messages := A_Home . "\AppData\Local\Programs\Android Messages\Android Messages.exe"
ide := A_Home . "\AppData\Local\Programs\Microsoft VS Code\Code.exe"
githubdesktop := A_Home . "\AppData\Local\GitHubDesktop\GitHubDesktop.exe"
steam := "C:\Program Files (x86)\Steam\steam.exe"
cttwinutil := "pwsh.exe -command `"IRM christitus.com/win | IEX`""

; Open Terminal
^1::{
    Run("*RunAs " terminal)
    Return
}

; Open Browser
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
    Run(messages)
    Return
}

; Open IDE
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

; Open Chris Titus Tech's Windows Utility
^8::{
    Run("*RunAs " cttwinutil)
    Return
}

^q::ExitApp()