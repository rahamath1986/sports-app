namespace Application.DTOs;

public class MatchInsightsDto
{
    public double WinProbabilityTeamA { get; set; }
    public double WinProbabilityTeamB { get; set; }
    public string WinInsight { get; set; } = string.Empty;
    public string NextOverPrediction { get; set; } = string.Empty;
    public string AiCommentary { get; set; } = string.Empty;
    public int PredictionStreak { get; set; }
    public double RiskMultiplier { get; set; } = 1.5;
}
