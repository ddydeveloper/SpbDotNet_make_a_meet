namespace Api.Sql
{
    public static class GetRequests
    {
        public const string GetUsers = @"
SELECT *
FROM Users U 
    INNER JOIN Companies C ON U.CompanyId = C.Id
    INNER JOIN Positions P ON U.PositionId = P.Id
";

        public const string GetCompany = @"SELECT * FROM Companies WHERE Id = @Id";

        public const string GetMeeting = @"SELECT * FROM Meetings WHERE Id = @MeetingId";

        public const string GetUserMeetings = @"
SELECT DISTINCT M.* FROM Meetings M
    INNER JOIN Participants P ON P.MeetingId = M.Id
WHERE P.UserId = @UserId";

        public const string GetCompanyMeetings = @"
SELECT DISTINCT M.* FROM Meetings M
    INNER JOIN Participants P ON P.MeetingId = M.Id
WHERE M.CompanyId = @CompanyId";

        public const string GetParticipants = @"SELECT * FROM Participants WHERE MeetingId = @MeetingId";

        public static string GetUser = $@"{GetUsers} WHERE U.Id = @UserId";

        public static string GetCompanyUsers = $@"{GetUsers} WHERE U.CompanyId = @CompanyId";

    }
}
