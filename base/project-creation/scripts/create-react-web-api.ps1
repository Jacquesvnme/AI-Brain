param(
    [Parameter(Mandatory)]
    [string]$ProjectName
)

$Framework = "net10.0"

New-Item -ItemType Directory -Path $ProjectName | Out-Null
Set-Location $ProjectName

dotnet new sln --name $ProjectName --format slnx
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Created ${ProjectName}.slnx" -ForegroundColor Green
} else {
    throw "Failed to create ${ProjectName}.slnx"
}

dotnet new reactwebapi --language typescript --output $ProjectName --framework $Framework
if ($LASTEXITCODE -ne 0) {
    throw "Failed to create ${ProjectName}.UI and ${ProjectName}.Api"
}

Set-Location $ProjectName
try {
    Rename-Item -LiteralPath "${ProjectName}.client" -NewName "${ProjectName}.UI" -ErrorAction Stop
    Rename-Item -LiteralPath "${ProjectName}.Server" -NewName "${ProjectName}.Api" -ErrorAction Stop
    Write-Host "✓ Created ${ProjectName}.UI" -ForegroundColor Green
    Write-Host "✓ Created ${ProjectName}.Api" -ForegroundColor Green
} catch {
    throw "Failed to rename the generated UI and API projects: $($_.Exception.Message)"
} finally {
    Set-Location ..
}

dotnet new classlib --name "${ProjectName}.Domain" --output "${ProjectName}/${ProjectName}.Domain" --framework $Framework
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Created ${ProjectName}.Domain" -ForegroundColor Green
} else {
    throw "Failed to create ${ProjectName}.Domain"
}

dotnet new mstest --name "${ProjectName}.Test" --output "${ProjectName}/${ProjectName}.Test" --framework $Framework
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Created ${ProjectName}.Test" -ForegroundColor Green
} else {
    throw "Failed to create ${ProjectName}.Test"
}

$SolutionPath = "${ProjectName}.slnx"
$ProjectPaths = @(
    "${ProjectName}/${ProjectName}.Api/${ProjectName}.Api.csproj"
    "${ProjectName}/${ProjectName}.Domain/${ProjectName}.Domain.csproj"
    "${ProjectName}/${ProjectName}.Test/${ProjectName}.Test.csproj"
    "${ProjectName}/${ProjectName}.UI/${ProjectName}.UI.esproj"
)

foreach ($ProjectPath in $ProjectPaths) {
    dotnet sln $SolutionPath add $ProjectPath

    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Added $ProjectPath to $SolutionPath" -ForegroundColor Green
    } else {
        throw "Failed to add $ProjectPath to $SolutionPath"
    }
}
