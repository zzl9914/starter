# 结构说明

仓库按语言拆开。每种语言都是一个能独立构建的小模块，对外提供三件事：

| 行为 | 结果 |
| --- | --- |
| 项目名 | `starter` |
| 两数相加 | `add(2, 3)` 为 `5`，`add(-1, 1)` 为 `0` |
| 打招呼 | `greet("Ada")` 为 `Hello, Ada` |
| 空白名字 | 空串、纯空白，以及允许空值的语言里的空值，都得到 `Hello, world` |
| 两端空白 | `greet("  Ada  ")` 为 `Hello, Ada` |

C 没有模块，函数带 `starter_` 前缀，并且由调用方提供缓冲区。缓冲区太小或传入空指针时返回 `-1`。

## 目录

```text
c/          C11 库、命令行入口、Makefile
cpp/        C++17 库、命令行入口、Makefile 与 CMakeLists.txt
java/       Maven 布局，包名 starter
python/     src 布局，pyproject.toml
csharp/     SDK 风格类库和检查程序
rust/       Cargo 库和二进制
haskell/    Cabal 库和可执行文件
web/        静态页面，逻辑与上面相同
scripts/    一键构建
docs/       说明
.github/    持续集成
```

## 入口

| 语言 | 构建 | 检查 |
| --- | --- | --- |
| C | `c/Makefile` 的 `all` | `make -C c test` |
| C++ | `cpp/Makefile` 或 CMake | `make -C cpp test` |
| Java | `java/pom.xml` | `java starter.StarterTest` |
| Python | `python/pyproject.toml` | `python -m unittest` |
| C# | `csharp/Starter.slnx` | `dotnet run --project csharp/tests/Starter.Tests` |
| Rust | `rust/Cargo.toml` | `cargo test` |
| Haskell | `haskell/starter.cabal` | `cabal run starter` |
| Web | `web/package.json` | `node --test` |

日常在仓库根目录执行 `scripts/build.ps1` 或 `scripts/build.sh` 即可，不必逐个进入子目录。

这些语言在真实工程里各自守一层，说明写在 `docs/languages.md`。
