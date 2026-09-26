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

dotnet new console --name "${ProjectName}.Console" --output "${ProjectName}/${ProjectName}.Console" --framework $Framework
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Created ${ProjectName}.Console" -ForegroundColor Green
} else {
    throw "Failed to create ${ProjectName}.Console"
}

$SolutionPath = "${ProjectName}.slnx"
$ProjectPaths = @(
    "${ProjectName}/${ProjectName}.Console/${ProjectName}.Console.csproj"
    "${ProjectName}/${ProjectName}.Domain/${ProjectName}.Domain.csproj"
    "${ProjectName}/${ProjectName}.Test/${ProjectName}.Test.csproj"
)

foreach ($ProjectPath in $ProjectPaths) {
    dotnet sln $SolutionPath add $ProjectPath

    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Added $ProjectPath to $SolutionPath" -ForegroundColor Green
    } else {
        throw "Failed to add $ProjectPath to $SolutionPath"
    }
}
