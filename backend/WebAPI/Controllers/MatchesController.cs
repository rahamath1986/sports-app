using Application.Interfaces;
using Application.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers;

[ApiController]
[Route("api/[controller]")]
public class MatchesController : ControllerBase
{
    private readonly ICricketDataClient _cricketDataClient;
    private readonly PredictorService _predictorService;

    public MatchesController(ICricketDataClient cricketDataClient, PredictorService predictorService)
    {
        _cricketDataClient = cricketDataClient;
        _predictorService = predictorService;
    }

    [HttpGet("current")]
    public async Task<IActionResult> GetCurrentMatches()
    {
        var matches = await _cricketDataClient.GetCurrentMatchesAsync();
        return Ok(matches);
    }

    [HttpGet("{id}/insights")]
    public async Task<IActionResult> GetMatchInsights(string id)
    {
        var match = await _cricketDataClient.GetMatchDetailsAsync(id);
        if (match == null) return NotFound();

        var insights = _predictorService.GetMatchInsights(match);
        
        // Enhance commentary for the last status or event
        insights.AiCommentary = _predictorService.EnhanceCommentary(match.Status);

        return Ok(insights);
    }
}
