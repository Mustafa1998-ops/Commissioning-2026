$OutputDir = "C:\GraySentinel_Commissioning\1_Portfolio\Reports\"
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$OutputFile = "$OutputDir\security_events_$Timestamp.csv"
Write-Host "[+] Collecting security events..."
# Collect events
$SuccessLogons = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4624} 
MaxEvents 10
$FailedLogons = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625} 
MaxEvents 10
# Export to CSV
$Events = $SuccessLogons + $FailedLogons
$Events | Select-Object TimeCreated, Id, MachineName, Message | Export-Csv -Path 
$OutputFile -NoTypeInformation
# Display summary
Write-Host "[+] Export complete: $OutputFile"
Write-Host "[+] Success logons: $($SuccessLogons.Count)"
Write-Host "[+] Failed logons: $($FailedLogons.Count)"
Execute the script:
.\event_collector.ps1
