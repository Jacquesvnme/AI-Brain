# =========================================================================
# CI/CD for easy export and deployment
# Change the $outputDir to the absolute path you want to publish to
# Will delete all previous files and then publish the new files
# =========================================================================

$ErrorActionPreference = 'Stop'

$projectPath = Join-Path $PSScriptRoot 'ModLedger\ModLedger.Desktop\ModLedger.Desktop.csproj'
$outputDir = 'C:\~ My Files\Application-Collection.Deployments\ModLedger'

if (Test-Path -LiteralPath $outputDir) {
    Remove-Item -LiteralPath $outputDir -Recurse -Force
}

New-Item -ItemType Directory -Path $outputDir -Force | Out-Null

dotnet publish $projectPath `
    --configuration Release `
    --runtime win-x64 `
    --self-contained true `
    --output $outputDir `
    --nologo `
    -p:PublishSingleFile=true `
    -p:EnableCompressionInSingleFile=true `
    -p:DebugType=None `
    -p:DebugSymbols=false

if ($LASTEXITCODE -ne 0) {
    throw "Publishing failed with exit code $LASTEXITCODE."
}

Write-Host "Published successfully to: $outputDir"