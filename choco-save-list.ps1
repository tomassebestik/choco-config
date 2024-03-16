# Export-ChocoPackages.ps1
# Check if Chocolatey is installed
if (Get-Command choco -ErrorAction SilentlyContinue) {
    # Export the list of installed Chocolatey packages to choco-packages.config
    choco list --include-programs -r > choco-packages.config
    Write-Host "Export completed successfully. Packages list saved to choco-packages.config"
}
else {
    Write-Host "Chocolatey is not installed. Please install Chocolatey first."
}
