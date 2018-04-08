If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
  Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
  Break
}

# download chocolatey for easy non-interactive installs
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y vagrant
choco install -y virtualbox

echo "You are now ready for vagrant up"