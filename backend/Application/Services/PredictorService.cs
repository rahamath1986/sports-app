using Application.DTOs;
using Domain.Entities;

namespace Application.Services;

public class PredictorService
{
    public MatchInsightsDto GetMatchInsights(CricketMatch match)
    {
        var insights = new MatchInsightsDto();

        // 1. Manual Win Probability Formula
        // Simple heuristic: 50 + (Net Run Rate Diff * 10) - (Wickets diff * 5)
        // For Chasing team: Win% = 50 + ((RequiredRR - CurrentRR) * -10) + ((10 - WicketsLost) * 5)
        
        if (match.Score.Count >= 2)
        {
            var chaseInning = match.Score.Last();
            var targetInning = match.Score.First();
            
            double.TryParse(chaseInning.R, out double runsScored);
            double.TryParse(chaseInning.W, out double wicketsLost);
            double.TryParse(chaseInning.O, out double oversDone);
            double.TryParse(targetInning.R, out double target);

            double ballsRemaining = 120 - (Math.Floor(oversDone) * 6 + (oversDone % 1) * 10);
            double runsRequired = target + 1 - runsScored;

            if (ballsRemaining > 0)
            {
                double reqRR = (runsRequired / ballsRemaining) * 6;
                double currRR = oversDone > 0 ? (runsScored / oversDone) : 0;
                
                double winProb = 50 + ((reqRR - 8) * -5) + ((10 - wicketsLost) * 3);
                insights.WinProbabilityTeamB = Math.Clamp(winProb, 5, 95);
                insights.WinProbabilityTeamA = 100 - insights.WinProbabilityTeamB;
                
                insights.WinInsight = winProb > 60 ? "Batting team in control" : (winProb < 40 ? "Bowling team dominating" : "Balanced match");
            }
        }
        else
        {
            insights.WinProbabilityTeamA = 50;
            insights.WinProbabilityTeamB = 50;
            insights.WinInsight = "Game yet to reveal its direction";
        }

        // 2. Next Over Prediction (Manual Heuristic)
        insights.NextOverPrediction = "Likely: 6-9 runs (Powerplay advantage)";

        // 3. Gamification Metadata
        insights.PredictionStreak = 3; // Placeholder example
        insights.RiskMultiplier = 2.5; // High risk match segment

        return insights;
    }

    public string EnhanceCommentary(string rawText)
    {
        // "AI Layer" - Simple Rule-based enhancement
        if (rawText.Contains("1 run")) return "Quick single taken, good running between wickets.";
        if (rawText.Contains("4 runs") || rawText.Contains("FOUR")) return "That's a boundary! Pierced the gap perfectly.";
        if (rawText.Contains("6 runs") || rawText.Contains("SIX")) return "MAXIMUM! Clean strike over the ropes.";
        if (rawText.Contains("WICKET")) return "OUT! The bowling side is ecstatic as the wicket falls!";
        if (rawText.Contains("no run") || rawText.Contains("dot ball")) return "Solid defense, no room given there.";
        
        return rawText;
    }
}
