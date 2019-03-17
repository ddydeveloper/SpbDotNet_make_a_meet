using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Dtos;
using Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUsersService _usersService;
        private readonly IMeetingService _meetingService;

        public UsersController(IUsersService usersService, IMeetingService meetingService)
        {
            _usersService = usersService;
            _meetingService = meetingService;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<User>> Get(int id)
        {
            var user = await _usersService.GetUserAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            return Ok(user);
        }

        [HttpGet("{id}/meetings")]
        public async Task<ActionResult<IEnumerable<Meeting>>> GetMeetings(int id)
        {
            var meetings = await _meetingService.GetUserMeetingsAsync(id);
            return Ok(meetings);
        }
    }
}