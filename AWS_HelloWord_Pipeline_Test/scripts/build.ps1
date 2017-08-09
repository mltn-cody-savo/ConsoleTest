properties {
    $solutionFile = $null;
    $buildPath = $null;
    $scriptsPath = $null;
    $workingDirectory = $null;
}

task default -depends BuildAndUnitTest

task ValidateProperties {

}

task Clean -depends ValidateProperties {

}

task Build -depends ValidateProperties, Clean {
    Exec { msbuild $solutionFile }
}

task UnitTest {

}

task BuildAndUnitTest -depends Build, UnitTest