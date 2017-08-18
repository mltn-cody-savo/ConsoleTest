param (
    $scr_path,
    $sln_path,
    $buildPath
)

Import-Module .\AWS_HelloWord_Pipeline_Test\scripts\psake.psm1;
Invoke-psake  .\AWS_HelloWord_Pipeline_Test\scripts\build.ps1 -task @{scriptsPath=$scr_path;solutionFile=$sln_path;buildPath='package';workingDirectory=$PWD}
