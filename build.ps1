$ModuleName = "MaterialDesign"

if ($Env:APPVEYOR) {
    $BuildFolder = $env:APPVEYOR_BUILD_FOLDER
} else {
    $BuildFolder = $PSScriptRoot
}

$powerShellGet = Import-Module PowerShellGet  -PassThru -ErrorAction Ignore
if ($powerShellGet.Version -lt ([Version]'1.6.0')) {
	Install-Module PowerShellGet -Scope CurrentUser -Force -AllowClobber
	Import-Module PowerShellGet -Force
}

Set-Location $BuildFolder

$OutputPath = "$BuildFolder\output\UniversalDashboard.$ModuleName"

Remove-Item -Path $OutputPath -Force -ErrorAction SilentlyContinue -Recurse
New-Item -Path $OutputPath -ItemType Directory

Copy-Item "$BuildFolder\UniversalDashboard.$ModuleName.psm1" $OutputPath

$Version = "0.1.1"

$manifestParameters = @{
	Path = "$OutputPath\UniversalDashboard.$ModuleName.psd1"
	Author = "Adam Driscoll"
	CompanyName = "Ironman Software, LLC"
	Copyright = "2017 Ironman Software, LLC"
	RootModule = "UniversalDashboard.$ModuleName.psm1"
	Description = "Material Design components for PowerShell Universal Dashboard."
	ModuleVersion = $version
	Tags = @("universaldashboard", "materialdesign")
	ReleaseNotes = "Initial release"
	LicenseUri = "https://github.com/ironmansoftware/ud-material-design/blob/master/LICENSE"
	ProjectUri = "https://github.com/ironmansoftware/ud-material-design"
	FunctionsToExport = @("New-UDCollection", "New-UDCollectionItem", "New-UDChip")
    CmdletsToExport = @()
    RequiredModules = @("UniversalDashboard")
}

New-ModuleManifest @manifestParameters

if ($prerelease -ne $null) {
	Update-ModuleManifest -Path "$OutputPath\UniversalDashboard.$ModuleName.psd1" -Prerelease $prerelease
} else {
	Update-ModuleManifest -Path "$OutputPath\UniversalDashboard.$ModuleName.psd1"
}

