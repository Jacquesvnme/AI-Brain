# =========================================================================
# Recursively deletes all bin and obj directories from the current directory.
# The node_modules, .git, .vs, and .codegraph directories are skipped, along
# with reparse points. Each deleted directory is written to the console.
# =========================================================================

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
