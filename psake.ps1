Properties {
    # Find the build folder based on build system
    $ProjectRoot = $ENV:BHProjectPath
    if (-not $ProjectRoot) {
        $ProjectRoot = (Resolve-Path .).Path
    }

    # Configured in appveyor.yml
    $ModuleName = $ENV:ModuleName
    If (-not $ModuleName) {
        $ModuleName = Split-Path -Path $ProjectRoot -Leaf
    }

    $SrcRoot = Join-Path $ProjectRoot 'src'
    $SrcPath = Join-Path $SrcRoot $ModuleName
    $SrcManifest = Join-Path $SrcPath "$ModuleName.psd1"
    $SrcCsproj = Join-Path $SrcPath "$ModuleName.csproj"
    $BinPath = Join-Path $ProjectRoot 'bin'
    $ModuleFolder = Join-Path $BinPath $ModuleName
    $BinManifest = Join-Path $ModuleFolder "$ModuleName.psd1"


    $PSVersion = $PSVersionTable.PSVersion.Major
    $lines = '----------------------------------------------------------------------'

    $CurrentVersion = [version](Get-Metadata -Path $SrcManifest)
    $BuildVersion = [version]::New($CurrentVersion.Major, $CurrentVersion.Minor, $CurrentVersion.Build, ($CurrentVersion.Revision + 1))
    if ($ENV:BHBranchName -eq "master") {
        $BuildVersion = [version]::New($CurrentVersion.Major, $CurrentVersion.Minor, ($CurrentVersion.Build + 1), 0)
    }
    If ($ENV:BHBranchName -eq "master" -and $ENV:BHCommitMessage -match '!deploy') {
        $GalleryVersion = Get-NextPSGalleryVersion -Name $ModuleName
        $BuildVersion = [version]::New($CurrentVersion.Major, ($CurrentVersion.Minor + 1), 0, 0)
        if (
            $CurrentVersion.Minor    -eq 0 -and
            $CurrentVersion.Build    -eq 0 -and
            $CurrentVersion.Revision -eq 0
        ) {
            #This is a major version release, don't molest the the version
            $BuildVersion = $CurrentVersion
        }
        If ($GalleryVersion -gt $BuildVersion) {
            $BuildVersion = $GalleryVersion
        }
    }
    $BuildDate = Get-Date -uFormat '%Y-%m-%d'
    $DotnetConfiguration = "release"
    $DotnetCLIRequiredVersion = "2.0.0"
    $DotnetRuntime = 'win-x64'

    $PSCoreMSI = "https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-rc.2/PowerShell-6.0.0-rc.2-win-x64.msi"
    $PSCoreInstallPath = "C:\Program Files\PowerShell\6.0.0-rc.2"
}

Task Default -Depends Init, Build, Test, Deploy

Task Init {
    $lines
    Set-Location $ProjectRoot
    "Build System Details:"
    Get-Item ENV:BH* | Format-List
    "`n"
    "Current Version: $CurrentVersion`n"
    "Build Version: $BuildVersion`n"
    "Module Path: $ModuleFolder"
    Find-Dotnet
    "`n"
}

Task Build -Depends Init {
    $lines
    try {
        Push-Location $SrcPath
        New-Item -Path $ModuleFolder -ItemType Directory -ErrorAction SilentlyContinue
        dotnet restore
        dotnet publish --configuration $DotnetConfiguration --runtime $DotnetRuntime --output $ModuleFolder
        Update-Metadata -Path $BinManifest -PropertyName 'ModuleVersion' -Value $BuildVersion
    }
    catch {
        Write-Error "Build Failed: $_"
    }
    finally {
        Pop-Location
        "`n"
    }
}

Task Test -Depends Init {
    $lines
    "`n"
}

Task Deploy -Depends Init, InstallPSCore {
    $lines
    $HasApiKey = -not [String]::IsNullOrEmpty($ENV:NugetApiKey)
    if (
        $ENV:BHBuildSystem   -ne    'Unknown' -and
        $ENV:BHBranchName    -eq    "master"  -and
        $ENV:BHCommitMessage -match '!deploy' -and
        $HasApiKey
    ) {
        {
            Install-Module -Force -Scope CurrentUser -Name PSDeploy
            Invoke-PSDeploy '$ProjectRoot' -Force
        } | pwsh.exe
    }
    else {
        "Skipping deployment: To deploy, ensure that...`n" +
        "`t* You are in a known build system (Current: $ENV:BHBuildSystem)`n" +
        "`t* You are committing to the master branch (Current: $ENV:BHBranchName) `n" +
        "`t* Your commit message includes !deploy (Current: $ENV:BHCommitMessage)"
        "`t* NugetApiKey Environment variable is set (Currently: $HasApiKey)"
    }
    "`n"
}

Task InstallPSCore {
    $lines
    $command = Get-Command pwsh -ErrorAction SilentlyContinue
    if(-not $command)
    {
        'Installing PowerShell Core from {0}' -f $PSCoreMSI
        try {
            $oldPref = $ProgressPreference
            $ProgressPreference = 'SilentlyContinue'
            Invoke-WebRequest -Uri $PSCoreMSI -UseBasicParsing -OutFile "C:\PowerShell-win10-x64.msi"
            Start-Process -FilePath msiexec.exe -ArgumentList '-qn','-i C:\PowerShell-win10-x64.msi','-norestart' -wait
            $env:Path = "{0}{1}{2}" -f $env:Path, ([System.IO.Path]::PathSeparator), $PSCoreInstallPath
        }
        finally {
            $ProgressPreference = $oldPref
        }
    }
    "`n"
}
