using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using System.Security.Principal;
using WindowsAuthApi.Models;

namespace WindowsAuthApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize]
public class AuthController : ControllerBase
{
    private readonly ILogger<AuthController> _logger;

    public AuthController(ILogger<AuthController> logger)
    {
        _logger = logger;
    }

    /// <summary>
    /// Returns the currently authenticated Windows user.
    /// </summary>
    [HttpGet("me")]
    [ProducesResponseType(typeof(UserInfoDto), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status401Unauthorized)]
    public IActionResult GetCurrentUser()
    {
        var identity = User.Identity as WindowsIdentity
                       ?? new WindowsIdentity(User.Identity?.Name ?? string.Empty);

        var dto = new UserInfoDto
        {
            UserName        = User.Identity?.Name ?? "Unknown",
            IsAuthenticated = User.Identity?.IsAuthenticated ?? false,
            AuthType        = User.Identity?.AuthenticationType ?? "Unknown",
            Claims          = User.Claims.Select(c => new ClaimDto
            {
                Type  = c.Type.Split('/').Last(), // friendly name
                Value = c.Value
            }).ToList()
        };

        _logger.LogInformation("User {User} requested their profile", dto.UserName);
        return Ok(dto);
    }

    /// <summary>
    /// Checks whether the current user is in a specific AD group / role.
    /// Example: GET /api/auth/is-in-role?role=Administrators
    /// </summary>
    [HttpGet("is-in-role")]
    [ProducesResponseType(typeof(RoleCheckDto), StatusCodes.Status200OK)]
    public IActionResult IsInRole([FromQuery] string role)
    {
        var result = new RoleCheckDto
        {
            Role     = role,
            UserName = User.Identity?.Name ?? "Unknown",
            IsInRole = User.IsInRole(role)
        };

        return Ok(result);
    }
}
