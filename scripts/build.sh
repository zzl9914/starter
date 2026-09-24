#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUILD="$ROOT/build"
mkdir -p "$BUILD"

run() {
  local name="$1"
  shift
  printf '\n== %s ==\n' "$name"
  "$@"
}

run "c test compile" gcc -std=c11 -Wall -Wextra -Werror \
  -I "$ROOT/c/include" \
  "$ROOT/c/src/starter.c" \
  "$ROOT/c/tests/test_starter.c" \
  -o "$BUILD/c-test"
run "c test" "$BUILD/c-test"
run "c demo compile" gcc -std=c11 -Wall -Wextra -Werror \
  -I "$ROOT/c/include" \
  "$ROOT/c/src/starter.c" \
  "$ROOT/c/src/main.c" \
  -o "$BUILD/c-demo"
run "c demo" "$BUILD/c-demo"

run "c++ test compile" g++ -std=c++17 -Wall -Wextra -Werror \
  -I "$ROOT/cpp/include" \
  "$ROOT/cpp/src/starter.cpp" \
  "$ROOT/cpp/tests/test_starter.cpp" \
  -o "$BUILD/cpp-test"
run "c++ test" "$BUILD/cpp-test"
run "c++ demo compile" g++ -std=c++17 -Wall -Wextra -Werror \
  -I "$ROOT/cpp/include" \
  "$ROOT/cpp/src/starter.cpp" \
  "$ROOT/cpp/src/main.cpp" \
  -o "$BUILD/cpp-demo"
run "c++ demo" "$BUILD/cpp-demo"

mkdir -p "$BUILD/java"
mapfile -d '' java_sources < <(find "$ROOT/java" -name '*.java' -print0)
run "java compile" javac --release 17 -encoding UTF-8 -d "$BUILD/java" "${java_sources[@]}"
run "java test" java -cp "$BUILD/java" starter.StarterTest

printf '\n== python test ==\n'
PYTHONPATH="$ROOT/python/src" python -m unittest discover -s "$ROOT/python/tests" -v

run "csharp test" dotnet run --project "$ROOT/csharp/tests/Starter.Tests/Starter.Tests.csproj" --nologo

export CARGO_TARGET_DIR="$ROOT/rust/target"
run "rust test" cargo test --manifest-path "$ROOT/rust/Cargo.toml"
run "rust demo" cargo run --quiet --manifest-path "$ROOT/rust/Cargo.toml"

mkdir -p "$BUILD/hs"
run "haskell compile" ghc -Wall \
  -i"$ROOT/haskell/src" \
  -outputdir "$BUILD/hs" \
  -o "$BUILD/starter-hs" \
  "$ROOT/haskell/app/Main.hs"
run "haskell test" "$BUILD/starter-hs"

run "web test" node --test "$ROOT/web/starter.test.js"

printf '\nall checks passed\n'
