param ([switch]$Install, [switch]$Force)

# PowerShell theme similar to my.zsh-theme
# Place this file in one of the following locations:
# Windows: ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
# Linux: ~/.config/powershell/Microsoft.PowerShell_profile.ps1

# Check if posh-git is installed, if not, suggest installing it
if (-not (Get-Module -ListAvailable -Name posh-git)) {
    Write-Host "For full git integration, install posh-git module:" -ForegroundColor Yellow
    Write-Host "Install-Module posh-git -Scope CurrentUser -Force" -ForegroundColor Cyan
}

# Function to get Git status using native PowerShell colors
function Get-GitStatus {
    # ANSI Escape Codes
    $esc = "$([char]0x1b)"
    $reset = "$esc[0m"
    $blue = "$esc[34m"
    $yellow = "$esc[33m"

    $gitString = ""
    try {
        $gitStatus = git status -s 2>$null
        if ($LASTEXITCODE -eq 0) {
            $gitBranch = git symbolic-ref --short HEAD 2>$null
            if ($gitBranch) {
                $gitString = " $blue($reset$yellow$gitBranch$blue)$reset"
                if ($gitStatus) {
                    # Dirty repository
                    $gitString += " $yellow✗$reset"
                }
            }
        }
    } catch {
        # Not a git repository or other error
    }
    return $gitString
}

# Custom prompt function
function prompt {
    # Save last exit code
    $lastExitCode = $LASTEXITCODE
    
    # ANSI Escape Codes
    $esc = "$([char]0x1b)"
    $reset = "$esc[0m"
    $green = "$esc[32m"
    $red = "$esc[31m"
    $cyan = "$esc[36m"
    $yellow = "$esc[33m"
    $blue = "$esc[34m"
    
    $promptString = ""
    
    # Arrow color based on last command success
    if ($?) {
        $promptString += "$green$([char]0x279C)$reset " # Green Arrow ➜
    } else {
        $promptString += "$red$([char]0x279C)$reset " # Red Arrow ➜
    }
    
    # Current directory
    $currentDirName = Split-Path -Leaf -Path (Get-Location)
    if ($currentDirName -like '*PS' -and $currentDirName.Length -gt 2) {
        $currentDirName = $currentDirName.Substring(0, $currentDirName.Length - 2)
    }
    $promptString += "$cyan$currentDirName$reset"
    
    # Git status (now returns a string, colors to be added within Get-GitStatus or here)
    $gitPromptPart = Get-GitStatus # This will be like " (branch) ✗" or " (branch)" or "", now pre-colored
    # We need to colorize the parts of $gitPromptPart here if Get-GitStatus doesn't do it internally with ANSI codes
    # For simplicity, let's assume Get-GitStatus will be further modified to include its own ANSI colors for branch, parens, and symbol.
    # For now, let's just append it and color the whole git part yellow as a placeholder.
    if ($gitPromptPart) {
        $promptString += $gitPromptPart # No longer wrapping in $yellow...$reset
    }

    $promptString += " > " # Add the greater-than sign and a space
    
    # Restore the actual last exit code
    $LASTEXITCODE = $lastExitCode
    
    return $promptString
}

# Optional: Enable PSReadLine for better command line editing experience
if (Get-Module -ListAvailable -Name PSReadLine) {
    Import-Module PSReadLine
    
    # Check PSReadLine version for PredictionSource support (v2.1.0+)
    try {
        $psrlModule = Get-Module PSReadLine
        if ($psrlModule) {
            $psrlVersion = $psrlModule.Version
            $hasPredictionSupport = ($psrlVersion.Major -gt 2) -or (($psrlVersion.Major -eq 2) -and ($psrlVersion.Minor -ge 1))
            
            if ($hasPredictionSupport) {
                # Only use PredictionSource if supported
                Set-PSReadLineOption -PredictionSource History
            }
            
            # Add InlinePrediction color only if supported
            if ($hasPredictionSupport) {
                Set-PSReadLineOption -Colors @{ InlinePrediction = 'DarkGray' }
            }
        }
    } catch {
        Write-Host "Error checking PSReadLine version. Some features may be disabled." -ForegroundColor Yellow
    }
    
    # Color settings work with most PSReadLine versions
    Set-PSReadLineOption -Colors @{
        Command            = 'Cyan'
        Parameter          = 'DarkCyan'
        Operator           = 'DarkGray'
        Variable           = 'Green'
        String             = 'Yellow'
        Number             = 'Magenta'
        Member             = 'DarkGreen'
        Type               = 'DarkYellow'
        Comment            = 'DarkGray'
    }
}

# Enable Vi mode for PSReadLine if desired
# Set-PSReadLineOption -EditMode Vi

# Functions for directory navigation (to be used as aliases)
function Set-ReposLocation { Set-Location -Path "C:\repos" }
function Set-DotfilesLocation { Set-Location -Path "C:\repos\dotfiles" }

# Add aliases based on the functions
New-Alias -Name repos -Value Set-ReposLocation -Force
New-Alias -Name dotfiles -Value Set-DotfilesLocation -Force

function Get-MyIP { 
    (Invoke-WebRequest -Uri 'http://ipecho.net/plain' -UseBasicParsing).Content 
}
New-Alias -Name myip -Value Get-MyIP

# Function to install this profile to the correct location
function Install-PowerShellProfile {
    param (
        [switch]$Force
    )
    
    # Define o caminho destino usando $profile
    $profilePath = $profile # Corrected
    $profileDir = Split-Path -Parent $profilePath
    
    # Create the directory if it doesn't exist
    if (-not (Test-Path $profileDir)) {
        Write-Host "Creating profile directory: $profileDir" -ForegroundColor Yellow
        New-Item -Path $profileDir -ItemType Directory -Force | Out-Null
    }
    
    # Check if profile already exists
    if ((Test-Path $profilePath) -and -not $Force) {
        Write-Host "Profile already exists at $profilePath" -ForegroundColor Yellow
        Write-Host "Use -Force to overwrite" -ForegroundColor Yellow
        return
    }
    
    # Get the path of the current script
    $scriptPath = $PSCommandPath
    if (-not $scriptPath) {
        $scriptPath = Join-Path (Get-Location).Path (Split-Path -Leaf $MyInvocation.MyCommand.Path)
    }
    
    # Copy to profile location
    try {
        Copy-Item -Path $scriptPath -Destination $profilePath -Force
        Write-Host "Profile successfully installed to: $profilePath" -ForegroundColor Green
        Write-Host "Restart PowerShell or run '. $profilePath' to apply changes" -ForegroundColor Cyan
    } catch {
        Write-Host "Error installing profile: $_" -ForegroundColor Red
    }
}

Write-Host "Custom theme loaded. Enjoy your PowerShell experience!" -ForegroundColor Green

# Check if this was run as a script or dot-sourced
$isScript = $MyInvocation.InvocationName -eq [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)

# Only show instructions if we're running as a script
if ($isScript) {
    $scriptName = Split-Path -Leaf $MyInvocation.MyCommand.Path
    if (-not $scriptName) {
        $scriptName = "Power.ps1"  # Default fallback name
    }
    Write-Host "To install this profile to the correct location, run: .\$scriptName -Install" -ForegroundColor Cyan
}

# If the Install parameter is specified, run the installation
if ($Install) {
    Write-Host "Installing PowerShell profile..." -ForegroundColor Cyan
    Install-PowerShellProfile -Force:$Force
}
