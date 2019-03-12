using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Dtos;

namespace Api.Services
{
    public interface IUsersService
    {
        Task<User> GetUserAsync(int id);

        Task<IEnumerable<User>> GetCompanyUsersAsync(int companyId);

        Task<Company> GetCompanyAsync(int companyId);
    }
}
