param ($Task = 'Default')

Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

$ModuleInstallScope = 'CurrentUser'
if (-not [String]::IsNullOrEmpty($ENV:APPVEYOR_BUILD_FOLDER)) {
    $ModuleInstallScope = 'AllUsers'
}

Install-Module -Scope $ModuleInstallScope Psake, PSDeploy, BuildHelpers -force
Import-Module Psake, PSDeploy, BuildHelpers

Import-Module .\build.psm1

Set-BuildEnvironment -ErrorAction SilentlyContinue

Invoke-psake -buildFile .\psake.ps1 -taskList $Task -nologo

exit ([int](-not $psake.build_success))
