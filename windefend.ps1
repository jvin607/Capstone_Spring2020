Try
{
    $settingsDefender = Get-MpComputerStatus
    $turnOnDefend = Set-MpPreference -DisableRealtimeMonitoring $false
    $turnOnIOAVP = Set-MpPreference -DisableIOAVProtection $false



    if([string]::IsNullOrEmpty($settingsDefender))
    {
        Write-host "Windows Defender was not found running on the computer:" $env:computername -foregroundcolor "Green"
        $turnOnDefend
        $turnOnIOAVP

    }
    else
    {
        Write-host "Windows Defender was found on computer:" $env:computername -foregroundcolor "Red"
        Write-host "   Is Windows Defender Enabled?" $settingsDefender.AntivirusEnabled
        Write-host "   Is Windows Defender Service Enabled?" $settingsDefender.AMServiceEnabled
        Write-host "   Is Windows Defender Antispyware Enabled?" $settingsDefender.AntispywareEnabled
        Write-host "   Is Windows Defender OnAccessProtection Enabled?"$settingsDefender.OnAccessProtectionEnabled
        Write-host "   Is Windows Defender RealTimeProtection Enabled?"$settingsDefender.RealTimeProtectionEnabled
    }
}
Catch
{
    Write-host "Windows Defender was not found running on the computer:" $env:computername -foregroundcolor "Green"
}
