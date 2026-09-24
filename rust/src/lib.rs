pub fn project_name() -> &'static str {
    "starter"
}

pub fn add(a: i32, b: i32) -> i32 {
    a + b
}

pub fn greet(name: &str) -> String {
    let trimmed = name.trim();
    let who = if trimmed.is_empty() { "world" } else { trimmed };
    format!("Hello, {who}")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn adds_integers() {
        assert_eq!(add(2, 3), 5);
        assert_eq!(add(-1, 1), 0);
    }

    #[test]
    fn reports_project_name() {
        assert_eq!(project_name(), "starter");
    }

    #[test]
    fn greets_with_trimmed_name() {
        assert_eq!(greet("Ada"), "Hello, Ada");
        assert_eq!(greet("  Ada  "), "Hello, Ada");
        assert_eq!(greet(""), "Hello, world");
        assert_eq!(greet("   "), "Hello, world");
    }
}
