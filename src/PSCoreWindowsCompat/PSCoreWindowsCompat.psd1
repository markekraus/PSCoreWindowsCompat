#
# Module manifest for module 'PSCoreWindowsCompat'
#
# Generated by: Mark Kraus
#
# Generated on: 11/29/2017
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule = 'PSCoreWindowsCompat.dll'

    # Version number of this module.
    ModuleVersion = '0.0.1'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID = 'e428e6fa-4a7e-4531-84b2-aa9452b6b56f'

    # Author of this module
    Author = 'Mark Kraus'

    # Company or vendor of this module
    # CompanyName = 'Unknown'

    # Copyright statement for this module
    Copyright = '(c) Mark Kraus. All rights reserved.'

    # Description of the functionality provided by this module
    Description = 'Provides the Microsoft.Windows.Compatibility Pack to PowerShell Core.'

    # Minimum version of the PowerShell engine required by this module
    # PowerShellVersion = ''

    # Name of the PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    ProcessorArchitecture = 'Amd64'

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    RequiredAssemblies = @(
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

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = '*'

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = '*'

    # Variables to export from this module
    VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = '*'

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @('PSCore', 'Windows')

            # A URL to the license for this module.
            LicenseUri = 'https://github.com/markekraus/PSCoreWindowsCompat/blob/master/LICENSE'

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/markekraus/PSCoreWindowsCompat'

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}
