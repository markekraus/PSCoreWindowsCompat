# PSCoreWindowsCompat

Provides the Microsoft.Windows.Compatibility Pack to PowerShell Core on Windows. This module does not provide any functions but serves as a convenient way to add the [Microsoft.Windows.Compatibility Pack](https://blogs.msdn.microsoft.com/dotnet/2017/11/16/announcing-the-windows-compatibility-pack-for-net-core/) to PowerShell Core. This will only work on windows systems in 64-bit [PowerShell Core](https://github.com/PowerShell/PowerShell).

## Installation

The PSCoreWindowsCompat Module is available on the [PowerShell Gallery](https://www.powershellgallery.com/packages/PSCoreWindowsCompat)

```powershell
Install-Module PSCoreWindowsCompat -Scope CurrentUser
```

## Quick Start

```powershell
Install-Module PSCoreWindowsCompat -Scope CurrentUser
Import-Module PSCoreWindowsCompat

# Search AD for the logged in user
$DirectorySearcher = [System.DirectoryServices.DirectorySearcher]"(sAMAccountName=$env:USERNAME)"
$Me = $DirectorySearcher.FindOne()
$Me.Properties['DisplayName']
```

Result:

```none
Mark Kraus
```
