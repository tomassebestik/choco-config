# Check if Chocolatey is installed
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    # Install Chocolatey
    Write-Output "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));
}

# Assuming choco-packages.config is in the current directory
# Modify the path below if your config file is located elsewhere
$configPath = ".\choco-packages.config"

# Check if the config file exists
if (Test-Path $configPath) {
    # Install packages from the config file
    Write-Output "Installing packages from choco-packages.config..."
    choco install choco-packages.config -y
}
else {
    Write-Output "Config file not found: $configPath"
}
