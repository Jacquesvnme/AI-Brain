# =========================================================================
# Publishes the Desktop project when present, otherwise the API project.
# The output is written to PROJECT_NAME.Deployment in the outer project
# directory. Existing contents in that directory are deleted first.
# =========================================================================

$ErrorActionPreference = 'Stop'

$projectName = Split-Path -Leaf $PSScriptRoot
$sourceDir = Join-Path $PSScriptRoot $projectName

$desktopProjectPath = Join-Path $sourceDir "$projectName.Desktop\$projectName.Desktop.csproj"
$apiProjectPath = Join-Path $sourceDir "$projectName.Api\$projectName.Api.csproj"

if (Test-Path -LiteralPath $desktopProjectPath -PathType Leaf) {
    $projectPath = $desktopProjectPath
}
elseif (Test-Path -LiteralPath $apiProjectPath -PathType Leaf) {
    $projectPath = $apiProjectPath
}
else {
    throw "No Desktop or API project file was found under: $sourceDir"
}

$outputDir = Join-Path $PSScriptRoot "$projectName.Deployment"

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
