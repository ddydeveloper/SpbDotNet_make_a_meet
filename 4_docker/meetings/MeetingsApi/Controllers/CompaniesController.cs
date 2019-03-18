using System.Collections.Generic;
using System.Threading.Tasks;
using MeetingsApi.Dtos;
using MeetingsApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace MeetingsApi.Controllers
{
    [Route("meetings-api/[controller]")]
    [ApiController]
    public class CompaniesController : ControllerBase
    {
        private readonly IMeetingService _meetingService;

        public CompaniesController(IMeetingService meetingService)
        {
            _meetingService = meetingService;
        }

        [HttpGet("{id}/meetings")]
        public async Task<ActionResult<IEnumerable<Meeting>>> GetMeetings(int id)
        {
            var meetings = await _meetingService.GetCompanyMeetingsAsync(id);
            return Ok(meetings);
        }
    }
}
