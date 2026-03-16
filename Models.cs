namespace WindowsAuthApi.Models;

public record UserInfoDto
{
    public string UserName        { get; init; } = string.Empty;
    public bool   IsAuthenticated { get; init; }
    public string AuthType        { get; init; } = string.Empty;
    public List<ClaimDto> Claims  { get; init; } = [];
}

public record ClaimDto
{
    public string Type  { get; init; } = string.Empty;
    public string Value { get; init; } = string.Empty;
}

public record RoleCheckDto
{
    public string Role     { get; init; } = string.Empty;
    public string UserName { get; init; } = string.Empty;
    public bool   IsInRole { get; init; }
}

public record WeatherForecast
{
    public DateOnly Date         { get; init; }
    public int      TemperatureC { get; init; }
    public string?  Summary      { get; init; }
    public int      TemperatureF => 32 + (int)(TemperatureC / 0.5556);
}
