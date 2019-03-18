using System.Threading.Tasks;
using MeetingsApi.Dtos;
using MeetingsApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace MeetingsApi.Controllers
{
    [Route("meetings-api/[controller]")]
    [ApiController]
    public class ParticipantsController : ControllerBase
    {
        private readonly IParticipantService _participantService;

        public ParticipantsController(IParticipantService participantService)
        {
            _participantService = participantService;
        }

        [HttpPost]
        public async Task<ActionResult<Participant>> Create([FromBody] Participant dto)
        {
            return await _participantService.CreateParticipantAsync(dto);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            await _participantService.DeleteParticipantAsync(id);
            return Ok();
        }
    }
}
