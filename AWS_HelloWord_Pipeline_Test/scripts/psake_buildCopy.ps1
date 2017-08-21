param (
    $scr_path,
    $sln_path,
    $buildPath
)

Set-StrictMode -Version latest
$ErrorActionPreference = 'Stop'

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
	Import-Module .\psake.psm1;
	Invoke-psake  .\build.ps1 -task @{scriptsPath=$scr_path;solutionFile=$sln_path;buildPath='package';workingDirectory=$PWD}
}
catch {
	Write-Host "$pid : Error caught - $_"
	if($? -and (Test-Path variable:LastExitCode) -and $($LASTEXITCODE -gt 0)) {exit $LASTEXITCODE}
	#The $? and $LastExitCode caters to both script and external process calls
	else { exit 1}
}


