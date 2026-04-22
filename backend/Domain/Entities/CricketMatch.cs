namespace Domain.Entities;

public class CricketMatch
{
    public string Id { get; set; } = string.Empty;
    public string Name { get; set; } = string.Empty;
    public string MatchType { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public string Venue { get; set; } = string.Empty;
    public DateTime Date { get; set; }
    public List<TeamScore> Score { get; set; } = new();
    public string Teams { get; set; } = string.Empty;
    public string Team1 { get; set; } = string.Empty;
    public string Team2 { get; set; } = string.Empty;
    public string Team1Short { get; set; } = string.Empty;
    public string Team2Short { get; set; } = string.Empty;
    public bool FantasyEnabled { get; set; }
    public bool MatchStarted { get; set; }
    public bool MatchEnded { get; set; }

    // New fields for currentMatches API
    public string? Team1Image { get; set; }
    public string? Team2Image { get; set; }
    public string? Team1Score { get; set; }
    public string? Team2Score { get; set; }
}

public class TeamScore
{
    public string R { get; set; } = string.Empty; // Runs
    public string W { get; set; } = string.Empty; // Wickets
    public string O { get; set; } = string.Empty; // Overs
    public string Inning { get; set; } = string.Empty;
}
