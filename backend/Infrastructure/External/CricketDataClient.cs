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
            FantasyEnabled = item["fantasyEnabled"]?.Value<bool>() ?? false,
        };

        if (isCricScore)
        {
            // cricScore mapping (Efficient 1-credit endpoint)
            string t1Raw = item["t1"]?.ToString() ?? string.Empty;
            string t2Raw = item["t2"]?.ToString() ?? string.Empty;

            var (t1Name, t1Short) = ParseTeamName(t1Raw);
            var (t2Name, t2Short) = ParseTeamName(t2Raw);

            match.Team1 = t1Name;
            match.Team1Short = t1Short;
            match.Team2 = t2Name;
            match.Team2Short = t2Short;
            
            match.Team1Image = item["t1img"]?.ToString();
            match.Team2Image = item["t2img"]?.ToString();
            match.Team1Score = item["t1s"]?.ToString();
            match.Team2Score = item["t2s"]?.ToString();
            
            match.Series = item["series"]?.ToString() ?? string.Empty;
            match.Teams = $"{match.Team1Short} vs {match.Team2Short}";

            // Bridge ms status to lifecycle booleans
            string ms = item["ms"]?.ToString() ?? string.Empty;
            match.MatchStarted = ms == "live" || ms == "result";
            match.MatchEnded = ms == "result";
        }
        else
        {
            // currentMatches mapping (Detailed 2-credits endpoint)
            match.MatchStarted = item["matchStarted"]?.Value<bool>() ?? false;
            match.MatchEnded = item["matchEnded"]?.Value<bool>() ?? false;

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

            var scoreArray = item["score"];
            if (scoreArray != null)
            {
                foreach (var s in scoreArray)
                {
                    var inning = s["inning"]?.ToString() ?? string.Empty;
                    var runs = s["r"]?.ToString() ?? "0";
                    var wickets = s["w"]?.ToString() ?? "0";
                    var overs = s["o"]?.ToString() ?? "0";
                    
                    match.Score.Add(new TeamScore { R = runs, W = wickets, O = overs, Inning = inning });

                    if (!string.IsNullOrEmpty(match.Team1) && inning.Contains(match.Team1, StringComparison.OrdinalIgnoreCase))
                        match.Team1Score = $"{runs}/{wickets} ({overs})";
                    else if (!string.IsNullOrEmpty(match.Team2) && inning.Contains(match.Team2, StringComparison.OrdinalIgnoreCase))
                        match.Team2Score = $"{runs}/{wickets} ({overs})";
                }
            }
        }

        if (DateTime.TryParse(item["date"]?.ToString() ?? item["dateTimeGMT"]?.ToString(), out var date))
        {
            match.Date = date;
        }

        return match;
    }

    private (string Name, string Short) ParseTeamName(string raw)
    {
        if (string.IsNullOrEmpty(raw)) return (string.Empty, string.Empty);
        
        var match = System.Text.RegularExpressions.Regex.Match(raw, @"(.*?)\s*\[(.*?)\]");
        if (match.Success)
        {
            return (match.Groups[1].Value.Trim(), match.Groups[2].Value.Trim());
        }
        return (raw.Trim(), string.Empty);
    }
}
