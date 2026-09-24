"""Small text helpers shared by the polyglot template."""


def project_name() -> str:
    return "starter"


def add(a: int, b: int) -> int:
    return a + b


def greet(name: str | None = None) -> str:
    trimmed = "" if name is None else name.strip()
    who = "world" if trimmed == "" else trimmed
    return f"Hello, {who}"
