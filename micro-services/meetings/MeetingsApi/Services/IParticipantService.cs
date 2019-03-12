using System.Collections.Generic;
using System.Threading.Tasks;
using MeetingsApi.Dtos;

namespace MeetingsApi.Services
{
    public interface IParticipantService
    {
        Task<IEnumerable<Participant>> GetMeetingParticipantsAsync(int meetingId);

        Task<Participant> CreateParticipantAsync(Participant dto);

        Task DeleteParticipantAsync(int id);
    }
}
