# 参与贡献

## 环境

Windows 上运行 `scripts/build.ps1`。其他系统运行 `scripts/build.sh`。脚本会依次构建并测试 C、C++、Java、Python、C#、Rust、Haskell 和网页示例。

缺某个工具链时，先安装再重跑，不要跳过对应目录后假装通过。

## 改代码时

每种语言都要实现同一组行为，见 `docs/overview.md`：

- 项目名是 `starter`
- `add(2, 3)` 得到 `5`
- 名字会去掉两端空白；空白或空名字得到 `Hello, world`

改了一处行为，就要改全部语言和对应测试。

## 目录约定

- 实现放在该语言惯用的源码目录，不要再把源文件堆在仓库根目录。
- 生成物放进 `build/`、`target/`、`bin/`、`obj/` 或 `dist-newstyle/`，这些目录已被忽略。
- 新增语言时，补上构建文件、至少一个测试，并在 `scripts/build.ps1` 和 `scripts/build.sh` 里各加一步。
