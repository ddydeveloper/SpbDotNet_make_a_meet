using System.Threading.Tasks;
using MeetingsApi.Dtos;
using MeetingsApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace MeetingsApi.Controllers
{
    [Route("meetings-api/[controller]")]
    [ApiController]
    public class MeetingsController : ControllerBase
    {
        private readonly IMeetingService _meetingService;
        private readonly IParticipantService _participantService;

        public MeetingsController(IMeetingService meetingService, IParticipantService participantService)
        {
            _meetingService = meetingService;
            _participantService = participantService;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Meeting>> Get(int id)
        {
            var meeting = await _meetingService.GetMeetingAsync(id);
            if (meeting == null)
            {
                return NotFound();
            }

            return Ok(meeting);
        }

        [HttpGet("{id}/participants")]
        public async Task<ActionResult<Meeting>> GetParticipants(int id)
        {
            var participants = await _participantService.GetMeetingParticipantsAsync(id);
            return Ok(participants);
        }

        [HttpPost]
        public async Task<ActionResult<Meeting>> Create([FromBody] Meeting dto)
        {
            return await _meetingService.CreateMeetingAsync(dto);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<Meeting>> Update([FromBody] Meeting dto)
        {
            return await _meetingService.UpdateMeetingAsync(dto);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            await _meetingService.DeleteMeetingAsync(id);
            return Ok();
        }
    }
}
