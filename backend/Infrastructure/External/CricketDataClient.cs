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
        _httpClient.BaseAddress = new Uri("https://api.cricketdata.org/v1/");
    }

    public async Task<List<CricketMatch>> GetCurrentMatchesAsync()
    {
        var response = await _httpClient.GetAsync($"currentMatches?apikey={ApiKey}");
        response.EnsureSuccessStatusCode();

        var content = await response.Content.ReadAsStringAsync();
        var json = JObject.Parse(content);
        var data = json["data"];

        var matches = new List<CricketMatch>();
        if (data != null)
        {
            foreach (var item in data)
            {
                matches.Add(MapToMatch(item));
            }
        }

        return matches;
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

    private CricketMatch MapToMatch(JToken item)
    {
        var match = new CricketMatch
        {
            Id = item["id"]?.ToString() ?? string.Empty,
            Name = item["name"]?.ToString() ?? string.Empty,
            MatchType = item["matchType"]?.ToString() ?? string.Empty,
            Status = item["status"]?.ToString() ?? string.Empty,
            Venue = item["venue"]?.ToString() ?? string.Empty,
            Teams = string.Join(" vs ", item["teams"]?.Select(t => t.ToString()) ?? new List<string>())
        };

        if (DateTime.TryParse(item["date"]?.ToString(), out var date))
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
