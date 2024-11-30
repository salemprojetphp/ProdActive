namespace _.Helpers;

public class Helper
{
    public Helper()
    {
    }

    // Method to serialize the data and save to JSON
    public static void intoJsonFile(string path, string data)
    {
        var json = System.Text.Json.JsonSerializer.Serialize(data, new System.Text.Json.JsonSerializerOptions { WriteIndented = true });
        System.IO.File.WriteAllText(path, json);
    }
}