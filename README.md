# starter

多语言模板。C、C++、Java、Python、C#、Rust、Haskell 和网页示例实现同一小组行为：报出项目名、把两个整数相加、按名字打招呼。

## 构建

Windows：

```powershell
./scripts/build.ps1
```

macOS / Linux：

```bash
./scripts/build.sh
```

脚本会编译各语言并运行自带检查。生成物在 `build/`，以及各工具自己的 `target/`、`bin/`、`obj/` 目录。

只构建一种语言时，进入对应目录使用它自己的构建文件，例如 `make -C c test`、`cargo test --manifest-path rust/Cargo.toml`。目录和接口说明在 `docs/overview.md`。各语言适合做什么，见 `docs/languages.md`。

网页示例用了 ES module，需要通过本地服务打开：

```powershell
python -m http.server 8765 --directory web
```

然后访问 `http://127.0.0.1:8765`。

## 行为

- 项目名是 `starter`
- `2 + 3 = 5`
- `greet("Ada")` 得到 `Hello, Ada`
- 空名字、纯空白，以及支持空值的语言里的空值，得到 `Hello, world`

## 布局

```text
c/  cpp/  java/  python/  csharp/  rust/  haskell/  web/
scripts/    一键构建
docs/       接口和目录说明
.github/    持续集成与合并请求模板
```
