param (
    $scr_path,
    $sln_path,
    $buildPath
)

Import-Module psake.psm1;
Invoke-psake build.ps1 -task @{scriptsPath=$scr_path;solutionFile=$sln_path;buildPath=$buildPath;workingDirectory=$PWD}