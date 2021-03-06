﻿using System.Collections.Generic;
using System.Threading.Tasks;
using MeetingsApi.Dtos;

namespace MeetingsApi.Services
{
    public interface IMeetingService
    {
        Task<Meeting> GetMeetingAsync(int id);

        Task<IEnumerable<Meeting>> GetUserMeetingsAsync(int userId);

        Task<IEnumerable<Meeting>> GetCompanyMeetingsAsync(int companyId);

        Task<Meeting> CreateMeetingAsync(Meeting dto);

        Task<Meeting> UpdateMeetingAsync(Meeting dto);

        Task DeleteMeetingAsync(int id);
    }
}
