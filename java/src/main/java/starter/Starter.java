package starter;

public final class Starter {
    private Starter() {
    }

    public static String projectName() {
        return "starter";
    }

    public static int add(int a, int b) {
        return a + b;
    }

    public static String greet(String name) {
        String trimmed = name == null ? "" : name.trim();
        String who = trimmed.isEmpty() ? "world" : trimmed;
        return "Hello, " + who;
    }
}
