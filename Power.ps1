param ([switch]$Install, [switch]$Force)

# PowerShell theme similar to my.zsh-theme
# For PowerShell 7+, download from: https://github.com/PowerShell/PowerShell/releases
# Place this file in one of the following locations:
# Windows: ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
# Linux: ~/.config/powershell/Microsoft.PowerShell_profile.ps1

# Check if posh-git is installed, if not, suggest installing it
if (-not (Get-Module -ListAvailable -Name posh-git)) {
    Write-Host "For full git integration, install posh-git module:" -ForegroundColor Yellow
    Write-Host "Install-Module posh-git -Scope CurrentUser -Force" -ForegroundColor Cyan
}

# Check if GitHub Copilot CLI is installed, if not, suggest installing it
if (-not (Get-Command gh -ErrorAction SilentlyContinue) -or -not (gh copilot --version 2>$null)) {
    Write-Host "For GitHub Copilot CLI integration, ensure 'gh' is installed and then run:" -ForegroundColor Yellow
    Write-Host "gh extension install github/gh-copilot" -ForegroundColor Cyan
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
    }
    catch {
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
        $promptString += "$green$([char]0x279C) $reset " # Green Arrow ➜
    }
    else {
        $promptString += "$red$([char]0x279C) $reset " # Red Arrow ➜
    }
    
    # Current directory
    $currentDirName = Split-Path -Leaf -Path (Get-Location)
    $promptString += "$cyan$currentDirName$reset"
    
    # Git status (now returns a string, colors to be added within Get-GitStatus or here)
    $gitPromptPart = Get-GitStatus # This will be like " (branch) ✗" or " (branch)" or "", now pre-colored
    if ($gitPromptPart) {
        $promptString += $gitPromptPart # No longer wrapping in $yellow...$reset
    }

    # Restore the actual last exit code
    $LASTEXITCODE = $lastExitCode
    
    $promptString += " $([char]0x276F) " # Heavy right-pointing angle quotation mark ornament U+276F
    
    return $promptString
}

if (Get-Module -ListAvailable -Name PSReadLine) {
    Import-Module PSReadLine
    
    try {
        $psrlModule = Get-Module PSReadLine
        if ($psrlModule) {
            $psrlVersion = $psrlModule.Version
            $hasPredictionSupport = ($psrlVersion.Major -gt 2) -or (($psrlVersion.Major -eq 2) -and ($psrlVersion.Minor -ge 1))
            
            if ($hasPredictionSupport) {
                Set-PSReadLineOption -PredictionSource History
            }
            
            if ($hasPredictionSupport) {
                Set-PSReadLineOption -Colors @{ InlinePrediction = 'DarkGray' }
            }
        }
    }
    catch {
        Write-Host "Error checking PSReadLine version. Some features may be disabled." -ForegroundColor Yellow
    }
    
    Set-PSReadLineOption -Colors @{
        Command   = 'Cyan'
        Parameter = 'DarkCyan'
        Operator  = 'DarkGray'
        Variable  = 'Green'
        String    = 'Yellow'
        Number    = 'Magenta'
        Member    = 'DarkGreen'
        Type      = 'DarkYellow'
        Comment   = 'DarkGray'
    }
}


# Functions for directory navigation (to be used as aliases)
function Set-ReposLocation { Set-Location -Path "C:\repos" }
function Set-DotfilesLocation { Set-Location -Path "C:\repos\dotfiles" }
function Set-LastLinkLocation { Set-Location -Path "C:\lastlink" }

# Add aliases based on the functions
New-Alias -Name repos -Value Set-ReposLocation -Force
New-Alias -Name dotfiles -Value Set-DotfilesLocation -Force
New-Alias -Name last -Value Set-LastLinkLocation -Force

function Get-MyIP { 
    (Invoke-WebRequest -Uri 'http://ipecho.net/plain' -UseBasicParsing).Content 
}
New-Alias -Name myip -Value Get-MyIP -Force

# GitHub Copilot Aliases
New-Alias -Name ?? -Value ghcs -Force
New-Alias -Name ?! -Value ghce -Force

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
    }
    catch {
        Write-Host "Error installing profile: $_" -ForegroundColor Red
    }
}

function ghcs {
    # Debug support provided by common PowerShell function parameters, which is natively aliased as -d or -db
    # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-7.4#-debug
    param(
        [Parameter()]
        [string]$Hostname,

        [ValidateSet('gh', 'git', 'shell')]
        [Alias('t')]
        [String]$Target = 'shell',

        [Parameter(Position = 0, ValueFromRemainingArguments)]
        [string]$Prompt
    )
    begin {
        # Create temporary file to store potential command user wants to execute when exiting
        $executeCommandFile = New-TemporaryFile

        # Store original value of GH_* environment variable
        $envGhDebug = $Env:GH_DEBUG
        $envGhHost = $Env:GH_HOST
    }
    process {
        if ($PSBoundParameters['Debug']) {
            $Env:GH_DEBUG = 'api'
        }

        $Env:GH_HOST = $Hostname

        gh copilot suggest -t $Target -s "$executeCommandFile" $Prompt
    }
    end {
        # Execute command contained within temporary file if it is not empty
        if ($executeCommandFile.Length -gt 0) {
            # Extract command to execute from temporary file
            $executeCommand = (Get-Content -Path $executeCommandFile -Raw).Trim()

            # Insert command into PowerShell up/down arrow key history
            [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($executeCommand)

            # Insert command into PowerShell history
            $now = Get-Date
            $executeCommandHistoryItem = [PSCustomObject]@{
                CommandLine        = $executeCommand
                ExecutionStatus    = [Management.Automation.Runspaces.PipelineState]::NotStarted
                StartExecutionTime = $now
                EndExecutionTime   = $now.AddSeconds(1)
            }
            Add-History -InputObject $executeCommandHistoryItem

            # Execute command
            Write-Host "`n"
            Invoke-Expression $executeCommand
        }
    }
    clean {
        # Clean up temporary file used to store potential command user wants to execute when exiting
        Remove-Item -Path $executeCommandFile

        # Restore GH_* environment variables to their original value
        $Env:GH_DEBUG = $envGhDebug
    }
}

function ghce {
    # Debug support provided by common PowerShell function parameters, which is natively aliased as -d or -db
    # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-7.5#-debug
    param(
        [Parameter()]
        [string]$Hostname,

        [Parameter(Position = 0, ValueFromRemainingArguments)]
        [string[]]$Prompt
    )
    begin {
        # Store original value of GH_* environment variables
        $envGhDebug = $Env:GH_DEBUG
        $envGhHost = $Env:GH_HOST
    }
    process {
        if ($PSBoundParameters['Debug']) {
            $Env:GH_DEBUG = 'api'
        }

        $Env:GH_HOST = $Hostname

        gh copilot explain $Prompt
    }
    clean {
        # Restore GH_* environment variables to their original value
        $Env:GH_DEBUG = $envGhDebug
        $Env:GH_HOST = $envGhHost
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
