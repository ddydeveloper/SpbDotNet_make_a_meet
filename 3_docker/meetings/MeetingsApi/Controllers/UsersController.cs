using System.Collections.Generic;
using System.Threading.Tasks;
using MeetingsApi.Dtos;
using MeetingsApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace MeetingsApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IMeetingService _meetingService;

        public UsersController(IMeetingService meetingService)
        {
            _meetingService = meetingService;
        }

        [HttpGet("{id}/meetings")]
        public async Task<ActionResult<IEnumerable<Meeting>>> GetMeetings(int id)
        {
            var meetings = await _meetingService.GetUserMeetingsAsync(id);
            return Ok(meetings);
        }
    }
}