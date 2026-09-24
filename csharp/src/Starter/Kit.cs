namespace Starter;

public static class Kit
{
    public const string ProjectName = "starter";

    public static int Add(int a, int b) => a + b;

    public static string Greet(string? name)
    {
        var trimmed = name?.Trim() ?? "";
        var who = trimmed.Length == 0 ? "world" : trimmed;
        return $"Hello, {who}";
    }
}
