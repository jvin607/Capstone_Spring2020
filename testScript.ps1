#Originally written as 'windefend.ps1' by Daniel Contreras
#Attempting to check and see if certain features of Defender are disabled, and if they are, re-enable them
#Will spit out location of exclusion path on system if it exists

Try
{
    $settingsDefender = Get-MpComputerStatus
    $turnOnDefend = Set-MpPreference -DisableRealtimeMonitoring $false
    $turnOnIOAVP = Set-MpPreference -DisableIOAVProtection $false
    $checkPreferences = Get-MpPreference | Select-Object -Property DisableIOAVProtection, DisableRealtimeMonitoring, ExclusionPath
    $updateSignatures = Update-MpSignature -UpdateSource MicrosoftUpdateServer



    if($turnOnDefend -eq $true -or $turnOnIOAVP -eq $true)
    {
        Write-host "Windows Defender was not found running on the computer:" $env:computername -foregroundcolor "Green"
        $turnOnDefend
        $turnOnIOAVP
        $updateSignatures

    }
    else
    {
        Write-host "Windows Defender was found on computer:" $env:computername -foregroundcolor "Red"
        Write-host "   Is Windows Defender Enabled?" $settingsDefender.AntivirusEnabled
        Write-host "   Is Windows Defender Service Enabled?" $settingsDefender.AMServiceEnabled
        Write-host "   Is Windows Defender Antispyware Enabled?" $settingsDefender.AntispywareEnabled
        Write-host "   Is Windows Defender OnAccessProtection Enabled?"$settingsDefender.OnAccessProtectionEnabled
        Write-host "   Is Windows Defender RealTimeProtection Enabled?"$settingsDefender.RealTimeProtectionEnabled
        $turnOnDefend
        $turnOnIOAVP
        Write-Host "   Do Mp-Preference Exceptions exist?"
        $checkPreferences
    }
}
Catch
{
    Write-host "Windows Defender was not found running on the computer:" $env:computername -foregroundcolor "Green"
}
