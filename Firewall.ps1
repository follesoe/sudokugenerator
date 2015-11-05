if (!(Get-NetFirewallRule | where {$_.Name -eq "TCP80"})) {
    New-NetFirewallRule -Name "TCP80" -DisplayName "HTTP on TCP/80" -Protocol tcp -LocalPort 80 -Action Allow -Enabled True
}

if (!(Get-NetFirewallRule | where {$_.Name -eq "TCP5004"})) {
    New-NetFirewallRule -Name "TCP5004" -DisplayName "HTTP on TCP/5004" -Protocol tcp -LocalPort 5004 -Action Allow -Enabled True
}
