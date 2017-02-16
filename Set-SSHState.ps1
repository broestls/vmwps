###
# Set-SSHState.ps1
#
# Version: 1.1
# Author: Sean Broestl
# Part of collection of PowerCLI scripts at http://github.com/broestls/vmwps/
#
# Takes a VMHost and enables SSH if passed the -Enabled parameter, otherwise
# Disables the SSH service. SSH can be explicitly disabled with the
# -Disable parameter.
###

[cmdletbinding()]
param(
  [Parameter(
    Mandatory=$True,
    Position=1,
    ValueFromPipelineByPropertyName = $true)]
    [string[]]$Name,

  [switch]$Enable,
  [switch]$Disable
)
Process {
  If($Enable) {
    Get-VMHostService -VMHost (Get-VMHost $Name) | ?{$_.Key -eq "TSM-SSH"} | Start-VMHostService -Confirm:$false
  }
  ElseIf(-Not $Enable -Or $Disable) {
    Get-VMHostService -VMHost (Get-VMHost $Name) | ?{$_.Key -eq "TSM-SSH"} | Stop-VMHostService -Confirm:$false
  }
  # Did you run this with both -Enable and -Disable? Default to flipping SSH off.
  Else {
    Get-VMHostService -VMHost (Get-VMHost $Name) | ?{$_.Key -eq "TSM-SSH"} | Stop-VMHostService -Confirm:$false
  }
}
