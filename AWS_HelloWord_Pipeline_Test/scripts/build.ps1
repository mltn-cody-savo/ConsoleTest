properties {
    $solutionFile = $null;
    $buildPath = $null;
    $scriptsPath = $null;
    $workingDirectory = $null;
}

task default -depends BuildAndUnitTest

task ValidateProperties {
    Assert ($solutionFile -ne $null) "Solution cannot be null."
}

task Clean -depends ValidateProperties {


    exec {
      . nuget restore $workingDirectory\$solutionFile
      . msbuild $workingDirectory\$solutionFile /t:Clean
    }
}

task Build -depends ValidateProperties, Clean {
  Write-Host Building: $workingDirectory\$solutionFile
  Write-Host OutputPath = $workingDirectory\$buildPath

    exec {
        msbuild $workingDirectory\$solutionFile /t:Build /v:normal /p:OutputPath=$workingDirectory\$buildPath
        Copy-Item $workingDirectory\$scriptsPath\scripts\ $workingDirectory\$buildPath\scripts -Recurse -PassThru | Write-Host;

    }
}

task UnitTest {

}

task BuildAndUnitTest -depends Build, UnitTest