reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\real-time protection" /v "DisableRealtimeMonitoring" /t Reg_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\real-time protection" /v "LocalSettingOverrideDisableRealTimeMonitoring" /t Reg_DWORD /d 1 /f
Set-MpPreference -DisableRea $true
