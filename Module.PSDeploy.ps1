Deploy Module {
<#
    By AppVeyorModule {
        FromSource "bin/$ENV:ModuleName"
        To AppVeyor
        WithOptions @{
            Version = $env:APPVEYOR_BUILD_VERSION
        }
    }
#>
    By PSGalleryModule {
        FromSource "bin/$ENV:ModuleName"
        To PSGallery
        WithOptions @{
            ApiKey = $ENV:NugetApiKey
        }
    }
}
