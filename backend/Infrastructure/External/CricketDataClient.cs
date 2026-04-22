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
            var content = await response.Content.ReadAsStringAsync();
            var json = JObject.Parse(content);

            // API specific error handling (especially for hit limits)
            if (json["status"]?.ToString() == "failure")
            {
                Console.WriteLine($"[WARNING] Cricket API Hit Limit Exceeded: {json["reason"]}");
                return GetMockMatches();
            }

            if (!response.IsSuccessStatusCode)
            {
                Console.WriteLine($"[ERROR] Cricket API HTTP Error: {response.StatusCode} - {content}");
                throw new Exception($"Cricket API Error: {response.StatusCode}");
            }

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
            Console.WriteLine($"[ERROR] GetCurrentMatchesAsync Exception: {ex.Message}. Falling back to MOCK DATA.");
            return GetMockMatches();
        }
    }

    private List<CricketMatch> GetMockMatches()
    {
        return new List<CricketMatch>
        {
            // CURRENT (LIVE)
            new CricketMatch {
                Id = "mock-1", Name = "India vs Australia, 3rd T20I", MatchType = "t20", 
                Status = "India need 42 runs in 24 balls", Venue = "Wankhede Stadium, Mumbai",
                Team1 = "India", Team1Short = "IND", Team2 = "Australia", Team2Short = "AUS",
                Team1Score = "142/4 (16)", Team2Score = "183/8 (20)",
                MatchStarted = true, MatchEnded = false, Series = "Australia tour of India 2026",
                Team1Image = "https://g.cricapi.com/iapi/13-637877078351545638.webp?w=48",
                Team2Image = "https://g.cricapi.com/iapi/2-637877085731966270.webp?w=48"
            },
            new CricketMatch {
                Id = "mock-2", Name = "Chennai Super Kings vs Mumbai Indians", MatchType = "t20", 
                Status = "MI elected to bat", Venue = "MA Chidambaram Stadium, Chennai",
                Team1 = "Chennai Super Kings", Team1Short = "CSK", Team2 = "Mumbai Indians", Team2Short = "MI",
                Team1Score = "0/0 (0)", Team2Score = "12/0 (1.2)",
                MatchStarted = true, MatchEnded = false, Series = "Indian Premier League 2026",
                Team1Image = "https://g.cricapi.com/iapi/245-637852923053703350.webp?w=48",
                Team2Image = "https://g.cricapi.com/iapi/248-637852920436440263.webp?w=48"
            },
            // UPCOMING
            new CricketMatch {
                Id = "mock-3", Name = "England vs South Africa, 1st ODI", MatchType = "odi", 
                Status = "Starts tomorrow, 10:30 AM", Venue = "The Lord's, London",
                Team1 = "England", Team1Short = "ENG", Team2 = "South Africa", Team2Short = "RSA",
                MatchStarted = false, MatchEnded = false, Series = "South Africa tour of England 2026",
                Team1Image = "https://g.cricapi.com/iapi/1-637877088537242817.webp?w=48",
                Team2Image = "https://g.cricapi.com/iapi/22-637877084511059929.webp?w=48"
            },
            // PAST (FINISHED)
            new CricketMatch {
                Id = "mock-4", Name = "New Zealand vs Pakistan, 2nd Test", MatchType = "test", 
                Status = "NZ won by 7 wickets", Venue = "Basin Reserve, Wellington",
                Team1 = "New Zealand", Team1Short = "NZ", Team2 = "Pakistan", Team2Short = "PAK",
                Team1Score = "342 & 184/3", Team2Score = "312 & 210",
                MatchStarted = true, MatchEnded = true, Series = "Pakistan tour of New Zealand 2026",
                Team1Image = "https://g.cricapi.com/iapi/40-637877080826978648.webp?w=48",
                Team2Image = "https://g.cricapi.com/iapi/24-637877083072186985.webp?w=48"
            }
        };
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
