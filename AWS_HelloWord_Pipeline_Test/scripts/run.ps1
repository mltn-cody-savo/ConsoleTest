Set-StrictMode -Version latest
$ErrorActionPreference = 'Stop'

param(
	[string] $arg1
)

function execute-externaltool
(
  [string] $context,
  [scriptblock] $actionBlock
)
{
  # This function exists to check the exit code for the external tool called within the script block, so we don't have to do this for each call
  & $actionBlock
  if ($LastExitCode -gt 0) { throw "$context : External tool call failed" }
}

try{
	Write-Host "Script:             " $MyInvocation.MyCommand.Path
	Write-Host "Pid:                " $PID
	Write-Host "Host.Version:       " $Host.Version
	Write-Host "Is 64-bit process:  " $([Environment]::Is64BitProcess)
	Write-Host "Execution policy:   " $(Get-ExecutionPolicy)
	Write-Host "Arg1:               " $arg1

	#Query a service that does not exist, sc.exe wil return with a non 0 exit code
	execute-externaltool "Query a non existent service, will return with exit code != 0" {c:\windows\system32\sc.exe query service_does_not_exist }
}
catch {
	Write-Host "$pid : Error caught - $_"
	if($? -and (Test-Path variable:LastExitCode) -and $($LASTEXITCODE -gt 0)) {exit $LASTEXITCODE}
	#The $? and $LastExitCode caters to both script and external process calls
	else { exit 1}

}

