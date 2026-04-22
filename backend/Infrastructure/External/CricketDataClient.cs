using Application.Interfaces;
using Domain.Entities;
using Newtonsoft.Json.Linq;
using System.Net.Http.Json;

namespace Infrastructure.External;

public class CricketDataClient : ICricketDataClient
{
    private readonly HttpClient _httpClient;
    private const string ApiKey = "96882484-10e1-4ad8-b8eb-e9ad1bdb8141";

    public CricketDataClient(HttpClient httpClient)
    {
        _httpClient = httpClient;
        _httpClient.BaseAddress = new Uri("https://api.cricapi.com/v1/");
    }

    public async Task<List<CricketMatch>> GetCurrentMatchesAsync()
    {
        try
        {
            var response = await _httpClient.GetAsync($"cricScore?apikey={ApiKey}");
            if (!response.IsSuccessStatusCode)
            {
                var errorMsg = await response.Content.ReadAsStringAsync();
                Console.WriteLine($"[ERROR] Cricket API HTTP Error: {response.StatusCode} - {errorMsg}");
                throw new Exception($"Cricket API Error: {response.StatusCode}");
            }

            var content = await response.Content.ReadAsStringAsync();
            var json = JObject.Parse(content);
            var data = json["data"];

            var matches = new List<CricketMatch>();
            if (data != null)
            {
                foreach (var item in data)
                {
                    matches.Add(MapToMatch(item, true));
                }
            }

            return matches;
        }
        catch (Exception ex)
        {
            Console.WriteLine($"[ERROR] GetCurrentMatchesAsync Exception: {ex.Message}");
            throw;
        }
    }

    public async Task<CricketMatch?> GetMatchDetailsAsync(string matchId)
    {
        var response = await _httpClient.GetAsync($"match_info?apikey={ApiKey}&id={matchId}");
        if (!response.IsSuccessStatusCode) return null;

        var content = await response.Content.ReadAsStringAsync();
        var json = JObject.Parse(content);
        var data = json["data"];

        return data != null ? MapToMatch(data) : null;
    }

    private CricketMatch MapToMatch(JToken item, bool isCricScore = false)
    {
        var match = new CricketMatch
        {
            Id = item["id"]?.ToString() ?? string.Empty,
            Name = item["name"]?.ToString() ?? string.Empty,
            MatchType = item["matchType"]?.ToString() ?? string.Empty,
            Status = item["status"]?.ToString() ?? string.Empty,
            Venue = item["venue"]?.ToString() ?? string.Empty,
        };

        if (isCricScore)
        {
            // cricScore specific mapping
            match.Team1Image = item["t1img"]?.ToString();
            match.Team2Image = item["t2img"]?.ToString();
            match.Team1Score = item["t1s"]?.ToString();
            match.Team2Score = item["t2s"]?.ToString();
            match.Teams = $"{item["t1"]} vs {item["t2"]}";
        }
        else
        {
            // Standard match_info mapping
            match.Teams = string.Join(" vs ", item["teams"]?.Select(t => t.ToString()) ?? new List<string>());
        }

        if (DateTime.TryParse(item["date"]?.ToString() ?? item["dateTimeGMT"]?.ToString(), out var date))
        {
            match.Date = date;
        }

        var scoreArray = item["score"];
        if (scoreArray != null)
        {
            foreach (var s in scoreArray)
            {
                match.Score.Add(new TeamScore
                {
                    R = s["r"]?.ToString() ?? "0",
                    W = s["w"]?.ToString() ?? "0",
                    O = s["o"]?.ToString() ?? "0",
                    Inning = s["inning"]?.ToString() ?? string.Empty
                });
            }
        }

        return match;
    }
}
