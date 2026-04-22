using Domain.Entities;

namespace Application.Interfaces;

public interface ICricketDataClient
{
    Task<List<CricketMatch>> GetCurrentMatchesAsync();
    Task<CricketMatch?> GetMatchDetailsAsync(string matchId);
}
