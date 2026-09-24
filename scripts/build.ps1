$ErrorActionPreference = "Stop"
$Root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$Build = Join-Path $Root "build"
New-Item -ItemType Directory -Force -Path $Build | Out-Null

function Run {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][scriptblock]$Action
    )
    Write-Host ""
    Write-Host "== $Name =="
    & $Action
    if ($LASTEXITCODE -ne 0) {
        throw "$Name failed with exit code $LASTEXITCODE"
    }
}

$cTest = Join-Path $Build "c-test.exe"
$cDemo = Join-Path $Build "c-demo.exe"
$cInclude = Join-Path $Root "c\include"
Run "c test compile" {
    & gcc -std=c11 -Wall -Wextra -Werror -I $cInclude `
        (Join-Path $Root "c\src\starter.c") `
        (Join-Path $Root "c\tests\test_starter.c") `
        -o $cTest
}
Run "c test" { & $cTest }
Run "c demo compile" {
    & gcc -std=c11 -Wall -Wextra -Werror -I $cInclude `
        (Join-Path $Root "c\src\starter.c") `
        (Join-Path $Root "c\src\main.c") `
        -o $cDemo
}
Run "c demo" { & $cDemo }

$cppTest = Join-Path $Build "cpp-test.exe"
$cppDemo = Join-Path $Build "cpp-demo.exe"
$cppInclude = Join-Path $Root "cpp\include"
Run "c++ test compile" {
    & g++ -std=c++17 -Wall -Wextra -Werror -I $cppInclude `
        (Join-Path $Root "cpp\src\starter.cpp") `
        (Join-Path $Root "cpp\tests\test_starter.cpp") `
        -o $cppTest
}
Run "c++ test" { & $cppTest }
Run "c++ demo compile" {
    & g++ -std=c++17 -Wall -Wextra -Werror -I $cppInclude `
        (Join-Path $Root "cpp\src\starter.cpp") `
        (Join-Path $Root "cpp\src\main.cpp") `
        -o $cppDemo
}
Run "c++ demo" { & $cppDemo }

$javaOut = Join-Path $Build "java"
New-Item -ItemType Directory -Force -Path $javaOut | Out-Null
$javaSources = @(Get-ChildItem -Path (Join-Path $Root "java") -Recurse -Filter *.java | ForEach-Object { $_.FullName })
Run "java compile" { & javac --release 17 -encoding UTF-8 -d $javaOut @javaSources }
Run "java test" { & java -cp $javaOut starter.StarterTest }

Write-Host ""
Write-Host "== python test =="
$env:PYTHONPATH = Join-Path $Root "python\src"
& python -m unittest discover -s (Join-Path $Root "python\tests") -v
if ($LASTEXITCODE -ne 0) {
    throw "python test failed with exit code $LASTEXITCODE"
}

$csharpProject = Join-Path $Root "csharp\tests\Starter.Tests\Starter.Tests.csproj"
Run "csharp test" { & dotnet run --project $csharpProject }

$cargoManifest = Join-Path $Root "rust\Cargo.toml"
$env:CARGO_TARGET_DIR = Join-Path $Root "rust\target"
Run "rust test" { & cargo test --manifest-path $cargoManifest }
Run "rust demo" { & cargo run --quiet --manifest-path $cargoManifest }

$hsOut = Join-Path $Build "hs"
New-Item -ItemType Directory -Force -Path $hsOut | Out-Null
$hsExe = Join-Path $Build "starter-hs.exe"
Run "haskell compile" {
    & ghc -Wall "-i$(Join-Path $Root 'haskell\src')" -outputdir $hsOut -o $hsExe `
        (Join-Path $Root "haskell\app\Main.hs")
}
Run "haskell test" { & $hsExe }

Run "web test" { & node --test (Join-Path $Root "web\starter.test.js") }

Write-Host ""
Write-Host "all checks passed"
