Deploy Module {
    By PSGalleryModule {
        FromSource $ENV:ModuleName
        To PSGallery
        WithOptions @{
            ApiKey = $ENV:NugetApiKey
        }
    }

    By AppVeyorModule {
        FromSource $ENV:ModuleName
        To AppVeyor
        WithOptions @{
            Version = $env:APPVEYOR_BUILD_VERSION
        }
    }
}
