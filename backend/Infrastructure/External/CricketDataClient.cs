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
            var response = await _httpClient.GetAsync($"currentMatches?apikey={ApiKey}");
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
                    matches.Add(MapToMatch(item));
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

    private CricketMatch MapToMatch(JToken item)
    {
        var match = new CricketMatch
        {
            Id = item["id"]?.ToString() ?? string.Empty,
            Name = item["name"]?.ToString() ?? string.Empty,
            MatchType = item["matchType"]?.ToString() ?? string.Empty,
            Status = item["status"]?.ToString() ?? string.Empty,
            Venue = item["venue"]?.ToString() ?? string.Empty,
            FantasyEnabled = item["fantasyEnabled"]?.Value<bool>() ?? false,
            MatchStarted = item["matchStarted"]?.Value<bool>() ?? false,
            MatchEnded = item["matchEnded"]?.Value<bool>() ?? false,
        };

        if (DateTime.TryParse(item["date"]?.ToString() ?? item["dateTimeGMT"]?.ToString(), out var date))
        {
            match.Date = date;
        }

        // Teams & Shortnames from teamInfo
        var teamInfo = item["teamInfo"];
        if (teamInfo != null && teamInfo.Count() >= 2)
        {
            match.Team1 = teamInfo[0]["name"]?.ToString() ?? string.Empty;
            match.Team1Short = teamInfo[0]["shortname"]?.ToString() ?? string.Empty;
            match.Team1Image = teamInfo[0]["img"]?.ToString();

            match.Team2 = teamInfo[1]["name"]?.ToString() ?? string.Empty;
            match.Team2Short = teamInfo[1]["shortname"]?.ToString() ?? string.Empty;
            match.Team2Image = teamInfo[1]["img"]?.ToString();
            
            match.Teams = $"{match.Team1Short} vs {match.Team2Short}";
        }
        else
        {
            var teams = item["teams"]?.Select(t => t.ToString()).ToList() ?? new List<string>();
            match.Team1 = teams.Count > 0 ? teams[0] : "TBD";
            match.Team2 = teams.Count > 1 ? teams[1] : "TBD";
            match.Teams = string.Join(" vs ", teams);
        }

        // Structured Score Mapping
        var scoreArray = item["score"];
        if (scoreArray != null)
        {
            foreach (var s in scoreArray)
            {
                var inning = s["inning"]?.ToString() ?? string.Empty;
                var runs = s["r"]?.ToString() ?? "0";
                var wickets = s["w"]?.ToString() ?? "0";
                var overs = s["o"]?.ToString() ?? "0";
                
                var score = new TeamScore { R = runs, W = wickets, O = overs, Inning = inning };
                match.Score.Add(score);

                // Assign to Team1/Team2 Score based on name match in inning string
                if (!string.IsNullOrEmpty(match.Team1) && inning.Contains(match.Team1, StringComparison.OrdinalIgnoreCase))
                {
                    match.Team1Score = $"{runs}/{wickets} ({overs})";
                }
                else if (!string.IsNullOrEmpty(match.Team2) && inning.Contains(match.Team2, StringComparison.OrdinalIgnoreCase))
                {
                    match.Team2Score = $"{runs}/{wickets} ({overs})";
                }
            }
        }

        return match;
    }
}
