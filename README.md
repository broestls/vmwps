# vmwps

This is a repository containing various bits of code written to cover routine and not-so-routine tasks in VMware PowerCLI. 

I use PowerShell Core (https://github.com/PowerShell/PowerShell) most of the time, and my scripts are going to be tested and run primarily on that. 

When I have a moment, I'll update this list to define what the various scripts do.

## Set-SSHState.ps1

When you just HAVE to get onto an ESXi host via SSH and you leave the service off by default (smart!), this script allows you to quickly enable or disable the service. Accepts pipeline input from Get-VMHost.

Usage: Set-SSHState.ps1 -Name $vmhost -Enable/-Disable