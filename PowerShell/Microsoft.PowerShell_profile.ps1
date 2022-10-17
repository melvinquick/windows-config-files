# =========
# FUNCTIONS
# =========
#region
function Get-LoggedOnUsers {
  param (
      $ComputerName
  )

  # variables
  $computer = $ComputerName
  $user = @()

  # main
  if ($PSBoundParameters.ContainsKey("ComputerName")) {
      Write-Host "`nComputerName: $computer"
      $user = (&"query" user /SERVER:$computer) -replace "^[\s]USERNAME[\s]+SESSIONNAME.*$", "" -replace "[\s]{2,}", "," -replace ">", "" | ConvertFrom-Csv -Delimiter "," -Header "Username", "SessionName", "Id", "State", "IdleTime", "LogonTime"
      for ($i = 0; $i -lt $user.Count; $i++) {
        if ($null -eq $user[$i].LogonTime) {
          $user[$i].LogonTime = $user[$i].IdleTime
          $user[$i].IdleTime = $user[$i].State
          $user[$i].State = $user[$i].Id
          $user[$i].Id = $user[$i].SessionName
          $user[$i].SessionName = ""
        }
      }
      Write-Output $user
  }
  else {
      $computer = HOSTNAME.EXE
      Write-Host "`nComputerName: $computer"
      $user = (&"query" user) -replace "^[\s]USERNAME[\s]+SESSIONNAME.*$", "" -replace "[\s]{2,}", "," -replace ">", "" | ConvertFrom-Csv -Delimiter "," -Header "Username", "SessionName", "Id", "State", "IdleTime", "LogonTime"
      for ($i = 0; $i -lt $user.Count; $i++) {
        if ($null -eq $user[$i].LogonTime) {
          $user[$i].LogonTime = $user[$i].IdleTime
          $user[$i].IdleTime = $user[$i].State
          $user[$i].State = $user[$i].Id
          $user[$i].Id = $user[$i].SessionName
          $user[$i].SessionName = ""
        }
      }
      Write-Output $user
  }
}

function Get-Profile {
  & $PROFILE
}

function Set-Wallpaper {
  param (
    [string]$Path,
    [ValidateSet('Tile', 'Center', 'Stretch', 'Fill', 'Fit', 'Span')]
    [string]$Style = 'Fill'
  )

  begin {
    try {
      Add-Type @"
              using System;
              using System.Runtime.InteropServices;
              using Microsoft.Win32;
              namespace Wallpaper
              {
                  public enum Style : int
                  {
                    Tile, Center, Stretch, Fill, Fit, Span, NoChange
                  }

                  public class Setter
                  {
                    public const int SetDesktopWallpaper = 20;
                    public const int UpdateIniFile = 0x01;
                    public const int SendWinIniChange = 0x02;
                    [DllImport( "user32.dll", SetLastError = true, CharSet = CharSet.Auto )]
                    private static extern int SystemParametersInfo ( int uAction, int uParam, string lpvParam, int fuWinIni );
                    public static void SetWallpaper ( string path, Wallpaper.Style style )
                      {
                      SystemParametersInfo( SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange );
                      RegistryKey key = Registry.CurrentUser.OpenSubKey( "Control Panel\\Desktop", true );
                      switch( style )
                      {
                        case Style.Tile :
                        key.SetValue( @"WallpaperStyle", "0" ) ;
                        key.SetValue( @"TileWallpaper", "1" ) ;
                        break;
                        case Style.Center :
                        key.SetValue( @"WallpaperStyle", "0" ) ;
                        key.SetValue( @"TileWallpaper", "0" ) ;
                        break;
                        case Style.Stretch :
                        key.SetValue( @"WallpaperStyle", "2" ) ;
                        key.SetValue( @"TileWallpaper", "0" ) ;
                        break;
                        case Style.Fill :
                        key.SetValue( @"WallpaperStyle", "10" ) ;
                        key.SetValue( @"TileWallpaper", "0" ) ;
                        break;
                        case Style.Fit :
                        key.SetValue( @"WallpaperStyle", "6" ) ;
                        key.SetValue( @"TileWallpaper", "0" ) ;
                        break;
                        case Style.Span :
                        key.SetValue( @"WallpaperStyle", "22" ) ;
                        key.SetValue( @"TileWallpaper", "0" ) ;
                        break;
                        case Style.NoChange :
                        break;
                      }
                      key.Close();
                    }
                  }
              }
"@
    }
    catch {}

    $StyleNum = @{
      Tile    = 0
      Center  = 1
      Stretch = 2
      Fill    = 3
      Fit     = 4
      Span    = 5
    }
  }

  process {
    [Wallpaper.Setter]::SetWallpaper($Path, $StyleNum[$Style])

    # sometimes the wallpaper only changes after the second run, so I'll run it twice!
    Start-Sleep -ms 200
    [Wallpaper.Setter]::SetWallpaper($Path, $StyleNum[$Style])
  }
}
#endRegion

# =======
# ALIASES
# =======
#region
Set-Alias -Name GetUsers -Value Get-LoggedOnUsers
Set-Alias -Name ReloadProfile -Value Get-Profile
Set-Alias -Name Wallpaper -Value Set-Wallpaper
#endRegion

# =======
# STARTUP
# =======
#region
Invoke-Expression (&starship init powershell)
Set-Location ~
Clear-Host
Get-Content "~\Documents\PowerShell\banner.txt"
#endRegion

# ==========
# CHOCOLATEY
# ==========
#region
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
#endRegion
