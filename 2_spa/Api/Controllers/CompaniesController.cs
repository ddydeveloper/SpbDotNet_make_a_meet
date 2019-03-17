using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Dtos;
using Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompaniesController : ControllerBase
    {
        private readonly IUsersService _usersService;
        private readonly IMeetingService _meetingService;

        public CompaniesController(IUsersService usersService, IMeetingService meetingService)
        {
            _usersService = usersService;
            _meetingService = meetingService;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Company>> Get(int id)
        {
            return Ok(await _usersService.GetCompanyAsync(id));
        }

        [HttpGet("{id}/users")]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers(int id)
        {
            return Ok(await _usersService.GetCompanyUsersAsync(id));
        }

        [HttpGet("{id}/meetings")]
        public async Task<ActionResult<IEnumerable<Meeting>>> GetMeetings(int id)
        {
            var meetings = await _meetingService.GetCompanyMeetingsAsync(id);
            return Ok(meetings);
        }
    }
}