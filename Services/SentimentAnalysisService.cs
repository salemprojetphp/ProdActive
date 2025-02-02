namespace _.Services;

using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

public class SentimentAnalysisService
{
    private readonly HttpClient _httpClient;

    public SentimentAnalysisService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<int?> GetSentimentRating(string message)
    {
        var requestBody = new
        {
            text = message
        };

        var content = new StringContent(JsonConvert.SerializeObject(requestBody), Encoding.UTF8, "application/json");

        var response = await _httpClient.PostAsync("http://localhost:5000/sentiment", content);  // Adjust URL as necessary

        if (response.IsSuccessStatusCode)
        {
            var responseBody = await response.Content.ReadAsStringAsync();
            dynamic jsonResponse = JsonConvert.DeserializeObject(responseBody);

            // Assuming the response JSON is: { "sentiment": "positive" }
            string sentiment = jsonResponse.sentiment;
            
            // Map sentiment to Rating (positive = 1, negative = 0)
            return sentiment == "positive" ? 1 : 0;
        }
        else
        {
            // Handle error, if needed
            return null;
        }
    }
}
