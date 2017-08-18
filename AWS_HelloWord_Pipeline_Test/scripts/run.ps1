param(
	[string] $arg1
)
Write-Host "Script:             " $MyInvocation.MyCommand.Path
Write-Host "Pid:                " $PID
Write-Host "Host.Version:       " $Host.Version
Write-Host "Is 64-bit process:  " $([Environment]::Is64BitProcess)
Write-Host "Execution policy:   " $(Get-ExecutionPolicy)
Write-Host "Arg1:               " $arg1