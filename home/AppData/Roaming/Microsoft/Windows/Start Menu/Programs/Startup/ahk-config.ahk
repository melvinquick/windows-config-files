#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 3

; Variables
A_Home := "C:\users\" . A_UserName
terminal := "C:\Program Files\Alacritty\alacritty.exe"
browser := "C:\Program Files\Waterfox\waterfox.exe"
discord := A_Home . "\AppData\Local\Discord\Update.exe --processStart Discord.exe"
vesktop := A_Home . "\scoop\apps\vesktop\current\Vesktop.exe"
email := A_Home . "\AppData\Local\Programs\ElectronMail\ElectronMail.exe"
messages := A_Home . "\AppData\Local\Programs\Android Messages\Android Messages.exe"
ide := A_Home . "\AppData\Local\Programs\Microsoft VS Code\Code.exe"
steam := "C:\Program Files (x86)\Steam\steam.exe"
heroic := A_Home . "\AppData\Local\Programs\heroic\Heroic.exe"
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

; Open Vesktop
^3::{
    Run(vesktop)
    Return
}

; Open Email Client
^4::{
    Run(email)
    Return
}

; Open Messages
^5::{
    Run(messages)
    Return
}

; Open IDE
^6::{
    Run(ide)
    Return
}

; Open Steam
^7::{
    Run("*RunAs " steam)
    Return
}

; Open Heroic
^8::{
    Run("*RunAs " heroic)
    Return
}

; Open Chris Titus Tech's Windows Utility
^9::{
    Run("*RunAs " cttwinutil)
    Return
}

^q::ExitApp()