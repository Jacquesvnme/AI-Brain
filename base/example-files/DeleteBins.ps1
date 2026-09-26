$skip = @('node_modules', '.git', '.vs', '.codegraph')

function Remove-BuildFolders {
    param([string]$Path)

    foreach ($dir in Get-ChildItem -LiteralPath $Path -Directory -Force) {
        if ($dir.Name -in $skip) { continue }
        if ($dir.Attributes -band [IO.FileAttributes]::ReparsePoint) { continue }

        if ($dir.Name -in @('bin', 'obj')) {
            Remove-Item -LiteralPath $dir.FullName -Recurse -Force
            Write-Host "Deleted: $($dir.FullName)"
            continue
        }

        Remove-BuildFolders -Path $dir.FullName
    }
}

Remove-BuildFolders -Path (Get-Location).Path