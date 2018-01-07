@{
    RootModule            = 'PSCoreWindowsCompat.dll'
    ModuleVersion         = '0.0.1'
    GUID                  = 'e428e6fa-4a7e-4531-84b2-aa9452b6b56f'
    Author                = 'Mark Kraus'
    Copyright             = '(c) Mark Kraus. All rights reserved.'
    Description           = 'Provides the Microsoft.Windows.Compatibility Pack to PowerShell Core on 64-bit Windows Only. This module is not supported on non-Windows platforms nor on 32-bit Windows.'
    ProcessorArchitecture = 'Amd64'
    PowerShellVersion     = '6.0.0'
    RequiredAssemblies    = @(
        'System.CodeDom.dll'
        'System.Configuration.ConfigurationManager.dll'
        'System.Data.Odbc.dll'
        'System.Diagnostics.EventLog.dll'
        'System.Diagnostics.PerformanceCounter.dll'
        'System.DirectoryServices.AccountManagement.dll'
        'System.DirectoryServices.dll'
        'System.DirectoryServices.Protocols.dll'
        'System.Drawing.Common.dll'
        'System.IO.Pipes.AccessControl.dll'
        'System.IO.Ports.dll'
        'System.Management.dll'
        'System.Runtime.Caching.dll'
        'System.Security.Cryptography.ProtectedData.dll'
        'System.Security.Cryptography.Xml.dll'
        'System.ServiceModel.Syndication.dll'
    )
    FunctionsToExport     = '*'
    CmdletsToExport       = '*'
    VariablesToExport     = '*'
    AliasesToExport       = '*'
    PrivateData           = @{
        PSData = @{
            Tags         = @('Core', 'PSCore', 'Windows')
            LicenseUri   = 'https://github.com/markekraus/PSCoreWindowsCompat/blob/master/LICENSE'
            ProjectUri   = 'https://github.com/markekraus/PSCoreWindowsCompat'
            ReleaseNotes = '
# 2017-01-07

* Add Version 6.0.0 requirement
* Update description to make it more clear this module is intended only for 64-bit Windows
'
        }
    }
}
