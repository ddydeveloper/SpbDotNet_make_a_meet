using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Dtos;

namespace Api.Services
{
    public interface IParticipantService
    {
        Task<IEnumerable<Participant>> GetMeetingParticipantsAsync(int meetingId);

        Task<Participant> CreateParticipantAsync(Participant dto);

        Task DeleteParticipantAsync(int id);
    }
}
