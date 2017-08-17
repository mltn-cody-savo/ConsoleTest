param (
    $scr_path,
    $sln_path,
    $buildPath
)

Import-Module .\AWS_HelloWord_Pipeline_Test\scripts\psake.psm1;
Invoke-psake build.ps1 -task @{scriptsPath=$scr_path;solutionFile=$sln_path;buildPath='package';workingDirectory=$PWD}